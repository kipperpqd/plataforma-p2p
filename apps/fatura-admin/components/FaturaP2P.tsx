'use client'

import React from 'react'
import { Card, CardContent } from "@/components/ui/card"
import { 
  BarChart, Bar, XAxis, YAxis, CartesianGrid, ResponsiveContainer, Cell 
} from 'recharts'
import { TreeDeciduous, Zap, Leaf, ShieldCheck, Smartphone } from 'lucide-react'
import { QRCodeSVG } from 'qrcode.react' // Instale: npm install qrcode.react

interface FaturaProps {
  fatura: any;
  historico: any[];
}

export const FaturaP2P = React.forwardRef<HTMLDivElement, FaturaProps>(({ fatura, historico }, ref) => {
  if (!fatura) return null;

  const economia = fatura.economia_gerada?.[0] || {};
  const cobranca = fatura.cobrancas?.[0] || {};
  
  // Dados para o mini gráfico de histórico na fatura
  const dadosGrafico = historico.slice(-6).map(h => ({
    mes: h.mes_referencia.split('/')[0],
    consumo: h.consumo_kwh
  }));

  return (
    <div ref={ref} className="bg-white p-10 max-w-[210mm] mx-auto text-slate-800 shadow-none print:shadow-none font-sans border border-slate-100">
      
      {/* HEADER */}
      <div className="flex justify-between items-center border-b-4 border-blue-600 pb-6 mb-8">
        <div>
          <h1 className="text-3xl font-black text-blue-600 tracking-tighter">P2P ENERGIA</h1>
          <p className="text-[10px] font-bold uppercase tracking-[0.3em] text-slate-400">Inteligência Energética</p>
        </div>
        <div className="text-right">
          <Badge className="bg-blue-600 mb-2">FATURA DE SERVIÇOS</Badge>
          <p className="text-sm font-bold">Referência: {fatura.mes_referencia}</p>
          <p className="text-[10px] text-slate-500">Emissão: {new Date().toLocaleDateString('pt-BR')}</p>
        </div>
      </div>

      <div className="grid grid-cols-2 gap-10 mb-8">
        {/* DADOS DO CLIENTE */}
        <div className="space-y-1 text-left">
          <p className="text-[10px] font-bold uppercase text-slate-400">Destinatário</p>
          <p className="font-bold text-lg">{fatura.clientes?.nome_completo}</p>
          <p className="text-sm text-slate-600">CPF/CNPJ: {fatura.clientes?.cpf_cnpj}</p>
          <p className="text-sm text-slate-600">UC: {fatura.codigo_cliente}</p>
        </div>
        
        {/* RESUMO DE VENCIMENTO */}
        <div className="bg-slate-50 p-4 rounded-xl border border-slate-100 text-right">
          <p className="text-[10px] font-bold uppercase text-slate-400">Total a Pagar</p>
          <p className="text-3xl font-black text-blue-700">R$ {economia.nova_fatura_p2p?.toLocaleString('pt-BR', { minimumFractionDigits: 2 })}</p>
          <p className="text-sm font-bold mt-1 text-slate-700 underline">Vencimento: {fatura.data_vencimento ? new Date(fatura.data_vencimento + "T00:00:00").toLocaleDateString('pt-BR') : '---'}</p>
        </div>
      </div>

      {/* QUADRO DE GERAÇÃO DE VALOR (O PONTO CHAVE) */}
      <div className="grid grid-cols-3 gap-0 border-2 border-blue-600 rounded-2xl overflow-hidden mb-8">
        <div className="p-6 bg-slate-50 border-r flex flex-col justify-center text-left">
          <p className="text-[10px] font-bold text-slate-400 uppercase">Custo Sem P2P (ENEL)</p>
          <p className="text-xl font-bold text-red-500 line-through">R$ {economia.ft_enel_sem_gd?.toLocaleString('pt-BR')}</p>
          <p className="text-[9px] text-slate-400 mt-1 italic">*Baseado na tarifa vigente</p>
        </div>
        <div className="p-6 bg-green-50 border-r flex flex-col justify-center text-left">
          <p className="text-[10px] font-bold text-green-600 uppercase">Sua Economia Real</p>
          <div className="flex items-center gap-2">
            <TrendingDown className="w-5 h-5 text-green-600" />
            <p className="text-2xl font-black text-green-600">R$ {economia.economia_reais?.toLocaleString('pt-BR')}</p>
          </div>
          <p className="text-[9px] text-green-600 font-bold mt-1 uppercase">Desconto Garantido</p>
        </div>
        <div className="p-6 bg-blue-600 text-white flex flex-col justify-center text-left">
          <p className="text-[10px] font-bold opacity-80 uppercase">Total Com P2P</p>
          <p className="text-2xl font-black italic">R$ {economia.nova_fatura_p2p?.toLocaleString('pt-BR')}</p>
          <p className="text-[9px] opacity-80 mt-1">Economia aplicada com sucesso.</p>
        </div>
      </div>

      {/* HISTÓRICO E IMPACTO */}
      <div className="grid grid-cols-2 gap-8 mb-10 h-[180px]">
        <div className="border rounded-xl p-4 text-left">
          <p className="text-[10px] font-bold uppercase text-slate-400 mb-4">Consumo Recente (kWh)</p>
          <ResponsiveContainer width="100%" height="80%">
            <BarChart data={dadosGrafico}>
              <XAxis dataKey="mes" fontSize={10} axisLine={false} tickLine={false} />
              <Bar dataKey="consumo" fill="#3b82f6" radius={[4, 4, 0, 0]} />
            </BarChart>
          </ResponsiveContainer>
        </div>
        
        <div className="bg-emerald-600 rounded-xl p-6 text-white relative overflow-hidden flex flex-col justify-center text-left">
          <TreeDeciduous className="absolute -right-4 -bottom-4 w-24 h-24 opacity-20" />
          <div className="flex items-center gap-2 mb-2">
            <Leaf className="w-4 h-4" />
            <p className="text-[10px] font-bold uppercase tracking-widest">Impacto Ambiental</p>
          </div>
          <p className="text-lg font-bold leading-tight">Você evitou a emissão de {(fatura.consumo_kwh * 0.089).toFixed(1)}kg de CO₂.</p>
          <p className="text-[10px] opacity-80 mt-2 italic">Obrigado por apoiar a energia limpa!</p>
        </div>
      </div>

      {/* ÁREA DE PAGAMENTO - CANHOTO */}
      <div className="border-t-2 border-dashed border-slate-200 pt-8 mt-auto">
        <div className="flex justify-between items-start gap-10">
          <div className="text-left space-y-4">
            <div className="flex items-center gap-2">
              <ShieldCheck className="w-5 h-5 text-blue-600" />
              <p className="text-sm font-black uppercase">Pagamento Autenticado</p>
            </div>
            <div className="space-y-1">
              <p className="text-[10px] font-bold text-slate-400 uppercase">Linha Digitável</p>
              <div className="bg-slate-100 p-3 rounded font-mono text-xs break-all border border-slate-200">
                {cobranca.linha_digitavel_p2p || 'Boleto em processamento...'}
              </div>
            </div>
            <p className="text-[9px] text-slate-400 leading-relaxed italic">
              A P2P Energia utiliza o sistema de liquidação Asaas para sua segurança. 
              Após o pagamento, o crédito de energia é compensado automaticamente em sua UC.
            </p>
          </div>

          <div className="flex flex-col items-center bg-slate-50 p-4 rounded-xl border border-slate-100">
            <p className="text-[10px] font-bold uppercase mb-2 flex items-center gap-1">
              <Smartphone className="w-3 h-3" /> Pague via PIX
            </p>
            {cobranca.linha_digitavel_p2p ? (
              <QRCodeSVG value={cobranca.link_boleto_pdf} size={100} />
            ) : (
              <div className="w-[100px] h-[100px] bg-slate-200 animate-pulse rounded" />
            )}
            <p className="text-[8px] mt-2 text-slate-400 font-bold uppercase">Escaneie o QR Code</p>
          </div>
        </div>
      </div>
    </div>
  );
});

FaturaP2P.displayName = 'FaturaP2P';