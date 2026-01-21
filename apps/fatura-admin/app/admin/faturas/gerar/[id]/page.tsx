'use client'

import { useEffect, useState, useRef, useMemo } from 'react'
import { useParams } from 'next/navigation'
import { supabase } from '@/lib/supabase'
import { useReactToPrint } from 'react-to-print'
import { TreeDeciduous, Printer, Info, TrendingUp, TrendingDown, ExternalLink, Calculator, BarChart3, Hash, Calendar } from 'lucide-react'
import { Button } from '@/components/ui/button'
import { QRCodeSVG } from 'qrcode.react'
import Barcode from 'react-barcode'
import { BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip, Legend, ResponsiveContainer, LineChart, Line, Cell, ReferenceLine } from 'recharts'

export default function GerarFaturaPage() {
  const params = useParams()
  const componentRef = useRef<HTMLDivElement>(null)
  
  const [fatura, setFatura] = useState<any>(null)
  const [faturaAnterior, setFaturaAnterior] = useState<any>(null)
  const [historicoTotal, setHistoricoTotal] = useState<any[]>([])
  const [loading, setLoading] = useState(true)
  const [dadosComposicao, setDadosComposicao] = useState<any[]>([])

  const getEconomia = (data: any) => {
    if (!data?.economia_gerada) return {};
    return Array.isArray(data.economia_gerada) ? data.economia_gerada[0] : data.economia_gerada;
  };

  const mesRefParaNumero = (mesRef: string) => {
    if (!mesRef) return 0;
    const [mes, ano] = mesRef.split('/');
    return parseInt(ano + mes.padStart(2, '0'));
  };

  useEffect(() => {
    async function loadFatura() {
      if (!params.id) return
      const { data, error } = await supabase
        .from('faturas')
        .select(`*, clientes (*), economia_gerada (*), cobrancas (*), itens_faturados (*)`)
        .eq('id', params.id)
        .single()

      if (data) {
        setFatura(data)
        const { data: historico } = await supabase
          .from('faturas')
          .select('mes_referencia, consumo_kwh, bandeira_tarifaria, economia_gerada(economia_reais, ft_enel_sem_gd, nova_fatura_p2p)')
          .eq('codigo_cliente', data.codigo_cliente);

        if (historico) {
          setHistoricoTotal(historico);
          const valorAtual = mesRefParaNumero(data.mes_referencia);
          const anteriores = historico
            .filter(f => mesRefParaNumero(f.mes_referencia) < valorAtual)
            .sort((a, b) => mesRefParaNumero(b.mes_referencia) - mesRefParaNumero(a.mes_referencia));
          if (anteriores.length > 0) setFaturaAnterior(anteriores[0]);
        }

        const eco = getEconomia(data);
        const itemCIP = data.itens_faturados?.find((i: any) => i.descricao.includes("CIP"));
        const valorCIP = itemCIP ? Math.abs(itemCIP.valor) : 0;
        const valorP2P = eco?.lc_p2p || 0;
        const tributos = data.tributos || 0;
        const infraEnel = (data.ft_enel_com_gd || 0) - valorCIP - tributos;

        setDadosComposicao([{
          name: '',
          'Energia P2P': valorP2P,
          'Infra Enel': infraEnel > 0 ? infraEnel : 0,
          'Ilum. Pública': valorCIP,
          'Tributos': tributos
        }]);
      }
      setLoading(false)
    }
    loadFatura()
  }, [params.id])

  const economiaAcumulada = useMemo(() => {
    return historicoTotal.reduce((acc, f) => acc + (getEconomia(f)?.economia_reais || 0), 0);
  }, [historicoTotal]);

  const dadosTimeline = useMemo(() => {
    return historicoTotal
      .sort((a, b) => mesRefParaNumero(a.mes_referencia) - mesRefParaNumero(b.mes_referencia))
      .slice(-12)
      .map(f => {
        const eco = getEconomia(f);
        const bandeira = f.bandeira_tarifaria?.toLowerCase() || '';
        return {
          name: f.mes_referencia.split('/')[0],
          enel: eco?.ft_enel_sem_gd || 0,
          p2p: eco?.nova_fatura_p2p || 0,
          consumo: f.consumo_kwh || 0,
          corBandeira: bandeira.includes('vermelha') ? '#ef4444' : 
                        bandeira.includes('amarela') ? '#facc15' : '#22c55e'
        };
      });
  }, [historicoTotal]);

  const handlePrint = useReactToPrint({
    contentRef: componentRef,
    documentTitle: `Fatura_P2P_${fatura?.clientes?.nome_completo || ''}`,
  })

  if (loading || !fatura) return <div className="p-20 text-center italic text-slate-400">Processando...</div>

  const economia = getEconomia(fatura);
  const cobranca = Array.isArray(fatura.cobrancas) ? fatura.cobrancas[0] : (fatura.cobrancas || {});
  const cliente = fatura?.clientes || {};
  const itensCompensados = fatura.itens_faturados?.filter((i: any) => i.valor < 0) || [];
  const somatorioCompensados = itensCompensados.reduce((acc: number, item: any) => acc + Math.abs(item.valor), 0);
  const diffConsumo = fatura.consumo_kwh - (faturaAnterior?.consumo_kwh || 0);
  const percTendencia = faturaAnterior ? ((diffConsumo / faturaAnterior.consumo_kwh) * 100).toFixed(1) : "0";
  const faturaNumeroUnico = `FT-${fatura.mes_referencia.replace('/', '')}-${cliente.codigo_cliente?.toString().slice(-4)}`;

  return (
    <div className="p-4 md:p-8 bg-slate-100 min-h-screen text-left">
      <div className="max-w-[210mm] mx-auto mb-4 flex justify-end print:hidden">
        <Button onClick={() => handlePrint()} className="bg-blue-600 hover:bg-blue-700 font-bold">
          <Printer className="w-4 h-4 mr-2" /> Gerar PDF
        </Button>
      </div>

      <div ref={componentRef} className="p-8 bg-white shadow-lg max-w-[210mm] mx-auto text-slate-800 border border-slate-200 print:shadow-none print:border-none">
        
        {/* CABEÇALHO */}
        <div className="flex justify-between border-b-4 border-green-600 pb-2 mb-4 items-center">
          <div>
            <div className="font-bold text-3xl text-green-600 uppercase">P2P <span className="font-normal">Energia</span></div>
            <div className="flex gap-4 mt-1">
              <p className="text-[9px] font-bold text-slate-400 uppercase tracking-tighter">ID: {faturaNumeroUnico}</p>
              <p className="text-[9px] font-bold text-slate-400 uppercase tracking-tighter">Emissão: {new Date().toLocaleDateString('pt-BR')}</p>
            </div>
          </div>
          <div className="text-right">
            <h1 className="text-lg font-black uppercase tracking-tighter">Fatura de Energia</h1>
            <p className="text-sm font-medium text-slate-500 italic">Referência: {fatura.mes_referencia}</p>
          </div>
        </div>

        {/* DISTRIBUIÇÃO 50/50 */}
        <div className="grid grid-cols-2 gap-2 mb-4">
          <div className="bg-slate-50 p-4 rounded-xl border border-slate-100 flex flex-col justify-center">
            <p className="text-[9px] font-bold uppercase text-slate-400 mb-1">Unidade Consumidora</p>
            <p className="font-black text-base text-slate-900 uppercase leading-tight">{cliente.nome_completo}</p>
            <p className="text-[10px] text-slate-500 font-bold mt-1 uppercase">CÓD: {cliente.codigo_cliente} | UC: {cliente.unidade_consumidora}</p>
          </div>
          <div className="bg-emerald-50 rounded-xl border border-emerald-100 p-4 flex items-center gap-4">
            <TreeDeciduous className="w-8 h-8 text-emerald-600 shrink-0" />
            <div className="text-left w-full">
              <p className="text-[10px] font-black text-emerald-700 uppercase leading-none mb-1">Impacto Ambiental</p>
              <p className="text-[10px] text-emerald-800 leading-tight">
                Seu consumo foi de <strong>{fatura.consumo_kwh}kWh</strong> neste mês.<br/>
                Você evitou <strong>{(fatura.consumo_kwh * 0.089).toFixed(1)}kg</strong> de CO₂.
              </p>
              <div className="mt-2 pt-2 border-t border-emerald-200/50 flex justify-between items-center">
                <p className="text-[9px] font-bold text-emerald-600 uppercase">Total Acumulado</p>
                <p className="text-sm font-black text-emerald-700">R$ {economiaAcumulada.toLocaleString('pt-BR', { minimumFractionDigits: 2 })}</p>
              </div>
            </div>
          </div>
        </div>

        <div className="grid grid-cols-10 gap-4 mb-4">
          {/* DETALHAMENTO ESQUERDA */}
          <div className="col-span-6 border rounded-2xl overflow-hidden border-slate-200">
            <div className="bg-slate-50 p-2 border-b border-slate-200 text-left">
              <h3 className="text-[10px] font-bold uppercase text-slate-600">Detalhamento Financeiro</h3>
            </div>
            <div className="p-4 space-y-4">
              <div className="flex justify-between items-start border-b pb-2 text-left">
                <div className="space-y-0.5">
                  <p className="font-bold text-slate-700 uppercase text-[10px]">1. Custos Fixos Concessionária</p>
                  <p className="text-[9px] text-slate-400 leading-tight">Taxas, CIP e Tributos</p>
                  {/* LINK FORÇADO PARA PDF */}
                  <a 
                    href={fatura.link_pdf_original} 
                    target="_blank" 
                    rel="noopener noreferrer"
                    className="flex items-center gap-1 text-[9px] text-blue-600 font-bold hover:underline cursor-pointer"
                    style={{ pointerEvents: 'auto' }}
                  >
                    <ExternalLink className="w-3 h-3" /> Fatura Original Enel
                  </a>
                </div>
                <p className="font-bold text-sm">R$ {fatura.ft_enel_com_gd?.toLocaleString('pt-BR', { minimumFractionDigits: 2 })}</p>
              </div>
              <div className="space-y-1 text-left">
                <p className="font-bold text-slate-700 uppercase text-[10px]">2. Gestão de Créditos P2P</p>
                {itensCompensados.map((item: any, idx: number) => (
                  <div key={idx} className="flex justify-between text-[10px] text-slate-600 pl-3 border-l-2 border-green-200 leading-none py-1">
                    <span>{item.descricao}</span>
                    <span className="font-bold text-green-600">- R$ {Math.abs(item.valor).toLocaleString('pt-BR', { minimumFractionDigits: 2 })}</span>
                  </div>
                ))}
              </div>
              <div className="border-t-2 border-slate-100 pt-2 bg-slate-50/50 p-3 rounded-xl">
                <div className="flex justify-between items-center mb-1">
                  <p className="text-[11px] font-black text-slate-800 uppercase">Subtotal Gestão P2P</p>
                  <p className="font-black text-base text-slate-800">R$ {economia.lc_p2p?.toLocaleString('pt-BR', { minimumFractionDigits: 2 })}</p>
                </div>
                <p className="text-[9px] text-slate-400 font-bold uppercase text-left italic">
                  Memória: (R$ {somatorioCompensados.toLocaleString('pt-BR', { minimumFractionDigits: 2 })}) × (1 - {cliente.desconto_percentual/100})
                </p>
              </div>
            </div>
          </div>

          {/* CARDS DIREITA */}
          <div className="col-span-4 space-y-2">
            <div className={`p-3 rounded-xl border flex items-center gap-3 ${diffConsumo > 0 ? 'bg-orange-50 border-orange-200' : 'bg-blue-50 border-blue-200'}`}>
              {diffConsumo > 0 ? <TrendingUp className="w-4 h-4 text-orange-600" /> : <TrendingDown className="w-4 h-4 text-blue-600" />}
              <div className="text-left">
                <p className="text-[9px] font-black uppercase text-slate-500 leading-none">Gestão de Consumo</p>
                <p className="text-[10px] font-bold text-slate-700">{diffConsumo > 0 ? `Aumento de ${percTendencia}%` : `Redução de ${Math.abs(Number(percTendencia))}%`}</p>
              </div>
            </div>
            <div className="p-2 border bg-red-50 flex justify-between rounded-xl"><p className="text-[9px] font-bold text-red-800 uppercase">Custo Sem P2P</p><p className="text-sm font-bold text-red-800 line-through">R$ {economia.ft_enel_sem_gd?.toLocaleString('pt-BR', { minimumFractionDigits: 2 })}</p></div>
            <div className="p-2 border bg-emerald-600 text-white flex justify-between rounded-xl"><p className="text-[9px] font-black uppercase">Economia Mês</p><p className="text-lg font-black">R$ {economia.economia_reais?.toLocaleString('pt-BR', { minimumFractionDigits: 2 })}</p></div>
            <div className="p-3 border bg-slate-900 text-white rounded-xl shadow-md">
              <div className="flex justify-between items-center text-left"><p className="text-[9px] font-black text-emerald-400 uppercase">Total a Pagar P2P</p><p className="text-lg font-black">R$ {economia.nova_fatura_p2p?.toLocaleString('pt-BR', { minimumFractionDigits: 2 })}</p></div>
              <p className="text-[8px] text-center font-bold text-slate-400 uppercase mt-1 tracking-widest">Vencimento: {fatura.data_vencimento ? new Date(fatura.data_vencimento + "T12:00:00").toLocaleDateString('pt-BR') : '---'}</p>
            </div>

            {/* GRÁFICO DE COMPOSIÇÃO */}
            <div className="p-3 bg-white border border-slate-100 rounded-xl flex flex-col h-[130px] overflow-hidden">
              <p className="text-[9px] font-black text-slate-400 uppercase mb-2 text-center">Composição da Fatura</p>
              <div className="flex-1 w-full" style={{ minHeight: '80px' }}>
                <ResponsiveContainer width="100%" height="100%">
                  <BarChart data={dadosComposicao} layout="vertical" margin={{ top: 0, right: 30, left: -35, bottom: 20 }}>
                    <XAxis type="number" hide />
                    <YAxis dataKey="name" type="category" hide />
                    <Bar dataKey="Energia P2P" stackId="a" fill="#3b82f6" barSize={25} />
                    <Bar dataKey="Infra Enel" stackId="a" fill="#94a3b8" />
                    <Bar dataKey="Ilum. Pública" stackId="a" fill="#facc15" />
                    <Bar dataKey="Tributos" stackId="a" fill="#ef4444" radius={[0, 4, 4, 0]} />
                    <Legend verticalAlign="bottom" align="center" iconType="circle" wrapperStyle={{ fontSize: '8px', fontWeight: 'bold', paddingTop: '10px' }} />
                  </BarChart>
                </ResponsiveContainer>
              </div>
            </div>
          </div>
        </div>

        {/* HISTÓRICO 12 MESES */}
        <div className="grid grid-cols-10 gap-2 mb-4">
          <div className="col-span-6 bg-slate-50/50 border rounded-2xl p-3 h-[180px] text-left">
            <p className="text-[9px] font-black text-slate-400 uppercase mb-2 flex items-center gap-2"><TrendingUp className="w-3 h-3" /> Performance: Enel vs P2P</p>
            <ResponsiveContainer width="100%" height="80%">
              <LineChart data={dadosTimeline}>
                <CartesianGrid strokeDasharray="2 2" vertical={false} stroke="#e2e8f0" />
                <XAxis dataKey="name" axisLine={false} tickLine={false} tick={{fontSize: 8, fontWeight: 'bold'}} />
                <YAxis hide domain={['auto', 'auto']} />
                <Line type="monotone" dataKey="enel" stroke="#ef4444" strokeWidth={2} dot={{ r: 3 }} strokeDasharray="3 3" />
                <Line type="monotone" dataKey="p2p" stroke="#22c55e" strokeWidth={3} dot={{ r: 4 }} />
              </LineChart>
            </ResponsiveContainer>
          </div>

          <div className="col-span-4 bg-slate-50/50 border rounded-2xl p-3 h-[180px] text-left">
            <p className="text-[9px] font-black text-slate-400 uppercase mb-2 flex items-center gap-2"><BarChart3 className="w-3 h-3" /> Consumo & Bandeiras</p>
            <ResponsiveContainer width="100%" height="80%">
              <BarChart data={dadosTimeline}>
                <CartesianGrid strokeDasharray="2 2" vertical={false} stroke="#e2e8f0" />
                <XAxis dataKey="name" axisLine={false} tickLine={false} tick={{fontSize: 8, fontWeight: 'bold'}} />
                <YAxis hide />
                <ReferenceLine y={fatura.media_consumo || 0} stroke="#94a3b8" strokeDasharray="3 3" label={{ position: 'right', value: 'Média', fontSize: 6, fill: '#94a3b8' }} />
                <Bar dataKey="consumo" barSize={15}>
                  {dadosTimeline.map((entry, index) => (
                    <Cell key={`cell-${index}`} fill={entry.corBandeira} />
                  ))}
                </Bar>
              </BarChart>
            </ResponsiveContainer>
          </div>
        </div>

        {/* PAGAMENTO E CÓDIGO DE BARRAS FINAL */}
        <div className="pt-2 border-t-2 border-slate-100 text-left">
          <div className="grid grid-cols-10 gap-6 items-end">
            <div className="col-span-7 space-y-2">
              <p className="text-[10px] font-black uppercase tracking-widest text-slate-800 flex items-center gap-2"><span className="w-2 h-2 bg-blue-600 rounded-full animate-pulse"></span> Pagamento Digital</p>
              <div className="bg-slate-50 p-3 font-mono text-[13px] font-bold text-blue-900 border rounded-lg text-center tracking-tighter select-all">
                {cobranca.linha_digitavel_p2p || 'PROCESSANDO BOLETO...'}
              </div>
            </div>
            <div className="col-span-3 flex flex-col items-center border rounded-xl p-1 bg-white">
              <p className="text-[8px] font-black uppercase mb-1">Pix Copia e Cola</p>
              {cobranca.payload_pix ? <QRCodeSVG value={cobranca.payload_pix} size={85} /> : <div className="h-[85px] w-[85px] bg-slate-50" />}
            </div>
          </div>

          {/* CÓDIGO DE BARRAS NO FINAL DA PÁGINA */}
          <div className="mt-6 flex flex-col items-center justify-center p-4 border-t border-slate-50 bg-slate-50/20 rounded-xl">
             {cobranca.linha_digitavel_p2p ? (
               <div className="w-full flex justify-center py-2">
                  <Barcode 
                    value={cobranca.linha_digitavel_p2p.replace(/\D/g, '')} 
                    format="itf" 
                    width={1.8} 
                    height={45} 
                    displayValue={false} 
                    margin={0} 
                    background="transparent"
                  />
               </div>
             ) : (
               <div className="h-[45px] text-[10px] italic text-slate-300">Aguardando dados da linha digitável...</div>
             )}
             <p className="text-[8px] font-bold text-slate-400 uppercase mt-1 tracking-[12px]">AutenticaçãoBancária</p>
          </div>
        </div>
      </div>
    </div>
  )
}