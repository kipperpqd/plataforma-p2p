import os
from supabase import create_client, Client
from dotenv import load_dotenv

load_dotenv()

# --- CONFIGURAÇÃO SUPABASE ---
URL = os.environ.get("NEXT_PUBLIC_SUPABASE_URL")
KEY = os.environ.get("SUPABASE_SERVICE_ROLE_KEY")

if not URL or not KEY:
    raise ValueError("Faltam as variáveis de configuração do Supabase no .env")

print(f"📡 Inicializando cliente Supabase com URL: {URL}")
supabase: Client = create_client(URL, KEY)

# --- FUNÇÕES DE APOIO ---

def format_date_to_iso(date_str):
    """Converte DD/MM/AAAA (Regex) para AAAA-MM-DD (Supabase/Postgres)"""
    if not date_str: return None
    try:
        partes = date_str.split('/')
        if len(partes) == 3:
            return f"{partes[2]}-{partes[1]}-{partes[0]}"
        return None
    except:
        return None

# --- CORE DATABASE LOGIC ---

def buscar_cliente_por_seguranca(codigo_extraido, medidor_extraido):
    """
    Implementa a lógica de Âncora Dupla.
    Busca o cliente pelo código OU pelo número do medidor.
    Retorna o dicionário do cliente (incluindo o desconto_percentual).
    """
    try:
        # Tenta pelo Código do Cliente primeiro
        res = supabase.table('clientes').select("*").eq('codigo_cliente', codigo_extraido).execute()
        if res.data:
            print(f"🔗 Cliente encontrado via código_cliente: {codigo_extraido}")
            return res.data[0]

        # Se não encontrou, tenta pelo Número do Medidor
        res = supabase.table('clientes').select("*").eq('numero_medidor', medidor_extraido).execute()
        if res.data:
            print(f"🔗 Cliente encontrado via número_medidor: {medidor_extraido}")
            return res.data[0]

        print(f"⚠️ Aviso: Cliente não localizado (Código: {codigo_extraido}, Medidor: {medidor_extraido})")
        return None
    except Exception as e:
        print(f"❌ Erro na busca de cliente: {e}")
        return None

def salvar_processamento_completo(id_fatura_db, cliente_id, dados_brutos, resultados_financeiros):
    """
    Persiste todos os dados nas tabelas: faturas, economia_gerada e cobrancas.
    """
    try:
        # 1. Atualizar Tabela 'faturas' com dados da extração
        update_fatura = {
            "cliente_id": cliente_id,
            "codigo_cliente": dados_brutos['codigo_cliente'],
            "numero_medidor": dados_brutos['numero_medidor'],
            "mes_referencia": dados_brutos['mes_referencia'],
            "nr_dias": dados_brutos['nr_dias'],
            "ft_enel_com_gd": dados_brutos['ft_enel_com_gd'],
            "consumo_kwh": dados_brutos['consumo_kwh'],
            "bandeira_tarifaria": dados_brutos['bandeira_tarifaria'],
            "media_consumo": dados_brutos['media_consumo'],
            "linha_digitavel_enel": dados_brutos['linha_digitavel_enel'],
            "tributos": dados_brutos['tributos'],
            "saldo_utilizado_mes": dados_brutos['saldo_utilizado_mes'],
            "saldo_total_atualizado": dados_brutos['saldo_total_atualizado'],
            "reserva_creditos": dados_brutos['reserva_creditos'],
            "data_vencimento": format_date_to_iso(dados_brutos.get('data_vencimento_bruta')),
            "proxima_leitura": format_date_to_iso(dados_brutos.get('proxima_leitura_bruta')),
            "status_processamento": "concluido"
        }
        supabase.table('faturas').update(update_fatura).eq('id', id_fatura_db).execute()

        # ... dentro da função salvar_processamento_completo ...

        # 2. Inserir na Tabela 'economia_gerada'
        dados_economia = {
            "fatura_id": id_fatura_db,
            "cliente_id": cliente_id,
            "ft_enel_sem_gd": dados_brutos['ft_enel_sem_gd'],
            "total_itens_compensados": dados_brutos['total_itens_compensados'],
            "lc_p2p": resultados_financeiros['lc_p2p'],
            "nova_fatura_p2p": resultados_financeiros['nova_fatura_p2p'],
            "economia_reais": resultados_financeiros['economia_reais'],
            "economia_percentual": resultados_financeiros['economia_percentual']
        }
        # Deleta se já existir (limpeza) e insere o novo
        supabase.table('economia_gerada').delete().eq('fatura_id', id_fatura_db).execute()
        supabase.table('economia_gerada').insert(dados_economia).execute()

        # 3. Gerar Cobrança P2P
        dados_cobranca = {
            "fatura_id": id_fatura_db,
            "cliente_id": cliente_id,
            "valor_p2p": resultados_financeiros['nova_fatura_p2p'],
            "data_vencimento": format_date_to_iso(dados_brutos.get('data_vencimento_bruta')),
            "status_pagamento": "pendente"
        }
        # Deleta se já existir e insere a nova cobrança atualizada
        supabase.table('cobrancas').delete().eq('fatura_id', id_fatura_db).execute()
        supabase.table('cobrancas').insert(dados_cobranca).execute()

        # 4. Itens Faturados
        itens_db = []
        for item in dados_brutos['itens_faturamento']:
            itens_db.append({
                "fatura_id": id_fatura_db,
                "descricao": item['descricao'],
                "quantidade": item['quantidade'],
                "unitario": item['unitario'],
                "valor": item['valor'],
                "tipo_item": "extraido" 
            })
        if itens_db:
            # Limpa itens antigos se existirem para evitar duplicados em re-processamento
            supabase.table('itens_faturados').delete().eq('fatura_id', id_fatura_db).execute()
            supabase.table('itens_faturados').insert(itens_db).execute()

        return True
    except Exception as e:
        print(f"❌ Erro ao persistir dados: {e}")
        return False

def marcar_erro_processamento(id_fatura_db):
    """Marca a fatura com erro caso algo falhe no fluxo"""
    supabase.table('faturas').update({"status_processamento": "erro"}).eq('id', id_fatura_db).execute()