'use client'

import { useEffect, useState } from 'react'
import { supabase } from '@/lib/supabase'
import { Card, CardHeader, CardTitle, CardContent } from "@/components/ui/card"
import { Button } from "@/components/ui/button"
import { Popover, PopoverContent, PopoverTrigger } from "@/components/ui/popover"
import { 
  Clock, CheckCircle2, Zap, ChevronDown, TrendingUp, 
  Users, Coins, BarChart3, CalendarDays 
} from 'lucide-react'

export default function AdminDashboard() {
  const [faturas, setFaturas] = useState<any[]>([])
  const [totalClientes, setTotalClientes] = useState(0)
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    fetchDados();
  }, []);

  async function fetchDados() {
    setLoading(true);
    try {
      const { data: faturasData, error: faturasError } = await supabase.from('faturas').select(`
        *, 
        clientes(nome_completo), 
        cobrancas(status_pagamento), 
        economia_gerada(nova_fatura_p2p, economia_reais, lc_p2p)
      `).order('mes_referencia', { ascending: false });

      if (faturasError) throw faturasError;

      const { count, error: countError } = await supabase
        .from('clientes')
        .select('*', { count: 'exact', head: true });

      if (countError) throw countError;

      setFaturas(faturasData || []);
      setTotalClientes(count || 0);
    } catch (error) {
      console.error("Erro ao buscar dados do Supabase:", error);
    } finally {
      setLoading(false);
    }
  }

  // --- LÓGICA DE INTELIGÊNCIA ---
  const dadosAgrupados = faturas.reduce((acc: any, f: any) => {
    const nome = f.clientes?.nome_completo || "Desconhecido";
    // Normalização para comparação de status (case insensitive)
    const status = (f.cobrancas?.[0]?.status_pagamento || 'pendente').toLowerCase();
    
    const econ = f.economia_gerada;
    const econData = Array.isArray(econ) ? econ[0] : econ;
    
    const valorP2P = econData?.nova_fatura_p2p || 0;
    const economia = econData?.economia_reais || 0;
    const lucro = econData?.lc_p2p || 0;
    const saldoKwh = Number(f.saldo_total_atualizado || 0);

    if (!acc[nome]) {
      acc[nome] = { 
        pendente: 0, 
        recebido: 0, 
        economia: 0, 
        lucro: 0,
        saldoCredito: saldoKwh,
        proximaLeitura: f.proxima_leitura,
        mesReferencia: f.mes_referencia,
        consumoKwh: f.consumo_kwh || 0, // Adicionado para a tabela
        mediaConsumo: f.media_consumo || 0,
        reservaCreditos: f.reserva_creditos || 0
      };
    }
    
    // Correção da Lógica: Se o status for 'pago', soma em recebido
    if (status === 'pago') {
      acc[nome].recebido += valorP2P;
    } else {
      acc[nome].pendente += valorP2P;
    }
    
    acc[nome].economia += economia;
    acc[nome].lucro += lucro;

    return acc;
  }, {});

  const totalPendente = Object.values(dadosAgrupados).reduce((a: any, b: any) => a + b.pendente, 0);
  const totalRecebido = Object.values(dadosAgrupados).reduce((a: any, b: any) => a + b.recebido, 0);
  const economiaTotal = Object.values(dadosAgrupados).reduce((a: any, b: any) => a + b.economia, 0);
  const lucroTotal = Object.values(dadosAgrupados).reduce((a: any, b: any) => a + b.lucro, 0);
  const saldoTotalCreditos = Object.values(dadosAgrupados).reduce((a: any, b: any) => a + b.saldoCredito, 0);

  const ListaClientesCard = ({ tipo }: { tipo: 'pendente' | 'recebido' | 'economia' | 'saldoCredito' | 'lucro' }) => (
    <Popover>
      <PopoverTrigger asChild>
        <Button variant="ghost" size="sm" className="h-6 w-6 p-0 hover:bg-slate-100 rounded-full">
          <ChevronDown className="h-4 w-4 text-slate-400" />
        </Button>
      </PopoverTrigger>
      <PopoverContent className="w-80 p-0 shadow-2xl border-slate-200" align="end">
        <div className="bg-slate-50 p-2 border-b text-[10px] font-bold uppercase text-slate-500 text-left tracking-wider">Detalhamento</div>
        <div className="max-h-72 overflow-y-auto">
          {Object.entries(dadosAgrupados)
            .filter(([_, v]: any) => v[tipo] > 0)
            .sort((a: any, b: any) => b[1][tipo] - a[1][tipo])
            .map(([nome, v]: any) => (
              <div key={nome} className="flex justify-between p-3 border-b text-xs hover:bg-slate-50 transition-colors">
                <span className="truncate flex-1 text-left pr-2 font-medium">{nome}</span>
                <span className="font-bold">
                  {tipo === 'saldoCredito' ? `${v[tipo].toLocaleString('pt-BR')} kWh` : `R$ ${v[tipo].toLocaleString('pt-BR', { minimumFractionDigits: 2 })}`}
                </span>
              </div>
          ))}
        </div>
      </PopoverContent>
    </Popover>
  );

  if (loading) return <div className="p-8 text-center text-slate-500 animate-pulse font-medium">Sincronizando operação P2P...</div>

  return (
    <div className="p-8 space-y-8 bg-slate-50/30 min-h-screen">
      <div className="flex flex-col gap-1">
        <h1 className="text-3xl font-bold text-slate-900 text-left tracking-tight">Painel de Controle</h1>
        <p className="text-slate-500 text-left text-sm">Monitoramento técnico e financeiro em tempo real.</p>
      </div>

      {/* 1. POSIÇÃO PRIORITÁRIA: CRONOGRAMA DE LEITURAS */}
      <Card className="shadow-sm border-slate-200">
        <CardHeader className="flex flex-row items-center gap-2 border-b bg-slate-50/50 py-3">
          <CalendarDays className="h-5 w-5 text-slate-500" />
          <div className="text-left">
            <CardTitle className="text-md font-bold text-slate-800 uppercase tracking-wide">Acompanhamento Técnico de Leituras</CardTitle>
          </div>
        </CardHeader>
        <CardContent className="p-0 overflow-x-auto">
          <table className="w-full text-sm text-left">
            <thead>
              <tr className="bg-slate-50 text-slate-500 uppercase text-[9px] font-black tracking-widest border-b">
                <th className="px-6 py-3">Nome do Cliente</th>
                <th className="px-6 py-3">Mês Ref.</th>
                <th className="px-6 py-3">Próxima Leitura</th>
                <th className="px-6 py-3 text-right">Consumo (kWh)</th>
                <th className="px-6 py-3 text-right">Média</th>
                <th className="px-6 py-3 text-right">Estoque Reserva</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-100">
              {Object.entries(dadosAgrupados).map(([nome, v]: any) => (
                <tr key={nome} className="hover:bg-slate-50/80 transition-colors group">
                  <td className="px-6 py-2 font-semibold text-slate-700 text-xs">{nome}</td>
                  <td className="px-6 py-2 text-slate-500 text-xs">{v.mesReferencia}</td>
                  <td className="px-6 py-2">
                    <span className="px-2 py-0.5 bg-blue-50 text-blue-700 rounded text-[11px] font-bold">
                      {v.proximaLeitura || '--/--/----'}
                    </span>
                  </td>
                  <td className="px-6 py-2 text-right text-slate-600 text-xs">{v.consumoKwh.toLocaleString('pt-BR')}</td>
                  <td className="px-6 py-2 text-right text-slate-500 text-xs">{v.mediaConsumo.toLocaleString('pt-BR')}</td>
                  <td className="px-6 py-2 text-right">
                    <span className={`text-[10px] font-black px-2 py-0.5 rounded ${v.reservaCreditos >= 1 ? 'bg-green-100 text-green-700' : 'bg-amber-100 text-amber-700'}`}>
                      {v.reservaCreditos.toLocaleString('pt-BR', { minimumFractionDigits: 1 })} MÊS(ES)
                    </span>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </CardContent>
      </Card>

      {/* 2. CARDS FINANCEIROS (Agora por último) */}
      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-5 gap-4">
        <Card className="border-l-4 border-l-orange-500 shadow-sm">
          <CardHeader className="flex flex-row items-center justify-between pb-1 pt-4">
            <div className="flex items-center gap-2"><CardTitle className="text-[10px] font-black uppercase text-slate-400">A Receber</CardTitle><ListaClientesCard tipo="pendente" /></div>
            <Clock className="h-4 w-4 text-orange-500" />
          </CardHeader>
          <CardContent className="text-left pb-4">
            <div className="text-xl font-bold text-slate-900">R$ {totalPendente.toLocaleString('pt-BR', { minimumFractionDigits: 2 })}</div>
          </CardContent>
        </Card>

        <Card className="border-l-4 border-l-green-500 shadow-sm">
          <CardHeader className="flex flex-row items-center justify-between pb-1 pt-4">
            <div className="flex items-center gap-2"><CardTitle className="text-[10px] font-black uppercase text-slate-400">Recebido</CardTitle><ListaClientesCard tipo="recebido" /></div>
            <CheckCircle2 className="h-4 w-4 text-green-500" />
          </CardHeader>
          <CardContent className="text-left pb-4">
            <div className="text-xl font-bold text-slate-900">R$ {totalRecebido.toLocaleString('pt-BR', { minimumFractionDigits: 2 })}</div>
          </CardContent>
        </Card>

        <Card className="border-l-4 border-l-blue-500 shadow-sm">
          <CardHeader className="flex flex-row items-center justify-between pb-1 pt-4">
            <div className="flex items-center gap-2"><CardTitle className="text-[10px] font-black uppercase text-slate-400">Economia</CardTitle><ListaClientesCard tipo="economia" /></div>
            <Zap className="h-4 w-4 text-blue-500" />
          </CardHeader>
          <CardContent className="text-left pb-4">
            <div className="text-xl font-bold text-slate-900">R$ {economiaTotal.toLocaleString('pt-BR', { minimumFractionDigits: 2 })}</div>
          </CardContent>
        </Card>

        <Card className="border-l-4 border-l-emerald-600 shadow-sm bg-emerald-50/5">
          <CardHeader className="flex flex-row items-center justify-between pb-1 pt-4">
            <div className="flex items-center gap-2"><CardTitle className="text-[10px] font-black uppercase text-emerald-700">Lucro Bruto</CardTitle><ListaClientesCard tipo="lucro" /></div>
            <BarChart3 className="h-4 w-4 text-emerald-600" />
          </CardHeader>
          <CardContent className="text-left pb-4">
            <div className="text-xl font-bold text-emerald-700">R$ {lucroTotal.toLocaleString('pt-BR', { minimumFractionDigits: 2 })}</div>
          </CardContent>
        </Card>

        <Card className="border-l-4 border-l-purple-500 shadow-sm">
          <CardHeader className="flex flex-row items-center justify-between pb-1 pt-4">
            <div className="flex items-center gap-2"><CardTitle className="text-[10px] font-black uppercase text-slate-400">Saldo Créditos</CardTitle><ListaClientesCard tipo="saldoCredito" /></div>
            <Coins className="h-4 w-4 text-purple-500" />
          </CardHeader>
          <CardContent className="text-left pb-4">
            <div className="text-xl font-bold text-slate-900">{saldoTotalCreditos.toLocaleString('pt-BR')} <span className="text-[10px] font-normal">kWh</span></div>
          </CardContent>
        </Card>
      </div>
    </div>
  )
}