import os
import re
import time
import json
import requests
import pdfplumber
from io import BytesIO
from supabase import create_client, Client
from dotenv import load_dotenv

# Carrega variáveis de ambiente
load_dotenv()

# --- CONFIGURAÇÃO SUPABASE ---
URL = os.environ.get("NEXT_PUBLIC_SUPABASE_URL")
KEY = os.environ.get("SUPABASE_SERVICE_ROLE_KEY") or os.environ.get("NEXT_PUBLIC_SUPABASE_ANON_KEY")

if not URL or not KEY:
    raise ValueError("Faltam as variáveis de configuração do Supabase no .env")

supabase: Client = create_client(URL, KEY)

# --- FUNÇÕES DE AUXILIARES ---

def clean_float(valor):
    if not valor: return 0.0
    try:
        limpo = str(valor).strip().replace('R$', '').replace(' ', '')
        if limpo.endswith('-'):
            limpo = '-' + limpo[:-1]
        if ',' in limpo:
            v = limpo.replace('.', '').replace(',', '.')
        else:
            v = limpo
        return float(v)
    except:
        return 0.0
def clean_float_extra(valor):
    if not valor: return 0.0
    try:
        # 1. Remove R$ e espaços nas extremidades
        v = str(valor).upper().replace('R$', '').strip()
        
        # 2. Trata sinal negativo no final
        if v.endswith('-'): v = '-' + v[:-1]
        
        # 3. Se houver um espaço entre dígitos (ex: 545 48), 
        # assume-se que o espaço é o separador decimal do OCR
        if re.search(r'\d\s\d', v):
            v = v.replace('.', '').replace(',', '').replace(' ', '.')
        
        # 4. Lógica padrão para vírgula como decimal
        elif ',' in v:
            v = v.replace('.', '').replace(',', '.')
            
        return float(v)
    except:
        return 0.0

def format_date_to_iso(date_str):
    """Converte DD/MM/AAAA para AAAA-MM-DD"""
    if not date_str:
        return None
    try:
        # Divide a string 14/11/2025 e reorganiza para 2025-11-14
        partes = date_str.split('/')
        if len(partes) == 3:
            return f"{partes[2]}-{partes[1]}-{partes[0]}"
        return None
    except:
        return None

def fix_scale(val):
    return int(val if val < 10000 else val / 100)

def extrair_itens_faturamento(raw_text):
    itens = []
    item_pattern = re.compile(
        r"^(?P<desc>.*?)\s+(?P<unid>kWh|mUC|mPT)\s+(?P<quant>[0-9\.,\-]+)\s+(?P<preco>[0-9\.,\-]+)\s+(?P<valor>[0-9\.,\-]+)",
        re.MULTILINE | re.IGNORECASE
    )

    for match in item_pattern.finditer(raw_text):
        desc = match.group("desc").strip()
        if "subtotal" in desc.lower(): continue
        
        itens.append({
            "descricao": desc,
            "quantidade": int(clean_float(match.group("quant"))),
            "unitario": clean_float(match.group("preco")),
            "valor": clean_float(match.group("valor"))
        })

    cip_match = re.search(r"CIP ILUM PUB PREF MUNICIPAL\s+([\d,\.\-]+)", raw_text, re.IGNORECASE)
    if cip_match:
        itens.append({
            "descricao": "CIP ILUM PUB PREF MUNICIPAL", 
            "quantidade": 0, 
            "unitario": 0.0, 
            "valor": clean_float(cip_match.group(1))
        })
        
    return itens

