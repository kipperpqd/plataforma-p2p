import { NextResponse } from 'next/server';

const ASAAS_URL = 'https://api-sandbox.asaas.com/v3';

const getHeaders = () => ({
  'Content-Type': 'application/json',
  'access_token': process.env.ASAAS_API_KEY || ''
});

// Função auxiliar para esperar (delay)
const delay = (ms: number) => new Promise(resolve => setTimeout(resolve, ms));

export async function POST(request: Request) {
  try {
    if (!process.env.ASAAS_API_KEY) {
      return NextResponse.json({ error: "Configuração de API ausente no servidor." }, { status: 500 });
    }

    const body = await request.json();
    const { cliente_nome, cliente_cpfCnpj, valor, vencimento, fatura_id } = body;

    const customerId = await getOrCreateCustomer(cliente_nome, cliente_cpfCnpj);

    // 1. Criar a Cobrança
    const res = await fetch(`${ASAAS_URL}/payments`, {
      method: 'POST',
      headers: getHeaders(),
      body: JSON.stringify({
        billingType: 'UNDEFINED',
        customer: customerId,
        value: valor,
        dueDate: vencimento,
        description: `Fatura P2P - Ref. ${fatura_id}`,
        externalReference: fatura_id
      })
    });

    const paymentData = await res.json();
    if (paymentData.errors) {
      return NextResponse.json({ error: paymentData.errors[0].description }, { status: 400 });
    }

    // 2. Pequena pausa de 1.5s para garantir que o Asaas gerou o PIX internamente
    await delay(1500);

    // 3. Chamadas extras: PIX e Linha Digitável
    let pixData: any = null;
    let barCodeData: any = null;

    try {
      const [pixRes, barCodeRes] = await Promise.all([
        fetch(`${ASAAS_URL}/payments/${paymentData.id}/pixQrCode`, { headers: getHeaders() }),
        fetch(`${ASAAS_URL}/payments/${paymentData.id}/identificationField`, { headers: getHeaders() })
      ]);

      pixData = await pixRes.json();
      barCodeData = await barCodeRes.json();
      
      // Se ainda vier VAZIO, tentamos uma última vez após mais 1s
      if (!pixData.encodedImage) {
        console.log("PIX Vazio, tentando segunda vez...");
        await delay(1500);
        const retryPix = await fetch(`${ASAAS_URL}/payments/${paymentData.id}/pixQrCode`, { headers: getHeaders() });
        pixData = await retryPix.json();
      }

    } catch (err) {
      console.error("Erro nas chamadas extras:", err);
    }

    console.log("CONTEÚDO PIX FINAL:", {
      imagem: pixData?.encodedImage ? "RECEBIDO" : "VAZIO",
      payload: pixData?.payload ? "RECEBIDO" : "VAZIO"
    });

    return NextResponse.json({
      payment: paymentData,
      pix: pixData?.encodedImage ? pixData : null,
      linhaDigitavel: barCodeData?.identificationField || paymentData.nossoNumero
    });

  } catch (error: any) {
    console.error("Erro na Rota Asaas:", error.message);
    return NextResponse.json({ error: error.message }, { status: 500 });
  }
}

/**
 * GET: Sincroniza status E TAMBÉM recupera dados de PIX/Boleto se faltarem no banco
 */
export async function GET(request: Request) {
  const { searchParams } = new URL(request.url);
  const id_externo = searchParams.get('id_externo');

  if (!id_externo) return NextResponse.json({ error: "ID ausente" }, { status: 400 });

  try {
    // Buscamos o pagamento, o pix e o código de barras
    const [payRes, pixRes, barRes] = await Promise.all([
      fetch(`${ASAAS_URL}/payments/${id_externo}`, { headers: getHeaders() }),
      fetch(`${ASAAS_URL}/payments/${id_externo}/pixQrCode`, { headers: getHeaders() }),
      fetch(`${ASAAS_URL}/payments/${id_externo}/identificationField`, { headers: getHeaders() })
    ]);

    const data = await payRes.json();
    const pix = await pixRes.json();
    const bar = await barRes.json();
    
    const statusSimplificado = (data.status === 'RECEIVED' || data.status === 'CONFIRMED' || data.status === 'RECEIVED_IN_CASH') 
      ? 'pago' 
      : data.status === 'OVERDUE' ? 'atrasado' : 'pendente';

    return NextResponse.json({ 
      asaasStatus: data.status, 
      status: statusSimplificado,
      // Retornamos os dados completos para o frontend poder fazer o upsert se necessário
      payment: data,
      pix: pix.encodedImage ? pix : null,
      linhaDigitavel: bar.identificationField
    });
  } catch (error: any) {
    return NextResponse.json({ error: error.message }, { status: 500 });
  }
}

async function getOrCreateCustomer(name: string, cpfCnpj: string) {
  const token = process.env.ASAAS_API_KEY;
  const cleanedCpfCnpj = cpfCnpj.replace(/\D/g, '');
  const headers = { 'accept': 'application/json', 'content-type': 'application/json', 'access_token': token || '' };

  const searchRes = await fetch(`${ASAAS_URL}/customers?cpfCnpj=${cleanedCpfCnpj}`, { headers });
  const searchData = await searchRes.json();
  console.log("Resultado busca cliente Asaas:", searchData);

  if (searchData.data && searchData.data.length > 0) return searchData.data[0].id;

  const createRes = await fetch(`${ASAAS_URL}/customers`, {
    method: 'POST',
    headers,
    body: JSON.stringify({ name, cpfCnpj: cleanedCpfCnpj, notificationDisabled: true })
  });

  const newData = await createRes.json();
  if (newData.errors) throw new Error(`Erro cliente: ${newData.errors[0].description}`);
  return newData.id;
}