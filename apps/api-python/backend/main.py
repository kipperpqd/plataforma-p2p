from fastapi import FastAPI, BackgroundTasks, Request, HTTPException
from fastapi.middleware.cors import CORSMiddleware
import uvicorn

# Imports do seu sistema
from backend.extractor import extrair_dados_fatura
from backend.calculator import executar_calculos_financeiros
from backend.database import (
    supabase, 
    buscar_cliente_por_seguranca, 
    salvar_processamento_completo, 
    marcar_erro_processamento
)
app = FastAPI(title="P2P Energia - Backend Processador")

# 1. CORS CONFIGURATION (DEVE VIR ANTES DE QUALQUER ROTA)
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["GET", "POST", "OPTIONS"], # Explicitamente permitindo OPTIONS
    allow_headers=["*"],
    expose_headers=["ngrok-skip-browser-warning"],
)

@app.get("/")
async def home():
    return {"status": "Online", "msg": "API de Processamento P2P Energia"}

# --- FLUXO AUTOMÁTICO (WEBHOOK) ---

@app.post("/webhook/fatura")
async def webhook_fatura(request: Request, background_tasks: BackgroundTasks):
    payload = await request.json()
    print(f"📥 Webhook recebido! Payload: {payload}")
    record = payload.get('record')
    
    if not record:
        raise HTTPException(status_code=400, detail="Payload inválido")

    fatura_id = record.get('id')
    url_pdf = record.get('link_pdf_original')

    if not url_pdf:
        return {"status": "pular", "msg": "Sem link de PDF"}

    background_tasks.add_task(processar_fluxo_automatico, fatura_id, url_pdf)
    return {"status": "processamento_iniciado", "fatura_id": fatura_id}

def processar_fluxo_automatico(fatura_id: str, url_pdf: str):
    print(f"🚀 Iniciando processamento automático: {fatura_id}")
    try:
        dados_brutos = extrair_dados_fatura(url_pdf)
        if not dados_brutos:
            raise Exception("Falha na extração dos dados do PDF.")

        cliente = buscar_cliente_por_seguranca(
            dados_brutos['codigo_cliente'], 
            dados_brutos['numero_medidor']
        )
        
        if not cliente:
            raise Exception(f"Cliente não localizado.")

        resultados = executar_calculos_financeiros(
            dados_brutos, 
            cliente.get('desconto_percentual', 0)
        )

        salvar_processamento_completo(fatura_id, cliente['id'], dados_brutos, resultados)
        print(f"✨ Sucesso: Fatura {fatura_id} finalizada.")

    except Exception as e:
        print(f"❌ Erro crítico: {e}")
        marcar_erro_processamento(fatura_id)

# --- FLUXO MANUAL (RECALCULAR) ---

@app.post("/recalcular/{fatura_id}")
async def recalcular_fatura(fatura_id: str):
    print(f"🔄 Recalculando fatura: {fatura_id}")
    try:
        # 1. Busca ampliada
        res = supabase.table('faturas').select("*, clientes(*), economia_gerada(*)").eq('id', fatura_id).single().execute()
        f = res.data
        
        if not f: 
            raise HTTPException(status_code=404, detail="Fatura não encontrada")

        # 2. Normaliza a economia (Trata objeto ou lista)
        eco = f.get('economia_gerada')
        if isinstance(eco, list) and len(eco) > 0: eco = eco[0]
        elif not eco: eco = {}

        # 3. Simula dados brutos (Nomes de chaves devem bater com extractor.py)
        dados_simulados = {
            'codigo_cliente': f.get('codigo_cliente'),
            'numero_medidor': f.get('numero_medidor'),
            'mes_referencia': f.get('mes_referencia'),
            'nr_dias': f.get('nr_dias', 0),
            'ft_enel_com_gd': f.get('ft_enel_com_gd', 0),
            'ft_enel_sem_gd': eco.get('ft_enel_sem_gd', 0),
            'total_itens_compensados': eco.get('total_itens_compensados', 0),
            'consumo_kwh': f.get('consumo_kwh', 0),
            'bandeira_tarifaria': f.get('bandeira_tarifaria', 'Verde'),
            'media_consumo': f.get('media_consumo', 1),
            'linha_digitavel_enel': f.get('linha_digitavel_enel', ''),
            'tributos': f.get('tributos', 0),
            'saldo_utilizado_mes': f.get('saldo_utilizado_mes', 0),
            'saldo_total_atualizado': f.get('saldo_total_atualizado', 0),
            'reserva_creditos': f.get('reserva_creditos', 0),
            'data_vencimento_bruta': f.get('data_vencimento'), 
            'proxima_leitura_bruta': f.get('proxima_leitura'),
            'itens_faturamento': [] 
        }
        
        # Busca desconto atualizado do cliente
        desconto = f['clientes'].get('desconto_percentual', 0)
        
        # 4. Executa a matemática
        resultados = executar_calculos_financeiros(dados_simulados, desconto)

        # 5. Persiste
        salvar_processamento_completo(fatura_id, f['clientes']['id'], dados_simulados, resultados)

        return {"status": "sucesso", "data": resultados}
    except Exception as e:
        print(f"❌ Erro detalhado no recalcular: {str(e)}")
        # Importante: Retornar erro JSON para o CORS não quebrar na resposta
        raise HTTPException(status_code=500, detail=str(e))

if __name__ == "__main__":
    uvicorn.run("main:app", host="0.0.0.0", port=8000, reload=True)