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
    if not valor: return 0.0
    try:
        limpo = str(valor).strip().replace('R$', '').replace(' ', '')
        if limpo.endswith('-'): limpo = '-' + limpo[:-1]
        v = limpo.replace('.', '').replace(',', '.') if ',' in limpo else limpo
        return float(v)
    except: return 0.0

def extrair_dados_fatura(url_pdf):
    try:
        print(f"\n🚀 [PASSO 1] Baixando PDF: {url_pdf[:60]}...", flush=True)
        try:
            req = requests.get(url_pdf, timeout=30)
            req.raise_for_status()
            pdf_content = req.content
        except Exception as http_err:
            print(f"❌ [ERRO] Falha ao baixar o PDF: {http_err}")
            return None
        
        print("📖 [PASSO 2] Abrindo PDF com pdfplumber...", flush=True)
        with pdfplumber.open(BytesIO(pdf_content)) as pdf:
            p1 = pdf.pages[0].extract_text() or ""
            print(f"✅ Texto extraído ({len(p1)} caracteres)", flush=True)

        medidor_match = re.search(r"(\d+-[A-Z]{3}-\d+)", p1)
        medidor_regex = medidor_match.group(1) if medidor_match else "NAO_ENCONTRADO"

        print("🔍 [PASSO 3] Executando Regex nos itens...", flush=True)
        itens = []
        # Padrão Original (Superior em 2025)
        item_pattern = re.compile(
            r"^(?P<desc>.*?)\s+(?P<unid>kWh|mUC|mPT)\s+(?P<quant>[0-9\.,\-]+)\s+(?P<preco>[0-9\.,\-]+)\s+(?P<valor>[0-9\.,\-]+)",
            re.MULTILINE | re.IGNORECASE
        )
        for match in item_pattern.finditer(p1):
            itens.append({
                "descricao": match.group("desc").strip(),
                "quantidade": int(clean_float(match.group("quant"))),
                "unitario": clean_float(match.group("preco")),
                "valor": clean_float(match.group("valor"))
            })

        # Padrão 2: Captura de CIP
        cip_match = re.search(r"CIP ILUM PUB PREF MUNICIPAL\s+([\d,\.\-]+)", p1, re.IGNORECASE)
        if cip_match:
            itens.append({"descricao": "CIP ILUM PUB PREF MUNICIPAL", "quantidade": 0, "unitario": 0.0, "valor": clean_float(cip_match.group(1))})
        
        print("🤖 [PASSO 4] Chamando Gemini 2.0 Flash para Metadados...", flush=True)
        prompt = """
        Atue como um especialista em faturas Enel. Extraia os dados em JSON.
        
        REGRAS CRÍTICAS PARA IDENTIFICAÇÃO (MUITO IMPORTANTE):
        - 'codigo_cliente': Nas faturas de 2026, o campo 'UC' contém dois números separados por barra (ex: 1234567 / 89012345). O SEGUNDO número (após a barra) é o 'codigo_cliente'. Se encontrar esse formato, use-o. Caso contrário, busque por 'Nº do Cliente'.
        - 'numero_medidor': Procure por um padrão como '12345678' ou '12345678-ABC-123'. Geralmente fica próximo à data de leitura.

        REGRAS CRÍTICAS PARA SALDOS (Busque em todo o texto, especialmente 'Mensagens Importantes'):
        1. 'saldo_utilizado_mes': Procure pelo número que precede ou sucede 'Saldo utilizado no mês' ou 'Energia Injetada utilizada'. Ignore o sinal negativo se houver.
        2. 'saldo_total_atualizado': Procure pelo número associado a 'Saldo atualizado para o próximo mês' ou 'Saldo acumulado'. 
        3. Caso encontre uma frase como 'Saldo atualizado: 123,45 kWh', extraia '123.45'.
                
        REGRAS PARA TRIBUTOS:
        - Localize a linha 'TOTAL' na tabela de tributos.
        - Some os valores das colunas PIS/COFINS e ICMS. Exemplo: se PIS/COFINS é 5.00 e ICMS é 15.00, tributos deve ser 20.00.

        ft_enel_com_gd: valor total da fatura com GD (Procure por 'Total a pagar').

        media_consumo: procure a tabela CONSUMO / kWh, busque os ultimos 12 meses de consumo e calcule a média.
        
        OUTROS CAMPOS: codigo_cliente, numero_medidor, mes_referencia, consumo_kwh, 
        data_vencimento, proxima_leitura, linha_digitavel, nr_dias, bandeira_tarifaria.
        """
        
        result = client.models.generate_content(
            model="gemini-2.0-flash",
            contents=[prompt, types.Part.from_bytes(data=pdf_content, mime_type="application/pdf")],
            config=types.GenerateContentConfig(response_mime_type="application/json", temperature=0)
        )
        
        raw_res = json.loads(result.text)
        ia_data = raw_res[0] if isinstance(raw_res, list) else raw_res

        def safe_int(val, default=0):
            try: return int(clean_float(val))
            except: return default

        # CONSOLIDAÇÃO
        dados_finais = {
            "codigo_cliente": str(ia_data.get("codigo_cliente") or "NAO_ENCONTRADO"),
            "numero_medidor": (medidor_regex if len(str(ia_data.get("numero_medidor", ""))) < 10 else ia_data.get("numero_medidor")) or medidor_regex,
            "mes_referencia": str(ia_data.get("mes_referencia") or "NAO_ENCONTRADO"),
            "nr_dias": safe_int(ia_data.get("nr_dias"), 30),
            "consumo_kwh": safe_int(ia_data.get("consumo_kwh")),
            "bandeira_tarifaria": str(ia_data.get("bandeira_tarifaria") or "Verde"),
            "media_consumo": safe_int(ia_data.get("media_consumo"), 1),
            "linha_digitavel_enel": str(ia_data.get("linha_digitavel") or "NAO_ENCONTRADO"),
            "tributos": clean_float(ia_data.get("tributos", 0)),
            "ft_enel_com_gd": clean_float(ia_data.get("ft_enel_com_gd", 0)),
            "saldo_utilizado_mes": clean_float(ia_data.get("saldo_utilizado_mes", 0)),
            "saldo_total_atualizado": clean_float(ia_data.get("saldo_total_atualizado", 0)),
            "data_vencimento_bruta": ia_data.get("data_vencimento"),
            "proxima_leitura_bruta": ia_data.get("proxima_leitura"),
            "itens_faturamento": itens
        }

        # Cálculos Finais
        dados_finais['ft_enel_sem_gd'] = round(sum(i['valor'] for i in itens if i['valor'] > 0), 2)
        dados_finais['total_itens_compensados'] = round(sum(i['valor'] for i in itens if i['valor'] < 0), 2)
        
        media = dados_finais['media_consumo'] if dados_finais['media_consumo'] > 0 else 1
        dados_finais['reserva_creditos'] = round(dados_finais['saldo_total_atualizado'] / media, 2)

        print(f"✅ Extração Completa (Estável)! Saldo Atualizado: {dados_finais['saldo_total_atualizado']} kWh", flush=True)
        return dados_finais

    except Exception as e:
        print(f"\n🔥 ERRO NO EXTRACTOR: {str(e)}", flush=True)
        import traceback
        traceback.print_exc()
        return None