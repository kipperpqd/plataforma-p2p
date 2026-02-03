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

def validar_balanco(itens, total_fatura):
    """
    Regra proposta pelo usuário: Sum(Positives) - Sum(Abs(Negatives)) = Total
    Ou mais simples: sum(itens) = total_fatura
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
        
        prompt = """
        Atue como um especialista em faturas Enel. Extraia os dados em JSON.
        
        REGRA DE OURO (BALANÇO MATEMÁTICO):
        A soma de todos os itens de faturamento (considerando sinais negativos) DEVE ser IGUAL ao campo 'Total a Pagar'.
        
        REGRAS PARA ITENS:
        - Liste cada item da tabela 'DESCRIÇÃO DO FATURAMENTO'.
        - Identifique valores negativos (compensações/créditos) pelo sinal '-' após o número (ex: 137,02-).
        - 'itens_faturamento' deve conter: descricao, quantidade, unitario, valor.
        
        REGRAS PARA IDENTIFICAÇÃO (2026):
        - 'codigo_cliente': O SEGUNDO número no campo 'UC' (ex: 1234 / 5678 -> 5678).
        - 'unidade_consumidora': O PRIMEIRO número no campo 'UC'.
        - 'numero_medidor': Padrão 1234567-ABC-123 ou similar.
        
        ESTRUTURA JSON:
        {
          "codigo_cliente": "...",
          "unidade_consumidora": "...",
          "numero_medidor": "...",
          "mes_referencia": "MM/AAAA",
          "total_fatura": 0.0,
          "itens_faturamento": [
             {"descricao": "...", "quantidade": 0, "unitario": 0.0, "valor": 0.0}
          ],
          "saldo_utilizado_mes": 0.0,
          "saldo_total_atualizado": 0.0,
          "tributos": 0.0,
          "data_vencimento": "...",
          "linha_digitavel": "..."
        }
        """

        result = client.models.generate_content(
            model="gemini-2.0-flash",
            contents=[prompt, types.Part.from_bytes(data=pdf_content, mime_type="application/pdf")],
            config=types.GenerateContentConfig(response_mime_type="application/json", temperature=0)
        )
        
        data = json.loads(result.text)
        if isinstance(data, list): data = data[0]

        # Limpeza e Padronização
        total_pago = clean_float(data.get("total_fatura", 0))
        itens_raw = data.get("itens_faturamento", [])
        itens_limpos = []
        
        for i in itens_raw:
            v_limpo = clean_float(i.get("valor", 0))
            if v_limpo != 0 or i.get("quantidade"):
                itens_limpos.append({
                    "descricao": i.get("descricao", "SEM_DESCRICAO"),
                    "quantidade": int(abs(clean_float(i.get("quantidade", 0)))),
                    "unitario": abs(clean_float(i.get("unitario", 0))),
                    "valor": v_limpo
                })

        # VALIDAÇÃO DO BALANÇO
        valido, soma = validar_balanco(itens_limpos, total_pago)
        
        if not valido:
            print(f"⚠️ Alerta de Balanço: Soma AI ({soma}) != Total PDF ({total_pago}). Diferença: {round(total_pago-soma, 2)}")
            # Aqui poderíamos implementar uma re-tentativa com prompt de correção
        else:
            print(f"✅ Balanço Confirmado: {soma} = {total_pago}")

        # CONSOLIDAÇÃO FINAL (Mantendo compatibilidade com main.py)
        resultado_final = data.copy()
        resultado_final['itens_faturamento'] = itens_limpos
        resultado_final['valido'] = valido
        resultado_final['soma_calculada_ai'] = soma
        resultado_final['total_fatura'] = total_pago # Garante que é float
        
        # Ajuste de nomes de chaves para compatibilidade
        if 'linha_digitavel' in resultado_final:
            resultado_final['linha_digitavel_enel'] = resultado_final.pop('linha_digitavel')
        
        print(f"✅ Extração Concluída: {'Balanço OK' if valido else 'Balanço INCORRETO'}")
        return resultado_final

    except Exception as e:
        print(f"🔥 Erro no Extrator AI: {e}")
        return None
