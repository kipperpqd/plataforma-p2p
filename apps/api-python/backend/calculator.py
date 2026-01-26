def executar_calculos_financeiros(dados_extraidos, desconto_percentual_cliente):
    
    """
    Realiza os cálculos de economia e faturamento P2P baseados no 
    desconto individual de cada cliente.
    
    Args:
        dados_extraidos (dict): Dicionário vindo do extrator.py
        desconto_percentual_cliente (float): Valor da tabela clientes (ex: 20.0)
        
    Returns:
        dict: Resultados financeiros calculados.
    """
    try:
        # 1. Recupera valores base
        f_bruta = dados_extraidos.get('ft_enel_sem_gd', 0.0)
        compensados = dados_extraidos.get('total_itens_compensados', 0.0)
        valor_enel_com_gd = dados_extraidos.get('ft_enel_com_gd', 0.0)

        # 2. Ajuste de Desconto (Trata se vier 0.2 ou 20)
        desconto_ajustado = desconto_percentual_cliente
        if 0 < desconto_ajustado < 1:
            desconto_ajustado *= 100

        # 3. CÁLCULOS CORRIGIDOS
        # O cliente paga à P2P uma parte do que a Enel "deu" de crédito
        fator_pagamento = 1 - (desconto_ajustado / 100)
        lc_p2p = round(abs(compensados * fator_pagamento), 2)
        
        # A nova fatura total é o que sobrou na Enel + o boleto da P2P
        nova_fatura_p2p = round(lc_p2p + valor_enel_com_gd, 2)
        
        # A economia é a diferença entre a conta cheia e o novo total pago
        economia_reais = round(f_bruta - nova_fatura_p2p, 2)
        economia_percentual = round((economia_reais / f_bruta) * 100, 2) if f_bruta > 0 else 0

        return {
            "lc_p2p": lc_p2p,
            "nova_fatura_p2p": nova_fatura_p2p,
            "economia_reais": economia_reais,
            "economia_percentual": economia_percentual,
            "status_processamento": "concluido"
        }

    except Exception as e:
        print(f"Erro ao executar cálculos financeiros: {e}")
        return {
            "status_processamento": "erro",
            "erro_msg": str(e)
        }