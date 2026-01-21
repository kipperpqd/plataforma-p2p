'use client'

import { useState, useRef, useEffect } from 'react'
import { supabase } from '@/lib/supabase'
import { useReactToPrint } from 'react-to-print'
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Button } from "@/components/ui/button"
import { Printer, TreeDeciduous, Globe, User } from 'lucide-react'
import { toast, Toaster } from "sonner"
import GraficoLinhas from '@/components/graficos/GraficoLinhas'
import GraficoBarras from '@/components/graficos/GraficoBarras'
import GraficoPizza from '@/components/graficos/GraficoPizza'

export default function RelatoriosPage() {
  const [busca, setBusca] = useState('')
  const [listaClientes, setListaClientes] = useState<any[]>([]) 
  const [faturas, setFaturas] = useState<any[]>([])
  const [cliente, setCliente] = useState<any>(null)
  const [loading, setLoading] = useState(false)
  const [mediaAnual, setMediaAnual] = useState(0)
  const [dadosPizza, setDadosPizza] = useState<any[]>([]) 
  const componentRef = useRef(null)

  // --- FUNÇÃO AUXILIAR DE SEGURANÇA (NORMALIZAÇÃO) ---
  const getEconomia = (f: any) => {
    if (!f?.economia_gerada) return null;
    return Array.isArray(f.economia_gerada) ? f.economia_gerada[0] : f.economia_gerada;
  };

  useEffect(() => {
    async function fetchClientes() {
      const { data } = await supabase
        .from('clientes')
        .select('codigo_cliente, nome_completo')
        .order('nome_completo', { ascending: true })
      if (data) setListaClientes(data)
    }
    fetchClientes()
  }, [])

  async function buscarRelatorio(codigoManual?: string) {
    const valorBusca = codigoManual || busca
    if (!valorBusca) return

    setLoading(true)
    const { data, error } = await supabase
      .from('faturas')
      .select(`
        *,
        clientes (*),
        economia_gerada (*),
        itens_faturados (*),
        cobrancas (*)
      `)
      .eq('codigo_cliente', valorBusca)
      .order('mes_referencia', { ascending: true })

    if (error || !data || data.length === 0) {
      toast.error("Cliente não encontrado ou sem faturas.")
      setFaturas([])
      setCliente(null)
    } else {
      setFaturas(data)
      setCliente(data[0].clientes)
      
      const media = data.reduce((acc: number, f: any) => acc + (f.consumo_kwh || 0), 0) / data.length;
      setMediaAnual(Math.round(media));

      // Lógica para Composição de Custos (Última fatura como referência)
      const ultima = data[data.length - 1];
      const itemCIP = ultima.itens_faturados?.find((i: any) => i.descricao.includes("CIP"));
      const valorCIP = itemCIP ? Math.abs(itemCIP.valor) : 0;
      const ecoUltima = getEconomia(ultima); // --- USO DA FUNÇÃO SEGURA ---
      const valorP2P = ecoUltima?.lc_p2p || 0;

      setDadosPizza([
        { name: 'Energia P2P', value: valorP2P },
        { name: 'Infra ENEL', value: (ultima.ft_enel_com_gd || 0) - valorCIP - (ultima.tributos || 0) },
        { name: 'Iluminação Pública', value: valorCIP },
        { name: 'Tributos', value: ultima.tributos || 0 },
      ]);
      
      toast.success("Relatório gerado com sucesso!")
    }
    setLoading(false)
  }

  // --- MAPEAMENTO DE GRÁFICOS COM SEGURANÇA ---
  const dadosGraficos = faturas.map((f) => {
    const eco = getEconomia(f);
    return {
      name: f.mes_referencia.split('/')[0],
      enel: eco?.ft_enel_sem_gd || 0,
      p2p: eco?.nova_fatura_p2p || 0,
      consumo: f.consumo_kwh,
      color: f.bandeira_tarifaria?.toLowerCase().includes('vermelha') ? '#ef4444' : 
             f.bandeira_tarifaria?.toLowerCase().includes('amarela') ? '#eab308' : '#22c55e'
    };
  });

  // --- CÁLCULO DE ESTATÍSTICAS COM SEGURANÇA ---
  const stats = {
    totalKwh: faturas.reduce((acc, f) => acc + (f.consumo_kwh || 0), 0),
    totalEconomia: faturas.reduce((acc, f) => acc + (getEconomia(f)?.economia_reais || 0), 0),
    co2: (faturas.reduce((acc, f) => acc + (f.consumo_kwh || 0), 0) * 0.089).toFixed(1),
    arvores: Math.floor(faturas.reduce((acc, f) => acc + (f.consumo_kwh || 0), 0) / 1000)
  }

  const handlePrint = useReactToPrint({
    contentRef: componentRef,
    documentTitle: `Relatorio_Energia_${cliente?.nome_completo || 'Cliente'}`,
  })

  return (
    <div className="p-8 space-y-8 bg-slate-50 dark:bg-slate-950 min-h-screen transition-colors duration-300">
      <Toaster richColors position="top-right" />
      
      {/* SELETOR DE CLIENTE */}
      <div className="flex flex-col md:grid md:grid-cols-4 gap-4 items-end bg-white dark:bg-slate-900 p-6 rounded-xl shadow-sm border border-slate-200 dark:border-slate-800">
        <div className="md:col-span-3 space-y-2 w-full text-left">
          <label className="text-sm font-bold text-slate-600 dark:text-slate-400 flex items-center gap-2 text-left">
            <User className="w-4 h-4" /> Selecionar Cliente por Nome
          </label>
          <select 
            className="w-full p-2.5 bg-white dark:bg-slate-800 border border-slate-200 dark:border-slate-700 rounded-lg text-sm text-slate-900 dark:text-slate-100 focus:ring-2 focus:ring-emerald-500 outline-none transition-all cursor-pointer"
            value={busca}
            onChange={(e) => {
              setBusca(e.target.value);
              buscarRelatorio(e.target.value);
            }}
          >
            <option value="">Clique para selecionar um cliente...</option>
            {listaClientes.map((c) => (
              <option key={c.codigo_cliente} value={c.codigo_cliente}>
                {c.nome_completo} ({c.codigo_cliente})
              </option>
            ))}
          </select>
        </div>

        <div className="flex gap-2 w-full">
          {cliente && (
            <Button onClick={() => handlePrint()} variant="outline" className="w-full flex gap-2 border-emerald-200 dark:border-emerald-800 text-emerald-600 dark:text-emerald-400 hover:bg-emerald-50 dark:hover:bg-emerald-950/30 font-bold">
              <Printer className="w-4 h-4" /> Exportar PDF
            </Button>
          )}
        </div>
      </div>

      {loading && (
        <div className="flex flex-col items-center justify-center py-20 text-slate-400">
          <div className="animate-spin rounded-full h-10 w-10 border-b-2 border-emerald-600 mb-2"></div>
          <p className="font-medium italic">Consolidando análise de performance...</p>
        </div>
      )}

      {cliente && !loading && (
        <div ref={componentRef} className="bg-white dark:bg-slate-900 p-12 shadow-2xl rounded-sm border border-slate-100 dark:border-slate-800 max-w-[210mm] mx-auto print:shadow-none print:p-8">
          
          {/* HEADER DO RELATÓRIO */}
          <div className="flex justify-between items-start border-b-2 border-slate-100 dark:border-slate-800 pb-8 mb-6">
            <div className="text-left">
              <h2 className="text-2xl font-black text-slate-900 dark:text-slate-100 uppercase text-left">Relatório Anual de Performance</h2>
              <p className="text-emerald-600 font-bold tracking-widest uppercase text-xs text-left">Eficiência Energética & Sustentabilidade</p>
            </div>
            <div className="text-right">
              <p className="font-bold text-slate-800 dark:text-slate-200">{cliente.nome_completo}</p>
              <p className="text-sm text-slate-500">Cód: {cliente.codigo_cliente}</p>
              <p className="text-sm text-slate-500">Ano Referência: 2025</p>
            </div>
          </div>

          {/* STATS GRID */}
          <div className="grid grid-cols-4 gap-4 mb-8 text-left">
            <div className="bg-slate-50 dark:bg-slate-800/50 p-4 rounded-lg border dark:border-slate-700">
              <p className="text-[10px] font-bold text-slate-400 uppercase text-left">Consumo Total</p>
              <p className="text-xl font-bold dark:text-slate-100">{stats.totalKwh.toLocaleString()} <span className="text-xs">kWh</span></p>
            </div>
            <div className="bg-blue-50 dark:bg-blue-900/20 p-4 rounded-lg border border-blue-100 dark:border-blue-900">
              <p className="text-[10px] font-bold text-blue-400 uppercase text-left">Economia Gerada</p>
              <p className="text-xl font-bold text-blue-700 dark:text-blue-400">R$ {stats.totalEconomia.toLocaleString('pt-BR', { minimumFractionDigits: 2 })}</p>
            </div>
            <div className="bg-emerald-50 dark:bg-emerald-900/20 p-4 rounded-lg border border-emerald-100 dark:border-emerald-900 text-emerald-700 dark:text-emerald-400">
              <p className="text-[10px] font-bold uppercase text-left">CO₂ Evitado</p>
              <p className="text-xl font-bold">{stats.co2}kg</p>
            </div>
            <div className="bg-green-600 p-4 rounded-lg text-white">
              <p className="text-[10px] font-bold uppercase opacity-80 text-left">Árvores Salvas</p>
              <div className="flex items-center gap-2">
                <TreeDeciduous className="w-5 h-5" />
                <p className="text-xl font-bold">{stats.arvores}</p>
              </div>
            </div>
          </div>

          <div className="space-y-6">
            <div className="bg-slate-50/50 dark:bg-slate-800/30 p-4 rounded-xl border dark:border-slate-800">
               <GraficoLinhas 
                data={dadosGraficos} 
                eixoX="name"
                linhas={[
                  { key: 'enel', name: 'Fatura ENEL', color: '#ef4444', dashed: true },
                  { key: 'p2p', name: 'Fatura P2P', color: '#10b981', glow: true }
                ]}
              />
            </div>

            <div className="grid grid-cols-1 md:grid-cols-10 gap-4">
              <Card className="md:col-span-6 border dark:border-slate-800 shadow-none bg-transparent overflow-hidden">
                <CardHeader className="py-3 bg-slate-50 dark:bg-slate-800/50 text-left">
                  <CardTitle className="text-xs font-bold uppercase text-slate-700 dark:text-slate-300 text-left">Histórico de Consumo (kWh)</CardTitle>
                </CardHeader>
                <CardContent className="h-[250px] p-2">
                  <GraficoBarras 
                    data={dadosGraficos} 
                    eixoX="name" 
                    dataKey="consumo" 
                    media={mediaAnual}
                  />
                </CardContent>
              </Card>

              <Card className="md:col-span-4 border dark:border-slate-800 shadow-none bg-transparent overflow-hidden">
                <CardHeader className="py-3 bg-slate-50 dark:bg-slate-800/50 text-left">
                  <CardTitle className="text-xs font-bold uppercase text-slate-700 dark:text-slate-300 text-left">Composição de Custos</CardTitle>
                </CardHeader>
                <CardContent className="h-[250px] p-0">
                  <GraficoPizza data={dadosPizza} />
                </CardContent>
              </Card>
            </div>

            {/* TEXTO DE ANÁLISE */}
            <div className="border dark:border-slate-800 rounded-lg p-6 bg-slate-50/50 dark:bg-slate-800/30 text-left">
              <h4 className="text-sm font-black uppercase text-slate-700 dark:text-slate-300 mb-2 text-left">Análise de Performance</h4>
              <p className="text-xs text-slate-600 dark:text-slate-400 leading-relaxed italic text-left">
                {`Durante o ciclo de 2025, sua unidade consumiu ${stats.totalKwh.toLocaleString()} kWh. 
                A migração estratégica para P2P Energia resultou em uma economia de R$ ${stats.totalEconomia.toLocaleString('pt-BR', { minimumFractionDigits: 2 })}, 
                o que equivale a um faturamento médio de R$ ${(stats.totalEconomia / faturas.length).toLocaleString('pt-BR', { minimumFractionDigits: 2 })} devolvidos ao seu bolso mensalmente. 
                Além disso, sua escolha sustentável por uma fonte de energia renovável evitou a emissão de ${stats.co2}kg de CO2, 
                impacto comparável à recuperação de ${stats.arvores} árvores adultas. 
                Apesar de termos tido um ano repleto de bandeiras vermelhas conseguimos colher bons frutos.
                Toda árvore recuperada gera novos frutos. Obrigado por fazer parte dessa jornada verde conosco!`}
              </p>
            </div>
          </div>

          <div className="mt-6 p-4 bg-gradient-to-r from-blue-50 to-emerald-50 dark:from-blue-900/20 dark:to-emerald-900/20 rounded-xl border border-blue-100 dark:border-blue-900/30 text-center">
            <p className="text-sm text-slate-700 dark:text-slate-300 font-medium leading-relaxed">
              "Que em 2026 a sua energia continue gerando bons frutos e que a prosperidade seja a força motriz de cada novo projeto. 
              Conte conosco para iluminar o seu caminho com economia e sustentabilidade. Feliz Ano Novo!"
            </p>
          </div>

          <div className="mt-8 pt-6 border-t dark:border-slate-800 flex justify-between items-end">
            <div className="flex items-center gap-2">
              <Globe className="w-8 h-8 text-emerald-600" />
              <div className="text-left">
                <p className="text-[9px] font-bold uppercase text-slate-400 text-left">Certificado Emitido por</p>
                <p className="text-xs font-black text-slate-800 dark:text-slate-200 uppercase tracking-tighter text-left">Sistema P2P Energia</p>
              </div>
            </div>
            <p className="text-[9px] text-slate-400 italic">Este documento é uma representação digital consolidada de dados faturados.</p>
          </div>
        </div>
      )}
    </div>
  )
}