def extrair_dados_fatura(p1):
    dados = {}
    
    # 1. Identificadores Básicos
    cliente_id = re.search(r"(?:CLIENTE|CÓDIGO)\s*[:\s]*(\d{8})", p1, re.IGNORECASE)
    dados['codigo_cliente'] = cliente_id.group(1) if cliente_id else "NAO_ENCONTRADO"

    medidor = re.search(r"(\d+-[A-Z]{3}-\d+)", p1)
    dados['numero_medidor'] = medidor.group(1) if medidor else "NAO_ENCONTRADO"
    
    bloco = re.search(r"(\d{2}/\d{4})\s+(\d{2}/\d{2}/\d{4})\s+R\$\s?([\d,.]+)", p1)
    dados['mes_referencia'] = bloco.group(1) if bloco else "NAO_ENCONTRADO"

    # Esses campos geralmente estão na tabela de Datas de Leitura
    prox_leitura_match = re.search(r"PR[ÓO]XIMA\s+LEITURA.*?(\d{2}/\d{2}/\d{4})", p1, re.IGNORECASE | re.DOTALL)
    dados['proxima_leitura'] = prox_leitura_match.group(1) if prox_leitura_match else None

    dias_match = re.search(r"\d{2}/\d{2}/\d{4}\s+(\d{1,2})\s+\d{2}/\d{2}/\d{4}", p1)
    dados['nr_dias'] = int(dias_match.group(1)) if dias_match else 0

    # DATA DE VENCIMENTO ---
    # Busca a data no formato DD/MM/AAAA que esteja próxima à palavra VENCIMENTO
    venc_match = re.search(r"VENCIMENTO\s*[:\s]*(\d{2}/\d{2}/\d{4})", p1, re.IGNORECASE)
    if not venc_match:
        # Tenta buscar em formato de tabela (como aparece no rodapé ou cabeçalho)
        venc_match = re.search(r"(\d{2}/\d{2}/\d{4})\s+R\$\s?[\d,.]+", p1)
    dados['data_vencimento'] = venc_match.group(1) if venc_match else None
    
    dados['ft_enel_com_gd'] = clean_float(bloco.group(3)) if bloco else 0.0

    # 2. Bandeira Tarifária
    bandeira = re.search(r"Bandeira\s+([A-Za-z]+)", p1, re.IGNORECASE)
    dados['bandeira_tarifaria'] = bandeira.group(1).capitalize() if bandeira else "Verde"

    # 3. Extração de Itens e Consumo
    itens = extrair_itens_faturamento(p1)
    dados['itens_faturamento'] = itens # IMPORTANTE: Adicionado para evitar erro de chave

    # Extrair consumo direto da Tabela de Medição
    # 1. Tenta buscar na tabela 'DADOS DE MEDIÇÃO' (Geralmente não tem ponto)
    
    medicao_match = re.search(r"kWh\s+1\.00\s+([\d,.]+)", p1)

    if medicao_match:
        valor_texto = medicao_match.group(1)
        # Remove pontos e vírgulas para garantir que "4.004" vire "4004"
        valor_puro = valor_texto.replace('.', '').replace(',', '')
        dados['consumo_kwh'] = int(valor_puro)
    else:
        # 2. Fallback: Busca nos itens de faturamento
        quantidades = []
        # Regex para capturar a quantidade na linha (segunda coluna numérica)
        item_pattern = re.compile(r"kWh\s+([\d\.,]+)\s+[\d\.,]+\s+[\d\.,]+")
        
        for m in item_pattern.finditer(p1):
            # Remove separador de milhar para não virar decimal
            v_texto = m.group(1).replace('.', '').replace(',', '')
            quantidades.append(int(v_texto))
        
        dados['consumo_kwh'] = max(quantidades) if quantidades else 0
    
    # O padrão da linha digitável de faturas de consumo geralmente segue 4 blocos de 12 dígitos
    linha_match = re.search(r"(\d{11,12}\s\d{11,12}\s\d{11,12}\s\d{11,12})", p1)
    dados['linha_digitavel_enel'] = linha_match.group(1).replace('\n', ' ') if linha_match else "NAO_ENCONTRADO"
    
    # 4. Saldos e Média
    # Captura o valor após "utilizado no més/mês" até o "kWh"
    s_util = re.search(r"utilizado\s+no\s+m[eé]s:\s*([\d,.\s]+)(?=\s*kWh)", p1, re.IGNORECASE)
    dados['saldo_utilizado_mes'] = clean_float_extra(s_util.group(1)) if s_util else 0

    # Captura o valor após "Saldo atualizado:" até o "kWh"
    s_atu = re.search(r"Saldo\s+atualizado:\s*([\d,.\s]+)(?=\s*kWh)", p1, re.IGNORECASE)
    dados['saldo_total_atualizado'] = clean_float_extra(s_atu.group(1)) if s_atu else 0

    hist = re.findall(r"[A-Z]{3}\d{2}\s+([\d,.]+)\s+\d+\s+LID", p1)
    media_val = fix_scale(sum(clean_float(v) for v in hist[:12]) / len(hist[:12])) if hist else 1
    dados['media_consumo'] = media_val

    # 5. Cálculos Financeiros
    f_bruta = sum(i['valor'] for i in itens if i['valor'] > 0)
    compensados = sum(i['valor'] for i in itens if i['valor'] < 0)
    valor_total = clean_float(bloco.group(3)) if bloco else 0.0

    # TRIBUTOS (SOMA PIS/COFINS + ICMS)
    # Extraímos os valores da tabela de tributos. 
    # Usamos re.findall para pegar todos os valores monetários na área de tributos
    def buscar_valor_tributo(nome_imposto):
        # Esta regex procura o nome (ex: ICMS) e captura o último valor 
        # que tenha formato de moeda (xx,xx) no final da linha
        padrao = rf"{nome_imposto}.*?\s([\d,.]+)\s*$"
        match = re.search(padrao, p1, re.MULTILINE | re.IGNORECASE)
        
        if match:
            valor_texto = match.group(1)
            return clean_float(valor_texto)
        return 0.0

    # Chamada para os tributos específicos da Enel-CE
    # Note que usamos 'I CMS' com espaço ou 'ICMS' dependendo de como o PDF lê
    v_icms = buscar_valor_tributo("I\s?CMS") 
    v_pis = buscar_valor_tributo("PIS")
    v_cofins = buscar_valor_tributo("COFINS")

    dados['tributos'] = round(v_icms + v_pis + v_cofins, 2)
    
    
    dados['ft_enel_sem_gd'] = round(f_bruta, 2)
    dados['total_itens_compensados'] = round(compensados, 2)
    dados['lc_p2p'] = round(abs(compensados * 0.8), 2)
    dados['nova_fatura_p2p'] = round(dados['lc_p2p'] + valor_total, 2)
    dados['economia_cliente'] = round(f_bruta - dados['nova_fatura_p2p'], 2)
    dados['economia_perc_cliente'] = f"{round((dados['economia_cliente']/f_bruta)*100, 2)}%" if f_bruta > 0 else "0%"
    dados['reserva_creditos'] = round(dados['saldo_total_atualizado'] / media_val, 2)

    return dados

