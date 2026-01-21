import { NextResponse } from 'next/server';
import { createClient } from '@supabase/supabase-js';

// Usando Service Role para ignorar RLS no Webhook
const supabase = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL!,
  process.env.SUPABASE_SERVICE_ROLE_KEY!
);

export async function POST(request: Request) {
  try {
    const asaasToken = request.headers.get('asaas-access-token');
    
    // Validação de segurança
    if (asaasToken !== process.env.ASAAS_WEBHOOK_TOKEN) {
      console.error("Tentativa de acesso não autorizada ao Webhook");
      return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
    }

    const body = await request.json();
    const { event, payment } = body;

    console.log(`Evento recebido: ${event} | Status: ${payment.status}`);

    // Lista de status que consideramos como "PAGO"
    const statusPago = [
      'PAYMENT_RECEIVED', 
      'PAYMENT_CONFIRMED', 
      'RECEIVED_IN_CASH' // Importante para seus testes manuais
    ];

    if (statusPago.includes(event) || statusPago.includes(payment.status)) {
      const { error } = await supabase
        .from('cobrancas')
        .update({ status_pagamento: 'pago' })
        .eq('id_externo_asaas', payment.id);

      if (error) throw error;
      console.log(`Fatura atualizada para PAGO: ${payment.id}`);
    }

    return NextResponse.json({ received: true }, { status: 200 });
  } catch (error: any) {
    console.error("Erro no Webhook:", error.message);
    return NextResponse.json({ error: error.message }, { status: 500 });
  }
}