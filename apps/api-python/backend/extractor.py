import os
import json
import requests
import re
import pdfplumber
from io import BytesIO
from google import genai
from google.genai import types

api_key = os.environ.get("GEMINI_API_KEY")
client = genai.Client(api_key=api_key)

def clean_float(valor):
    """Limpa valores e trata sinal negativo no final (ex: 6,81-)"""
    if not valor: return 0.0
    try:
        s = str(valor).strip().replace('R$', '').replace(' ', '')
        is_negative = False
        if s.endswith('-'):
            is_negative = True
            s = s[:-1]
        elif s.startswith('-'):
            is_negative = True
            s = s[1:]
            
        v = s.replace('.', '').replace(',', '.') if ',' in s else s
        num = float(v)
        return -num if is_negative else num
    except:
        return 0.0

def safe_int(val, default=0):
    try: return int(abs(clean_float(val)))
    except: return default

def validar_balanco(itens, total_fatura):
    """
    Regra proposta pelo usuário: sum(itens) = total_fatura
    """
    soma_calculada = round(sum(i['valor'] for i in itens), 2)
    diff = round(abs(soma_calculada - total_fatura), 2)
    return diff == 0, soma_calculada

def extrair_dados_fatura(url_pdf):
    try:
        print(f"\n🤖 [AI EXTRACTOR] Baixando PDF: {url_pdf[:60]}...", flush=True)
        req = requests.get(url_pdf, timeout=30)
        req.raise_for_status()
        pdf_content = req.content
        
        # Extração de Medidor via Regex (Fallback fixo)
        with pdfplumber.open(BytesIO(pdf_content)) as pdf:
            p1 = pdf.pages[0].extract_text() or ""
        medidor_match = re.search(r"(\d+-[A-Z]{3}-\d+)", p1)
        medidor_regex = medidor_match.group(1) if medidor_match else "NAO_ENCONTRADO"

        prompt = """
        Atue como um especialista em faturas Enel. Extraia os dados em JSON.
        
        REGRA DE OURO (BALANÇO MATEMÁTICO):
        A soma de todos os itens de faturamento (considerando sinais negativos) DEVE ser IGUAL ao campo 'total_fatura'.
        
        REGRAS PARA ITENS:
        - Liste cada item da tabela 'DESCRIÇÃO DO FATURAMENTO'.
        - Identifique valores negativos (compensações/créditos) pelo sinal '-' após o número (ex: 137,02-).
        - 'itens_faturamento' deve conter: descricao, quantidade, unitario, valor.
        
        REGRAS PARA IDENTIFICAÇÃO (2026):
        - 'codigo_cliente': O SEGUNDO número no campo 'UC' (ex: 1234 / 5678 -> 5678).
        - 'unidade_consumidora': O PRIMEIRO número no campo 'UC'.
        - 'numero_medidor': Padrão 1234567-ABC-123 ou similar.
        
        REGRAS PARA TRIBUTOS E SALDOS:
        - 'tributos': Some PIS/COFINS e ICMS da tabela de tributos.
        - 'saldo_utilizado_mes': Procure 'Saldo utilizado no mês' ou 'Energia Injetada utilizada'.
        - 'saldo_total_atualizado': Procure 'Saldo atualizado para o próximo mês' ou 'Saldo acumulado'.
        - 'media_consumo': Média dos últimos 12 meses (tabela histórico).

        ESTRUTURA JSON EXATA:
        {
          "codigo_cliente": "...",
          "unidade_consumidora": "...",
          "numero_medidor": "...",
          "mes_referencia": "MM/AAAA",
          "total_fatura": 0.0,
          "nr_dias": 0,
          "consumo_kwh": 0,
          "bandeira_tarifaria": "Verde",
          "media_consumo": 0,
          "tributos": 0.0,
          "saldo_utilizado_mes": 0.0,
          "saldo_total_atualizado": 0.0,
          "data_vencimento": "DD/MM/AAAA",
          "proxima_leitura": "DD/MM/AAAA",
          "linha_digitavel": "...",
          "itens_faturamento": [
             {"descricao": "...", "quantidade": 0, "unitario": 0.0, "valor": 0.0}
          ]
        }
        """

        result = client.models.generate_content(
            model="gemini-3.0-preview",
            contents=[prompt, types.Part.from_bytes(data=pdf_content, mime_type="application/pdf")],
            config=types.GenerateContentConfig(response_mime_type="application/json", temperature=0)
        )
        
        data = json.loads(result.text)
        if isinstance(data, list): data = data[0]

        # Tratamento de Itens
        total_pago = clean_float(data.get("total_fatura", 0))
        itens_raw = data.get("itens_faturamento", [])
        itens_limpos = []
        for i in itens_raw:
            v_limpo = clean_float(i.get("valor", 0))
            if v_limpo != 0 or i.get("quantidade"):
                itens_limpos.append({
                    "descricao": i.get("descricao", "SEM_DESCRICAO"),
                    "quantidade": safe_int(i.get("quantidade", 0)),
                    "unitario": abs(clean_float(i.get("unitario", 0))),
                    "valor": v_limpo
                })

        # VALIDAÇÃO DO BALANÇO
        valido, soma = validar_balanco(itens_limpos, total_pago)
        if not valido:
            print(f"⚠️ Alerta de Balanço: Soma AI ({soma}) != Total PDF ({total_pago})")
        else:
            print(f"✅ Balanço Confirmado: {soma} = {total_pago}")

        # CONSOLIDAÇÃO FINAL
        dados_finais = {
            "codigo_cliente": str(data.get("codigo_cliente") or "NAO_ENCONTRADO"),
            "unidade_consumidora": str(data.get("unidade_consumidora") or "NAO_ENCONTRADO"),
            "numero_medidor": (medidor_regex if len(str(data.get("numero_medidor", ""))) < 8 else data.get("numero_medidor")) or medidor_regex,
            "mes_referencia": str(data.get("mes_referencia") or "NAO_ENCONTRADO"),
            "nr_dias": safe_int(data.get("nr_dias"), 30),
            "consumo_kwh": safe_int(data.get("consumo_kwh")),
            "bandeira_tarifaria": str(data.get("bandeira_tarifaria") or "Verde"),
            "media_consumo": safe_int(data.get("media_consumo"), 1),
            "linha_digitavel_enel": str(data.get("linha_digitavel") or "NAO_ENCONTRADO"),
            "tributos": clean_float(data.get("tributos", 0)),
            "ft_enel_com_gd": total_pago,
            "saldo_utilizado_mes": abs(clean_float(data.get("saldo_utilizado_mes", 0))),
            "saldo_total_atualizado": clean_float(data.get("saldo_total_atualizado", 0)),
            "data_vencimento_bruta": data.get("data_vencimento"),
            "proxima_leitura_bruta": data.get("proxima_leitura"),
            "itens_faturamento": itens_limpos
        }

        # Cálculos Derivados
        dados_finais['ft_enel_sem_gd'] = round(sum(i['valor'] for i in itens_limpos if i['valor'] > 0), 2)
        dados_finais['total_itens_compensados'] = round(sum(i['valor'] for i in itens_limpos if i['valor'] < 0), 2)
        
        media = dados_finais['media_consumo'] if dados_finais['media_consumo'] > 0 else 1
        dados_finais['reserva_creditos'] = round(dados_finais['saldo_total_atualizado'] / media, 2)

        return dados_finais

    except Exception as e:
        print(f"🔥 Erro no Extrator: {e}")
        return None
