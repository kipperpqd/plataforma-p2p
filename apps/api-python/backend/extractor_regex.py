import re
import pdfplumber
import requests
from io import BytesIO

# --- FUNÇÕES AUXILIARES DE LIMPEZA ---

def clean_float(valor):
    """Limpa strings monetárias e numéricas para float"""
    if not valor: return 0.0
    try:
        limpo = str(valor).strip().replace('R$', '').replace(' ', '')
        if limpo.endswith('-'): limpo = '-' + limpo[:-1]
        if ',' in limpo:
            v = limpo.replace('.', '').replace(',', '.')
        else:
            v = limpo
        return float(v)
    except:
        return 0.0

def clean_float_extra(valor):
    """Trata casos complexos de OCR com espaços ou pontos mal posicionados"""
    if not valor: return 0.0
    try:
        v = str(valor).upper().replace('R$', '').strip()
        if v.endswith('-'): v = '-' + v[:-1]
        if re.search(r'\d\s\d', v):
            v = v.replace('.', '').replace(',', '').replace(' ', '.')
        elif ',' in v:
            v = v.replace('.', '').replace(',', '.')
        return float(v)
    except:
        return 0.0

def fix_scale(val):
    """Corrige escala de valores de histórico para evitar distorções de milhar"""
    return int(val if val < 10000 else val / 100)

# --- FUNÇÃO PRINCIPAL DE EXTRAÇÃO ---