# --- FUNÇÃO PRINCIPAL: O LOOP DO WORKER ---

def processar_fila():
    print("🔄 Buscando faturas pendentes...")
    response = supabase.table('faturas').select("*").eq('status_processamento', 'aguardando_triagem').execute()
    faturas = response.data
    
    if not faturas:
        print("✅ Nenhuma fatura pendente.")
        return

    for fatura in faturas:
        id_fatura = fatura['id']
        url_pdf = fatura['link_pdf_original']

        try:
            req = requests.get(url_pdf)
            with pdfplumber.open(BytesIO(req.content)) as pdf:
                texto_p1 = pdf.pages[0].extract_text() or ""
                dados = extrair_dados_fatura(texto_p1)

            # --- NOVO: LÓGICA DE VÍNCULO DE CLIENTE ---
            codigo_extraido = dados['codigo_cliente']
            res_cliente = supabase.table('clientes').select("id").eq('codigo_cliente', codigo_extraido).execute()
            
            id_vinculado = None
            if res_cliente.data:
                id_vinculado = res_cliente.data[0]['id']
                print(f"🔗 Cliente identificado: {id_vinculado} para o código {codigo_extraido}")
            else:
                print(f"⚠️ Aviso: Código {codigo_extraido} extraído, mas nenhum cliente correspondente foi encontrado no banco.")

            # 1. Atualizar Tabela 'faturas'
            update_fatura = {
                "cliente_id": id_vinculado, # Preenche o ID estrangeiro automaticamente
                "codigo_cliente": codigo_extraido,
                "numero_medidor": dados['numero_medidor'],
                "mes_referencia": dados['mes_referencia'],
                "nr_dias": dados['nr_dias'],
                "ft_enel_com_gd": dados['ft_enel_com_gd'],
                "consumo_kwh": dados['consumo_kwh'],
                "bandeira_tarifaria": dados['bandeira_tarifaria'],
                "media_consumo": dados['media_consumo'],
                "linha_digitavel_enel": dados['linha_digitavel_enel'],
                "tributos": dados['tributos'],
                "saldo_utilizado_mes": dados['saldo_utilizado_mes'],
                "saldo_total_atualizado": dados['saldo_total_atualizado'],
                "reserva_creditos": dados['reserva_creditos'],
                "data_vencimento": format_date_to_iso(dados.get('data_vencimento')),
                "proxima_leitura": format_date_to_iso(dados.get('proxima_leitura')),
                "status_processamento": "concluido"
            }
            
            supabase.table('faturas').update(update_fatura).eq('id', id_fatura).execute()

            # 2. Inserir na Tabela 'economia_gerada'
            # Usamos o id_vinculado aqui também para garantir que a economia esteja ligada ao cliente
            dados_economia = {
                "fatura_id": id_fatura,
                "cliente_id": id_vinculado if id_vinculado else fatura.get('cliente_id'),
                "ft_enel_sem_gd": dados['ft_enel_sem_gd'],
                "total_itens_compensados": dados['total_itens_compensados'],
                "lc_p2p": dados['lc_p2p'],
                "nova_fatura_p2p": dados['nova_fatura_p2p'],
                "economia_reais": dados['economia_cliente'],
                "economia_percentual": float(dados['economia_perc_cliente'].replace('%', ''))
            }
            supabase.table('economia_gerada').insert(dados_economia).execute()

            # --- NOVO: GERAR COBRANÇA P2P AUTOMATICAMENTE ---
            
            # Definimos o vencimento da sua cobrança (ex: 5 dias após o processamento ou baseado na Enel)
            # Aqui vou colocar a mesma data de vencimento da fatura da Enel como padrão
            data_vencimento_p2p = format_date_to_iso(dados.get('data_vencimento'))

            dados_cobranca = {
                "fatura_id": id_fatura,
                "cliente_id": id_vinculado,
                "valor_p2p": dados['nova_fatura_p2p'],
                "data_vencimento": data_vencimento_p2p,
                "status_pagamento": "pendente",
                "linha_digitavel_p2p": None # Se você usar a mesma linha ou deixar para o seu boleto
            }
            
            supabase.table('cobrancas').insert(dados_cobranca).execute()
            print(f"💰 Cobrança de R$ {dados['nova_fatura_p2p']} gerada para o cliente.")

            # 3. Inserir na Tabela 'itens_faturados'
            itens_db = []
            for item in dados['itens_faturamento']:
                itens_db.append({
                    "fatura_id": id_fatura,
                    "descricao": item['descricao'],
                    "quantidade": item['quantidade'],
                    "unitario": item['unitario'],
                    "valor": item['valor'],
                    "tipo_item": "extraido" 
                })
            
            if itens_db:
                supabase.table('itens_faturados').insert(itens_db).execute()

            print(f"✨ Sucesso Total: Fatura {id_fatura} vinculada ao cliente {id_vinculado} e persistida.")

        except Exception as e:
            print(f"❌ Erro crítico na fatura {id_fatura}: {e}")
            supabase.table('faturas').update({"status_processamento": "erro"}).eq('id', id_fatura).execute()

if __name__ == "__main__":
    while True:
        try:
            processar_fila()
        except Exception as e:
            print(f"❌ Erro no ciclo: {e}")
        
        time.sleep(15)