def extrair_dados_fatura(url_pdf):
    """
    Executa a extração por Regex dos dados da fatura via URL.
    Retorna um dicionário com dados brutos, itens e indicadores históricos.
    """
    try:
        req = requests.get(url_pdf)
        with pdfplumber.open(BytesIO(req.content)) as pdf:
            p1 = pdf.pages[0].extract_text() or ""
            
        dados = {}

        # 1. Identificadores (Âncoras para busca de cliente)
        cliente_id = re.search(r"(?:CLIENTE|CÓDIGO)\s*[:\s]*(\d{8})", p1, re.IGNORECASE)
        dados['codigo_cliente'] = cliente_id.group(1) if cliente_id else "NAO_ENCONTRADO"

        medidor = re.search(r"(\d+-[A-Z]{3}-\d+)", p1)
        dados['numero_medidor'] = medidor.group(1) if medidor else "NAO_ENCONTRADO"

        # 2. Dados de Referência e Datas
        bloco = re.search(r"(\d{2}/\d{4})\s+(\d{2}/\d{2}/\d{4})\s+R\$\s?([\d,.]+)", p1)
        dados['mes_referencia'] = bloco.group(1) if bloco else "NAO_ENCONTRADO"
        dados['ft_enel_com_gd'] = clean_float(bloco.group(3)) if bloco else 0.0

        venc_match = re.search(r"VENCIMENTO\s*[:\s]*(\d{2}/\d{2}/\d{4})", p1, re.IGNORECASE)
        if not venc_match:
            venc_match = re.search(r"(\d{2}/\d{2}/\d{4})\s+R\$\s?[\d,.]+", p1)
        dados['data_vencimento_bruta'] = venc_match.group(1) if venc_match else None

        prox_leitura = re.search(r"PR[ÓO]XIMA\s+LEITURA.*?(\d{2}/\d{2}/\d{4})", p1, re.IGNORECASE | re.DOTALL)
        dados['proxima_leitura_bruta'] = prox_leitura.group(1) if prox_leitura else None

        dias_match = re.search(r"\d{2}/\d{2}/\d{4}\s+(\d{1,2})\s+\d{2}/\d{2}/\d{4}", p1)
        dados['nr_dias'] = int(dias_match.group(1)) if dias_match else 0

        # 3. Bandeira e Tributos
        bandeira = re.search(r"Bandeira\s+([A-Za-z]+)", p1, re.IGNORECASE)
        dados['bandeira_tarifaria'] = bandeira.group(1).capitalize() if bandeira else "Verde"

        def extrair_tributos_moderno(texto):
            # Procuramos a linha que começa com TOTAL dentro da seção de tributos
            # O padrão busca: TOTAL -> pula valores -> captura PIS/COFINS -> pula valor -> captura ICMS
            padrao = r"TOTAL\s*(?:\|?\s*[\d,.]+){1,4}\s*\|?\s*([\d,.]+)\s*\|?\s*[\d,.]+\s*\|?\s*([\d,.]+)"
            
            match = re.search(padrao, texto)
            
            if match:
                # PIS + COFINS (Geralmente vêm somados na tabela de resumo da Enel)
                pis_cofins = clean_float(match.group(1))
                # ICMS
                icms = clean_float(match.group(2))
                
                total_tributos = round(pis_cofins + icms, 2)
                return total_tributos
            
            return 0.0

        # Aplicação no seu dicionário de dados
        dados['tributos'] = extrair_tributos_moderno(p1)

        # 4. Itens de Faturamento e Consumo
        itens = []
        item_pattern = re.compile(
            r"^(?P<desc>.*?)\s+(?P<unid>kWh|mUC|mPT)\s+(?P<quant>[0-9\.,\-]+)\s+(?P<preco>[0-9\.,\-]+)\s+(?P<valor>[0-9\.,\-]+)",
            re.MULTILINE | re.IGNORECASE
        )
        for match in item_pattern.finditer(p1):
            desc = match.group("desc").strip()
            if "subtotal" in desc.lower(): continue
            itens.append({
                "descricao": desc,
                "quantidade": int(clean_float(match.group("quant"))),
                "unitario": clean_float(match.group("preco")),
                "valor": clean_float(match.group("valor"))
            })

        cip_match = re.search(r"CIP ILUM PUB PREF MUNICIPAL\s+([\d,\.\-]+)", p1, re.IGNORECASE)
        if cip_match:
            itens.append({"descricao": "CIP ILUM PUB PREF MUNICIPAL", "quantidade": 0, "unitario": 0.0, "valor": clean_float(cip_match.group(1))})
        
        dados['itens_faturamento'] = itens
        dados['ft_enel_sem_gd'] = round(sum(i['valor'] for i in itens if i['valor'] > 0), 2)
        dados['total_itens_compensados'] = round(sum(i['valor'] for i in itens if i['valor'] < 0), 2)

        # Extração de Consumo kWh
        medicao_match = re.search(r"kWh\s+1\.00\s+([\d,.]+)", p1)
        if medicao_match:
            dados['consumo_kwh'] = int(medicao_match.group(1).replace('.', '').replace(',', ''))
        else:
            quantidades = [int(m.group(1).replace('.', '').replace(',', '')) for m in re.finditer(r"kWh\s+([\d\.,]+)\s+[\d\.,]+\s+[\d\.,]+", p1)]
            dados['consumo_kwh'] = max(quantidades) if quantidades else 0

        # 5. Histórico e Indicadores (Média e Reserva)
        s_util = re.search(r"utilizado\s+no\s+m[eé]s:\s*([\d,.\s]+)(?=\s*kWh)", p1, re.IGNORECASE)
        dados['saldo_utilizado_mes'] = clean_float_extra(s_util.group(1)) if s_util else 0

        s_atu = re.search(r"Saldo\s+atualizado:\s*([\d,.\s]+)(?=\s*kWh)", p1, re.IGNORECASE)
        dados['saldo_total_atualizado'] = clean_float_extra(s_atu.group(1)) if s_atu else 0

        hist = re.findall(r"[A-Z]{3}\d{2}\s+([\d,.]+)\s+\d+\s+LID", p1)
        media_val = fix_scale(sum(clean_float(v) for v in hist[:12]) / len(hist[:12])) if hist else 1
        dados['media_consumo'] = media_val
        dados['reserva_creditos'] = round(dados['saldo_total_atualizado'] / media_val, 2)

        linha_match = re.search(r"(\d{11,12}\s\d{11,12}\s\d{11,12}\s\d{11,12})", p1)
        dados['linha_digitavel_enel'] = linha_match.group(1).replace('\n', ' ') if linha_match else "NAO_ENCONTRADO"

        return dados

    except Exception as e:
        print(f"Erro na extração do PDF: {e}")
        return None