'use client'

import { useEffect, useState, useMemo } from 'react'
import { supabase } from '@/lib/supabase'
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Badge } from "@/components/ui/badge"
import { Button } from "@/components/ui/button"
import { 
  User, TrendingDown, FileText, CheckCircle, 
  AlertCircle, Download
} from 'lucide-react'
import { Toaster, toast } from "sonner"
import NavbarCliente from '@/components/NavbarCliente'
import GraficoLinhas from '@/components/graficos/GraficoLinhas'
import GraficoBarras from '@/components/graficos/GraficoBarras'
import GraficoPizza from '@/components/graficos/GraficoPizza'

// Importação dos Cards Modulares
import CardImpacto from '@/components/cards/CardImpacto'
import CardProjecao from '@/components/cards/CardProjecao'
import CardEficiencia from '@/components/cards/CardEficiencia'
import StepperFatura from '@/components/cards/StepperFatura'

export default function AreaCliente() {
  const [faturasReais, setFaturasReais] = useState<any[] | null>(null);
  const [dadosDashboard, setDadosDashboard] = useState<any[]>([]); 
  const [dadosConsumo, setDadosConsumo] = useState<any[]>([]);     
  const [dadosPizza, setDadosPizza] = useState<any[]>([]);         
  const [perfil, setPerfil] = useState<any>(null);
  const [resumo, setResumo] = useState({ media: 0, economiaTotal: 0, projecaoAnual: 0 });
  const [temPendencia, setTemPendencia] = useState(false);
  const [comparativoConsumo, setComparativoConsumo] = useState<{ valor: number, tendencia: 'sobe' | 'desce', percentual: string } | null>(null);

  // --- NOVA FUNÇÃO AUXILIAR DE SEGURANÇA ---
  const getEconomia = (f: any) => {
    if (!f?.economia_gerada) return null;
    return Array.isArray(f.economia_gerada) ? f.economia_gerada[0] : f.economia_gerada;
  };

  useEffect(() => {
    inicializarDashboard();
  }, []);

  async function inicializarDashboard() {
    const { data: { session } } = await supabase.auth.getSession();
    if (!session?.user?.email) {
      toast.error("Sessão expirada. Por favor, faça login novamente.");
      return;
    }
    const { data: cliente, error } = await supabase
      .from('clientes')
      .select('codigo_cliente')
      .eq('email', session.user.email)
      .single();

    if (error || !cliente) return;
    fetchDados(cliente.codigo_cliente);
  }

  const formatarIdentificador = (valor: string) => {
    if (!valor) return "---";
    const clean = valor.replace(/\D/g, '');
    if (clean.length === 11) {
        return `CPF: ${clean.substring(0,3)}.${clean.substring(3,6)}.${clean.substring(6,9)}-${clean.substring(9,11)}`;
    } else if (clean.length === 14) {
        return `CNPJ: ${clean.substring(0,2)}.${clean.substring(2,5)}.${clean.substring(5,8)}/${clean.substring(8,12)}-${clean.substring(12,14)}`;
    }
    return valor;
  };

  const converterParaData = (mesRef: string) => {
    const [mes, ano] = mesRef.split('/');
    return new Date(parseInt(ano), parseInt(mes) - 1, 1);
  };

  const totalKwhAcumulado = useMemo(() => {
    if (!faturasReais) return 0;
    return faturasReais.reduce((acc, f) => acc + (f.consumo_kwh || 0), 0);
  }, [faturasReais]);

  async function fetchDados(codigoCliente: string) {
    try {
      const { data: faturas, error } = await supabase
        .from('faturas')
        .select(`*, clientes (*), economia_gerada (*), itens_faturados (*), cobrancas (*)`)
        .eq('codigo_cliente', codigoCliente);

      if (error || !faturas || faturas.length === 0) {
        setFaturasReais([]);
        return;
      }

      const faturasOrdenadas = [...faturas].sort((a, b) => 
        converterParaData(a.mes_referencia).getTime() - converterParaData(b.mes_referencia).getTime()
      );

      setFaturasReais([...faturasOrdenadas].reverse());
      setPerfil(faturasOrdenadas[0].clientes);

      // --- CÁLCULO DE ECONOMIA CORRIGIDO ---
      const totalEconomia = faturas.reduce((acc, f) => acc + (getEconomia(f)?.economia_reais || 0), 0);
      const mediaConsumo = faturas.reduce((acc, f) => acc + (f.consumo_kwh || 0), 0) / faturas.length;
      
      const economiaMediaMensal = totalEconomia / faturas.length;
      const projecaoCalculada = economiaMediaMensal * 12;

      setResumo({ 
        media: Math.round(mediaConsumo), 
        economiaTotal: totalEconomia,
        projecaoAnual: projecaoCalculada 
      });

      if (faturasOrdenadas.length >= 2) {
        const atual = faturasOrdenadas[faturasOrdenadas.length - 1].consumo_kwh;
        const anterior = faturasOrdenadas[faturasOrdenadas.length - 2].consumo_kwh;
        const diffKwh = atual - anterior;
        const perc = ((diffKwh / anterior) * 100).toFixed(1);

        setComparativoConsumo({
          valor: Math.abs(diffKwh),
          tendencia: diffKwh > 0 ? 'sobe' : 'desce',
          percentual: perc.replace('-', '')
        });
      }

      const pendente = faturas.some(f => {
        const cob = Array.isArray(f.cobrancas) ? f.cobrancas[0] : f.cobrancas;
        return cob?.status_pagamento !== 'pago';
      });
      setTemPendencia(pendente);

      // --- TIMELINE DINÂMICA CORRIGIDA ---
      const timelineDinamica = faturasOrdenadas.slice(-12).map(f => {
        const [mes, ano] = f.mes_referencia.split('/');
        const mesesNomesCurto = ['Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun', 'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez'];
        const eco = getEconomia(f);
        return {
          name: `${mesesNomesCurto[parseInt(mes) - 1]}/${ano.slice(-2)}`,
          enel: eco?.ft_enel_sem_gd || 0,
          p2p: eco?.nova_fatura_p2p || 0,
          consumo: f.consumo_kwh || 0,
          color: f.bandeira_tarifaria?.toLowerCase().includes('vermelha') ? '#ef4444' : 
                  f.bandeira_tarifaria?.toLowerCase().includes('amarela') ? '#f59e0b' : '#22c55e'
        };
      });

      setDadosDashboard(timelineDinamica);
      setDadosConsumo(timelineDinamica);

      // --- DADOS DA PIZZA CORRIGIDOS ---
      const ultima = faturasOrdenadas[faturasOrdenadas.length - 1];
      const itemCIP = ultima.itens_faturados?.find((i: any) => i.descricao.includes("CIP"));
      const valorCIP = itemCIP ? Math.abs(itemCIP.valor) : 0;
      const ecoUltima = getEconomia(ultima);
      const valorP2P = ecoUltima?.lc_p2p || 0;

      setDadosPizza([
        { name: 'Energia P2P', value: valorP2P },
        { name: 'Infra ENEL', value: (ultima.ft_enel_com_gd || 0) - valorCIP - (ultima.tributos || 0) },
        { name: 'Iluminação Pública', value: valorCIP },
        { name: 'Tributos', value: ultima.tributos || 0 },
      ]);

    } catch (err) {
      console.error("Erro ao carregar dados:", err);
    }
  }

  const abrirFaturaP2P = (id: string) => {
    window.open(`/admin/faturas/gerar/${id}`, '_blank');
  };

  return (
    <div className="bg-slate-50 dark:bg-slate-950 min-h-screen transition-colors duration-300">
      <Toaster richColors position="top-right" />
      <NavbarCliente />

      <div className="pt-20 pb-8 px-4 md:px-8 space-y-4 max-w-7xl mx-auto text-slate-900 text-left">
        
        <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
          <Card className="border-none shadow-sm dark:bg-slate-900">
            <CardContent className="pt-6 flex items-center gap-4">
              <div className="p-3 bg-blue-100 dark:bg-blue-900/30 rounded-full"><User className="text-blue-600 dark:text-blue-400 w-5 h-5" /></div>
              <div className="overflow-hidden text-left">
                <p className="text-xs font-bold text-slate-800 dark:text-slate-400 text-left uppercase tracking-tighter">Seja bem-vindo!</p>
                <p className="font-bold text-slate-700 dark:text-slate-200 truncate text-left">{perfil?.nome_completo || 'Carregando...'}</p>
                <p className="font-bold text-slate-500 truncate text-[11px] text-left">{formatarIdentificador(perfil?.cpf_cnpj)}</p>
              </div>
            </CardContent>
          </Card>

          <Card className="border-none shadow-md bg-green-600 text-white">
            <CardContent className="pt-6 flex items-center gap-4 text-left">
              <div className="p-3 bg-white/20 rounded-full"><TrendingDown className="w-5 h-5" /></div>
              <div>
                <p className="text-xs font-bold opacity-80 uppercase tracking-widest text-left">Economia Acumulada</p>
                <p className="text-2xl font-bold text-left">R$ {(resumo.economiaTotal || 0).toLocaleString('pt-BR', { minimumFractionDigits: 2 })}</p>
              </div>
            </CardContent>
          </Card>

          <Card className={`border-none shadow-md transition-all ${!temPendencia ? 'bg-white dark:bg-slate-900 text-slate-700 dark:text-slate-200' : 'bg-orange-500 text-white'}`}>
            <CardContent className="pt-6 text-left">
              {!temPendencia ? (
                <div className="flex items-center gap-3">
                  <CheckCircle className="text-green-500 w-8 h-8" />
                  <div>
                    <p className="text-sm font-bold text-green-600 dark:text-green-400 text-left">Parabéns! Faturas em dia.</p>
                    <p className="text-[10px] opacity-70 text-slate-500 dark:text-slate-400 text-left">Sua conta não possui débitos.</p>
                  </div>
                </div>
              ) : (
                <div className="flex items-center gap-3">
                  <AlertCircle className="w-8 h-8 text-white animate-pulse" />
                  <div>
                    <p className="text-[16px] font-bold text-white text-left">Pendências encontradas!</p>
                    <p className="text-[12px] opacity-90 text-white text-left">Consulte o histórico abaixo.</p>
                  </div>
                </div>
              )}
            </CardContent>
          </Card>
        </div>

        {faturasReais && faturasReais.length > 0 && (
          <StepperFatura 
             status={ (Array.isArray(faturasReais[0].cobrancas) ? faturasReais[0].cobrancas[0]?.status_pagamento : faturasReais[0].cobrancas?.status_pagamento) === 'pago' ? 4 : 2 } 
             mesRef={faturasReais[0].mes_referencia}
          />
        )}
        
        <div className="grid grid-cols-1 md:grid-cols-4 gap-4">
          <CardImpacto totalKwh={totalKwhAcumulado} />
          <CardProjecao valorAnual={resumo.projecaoAnual} />
          <CardEficiencia dados={comparativoConsumo} />
        </div>

        <Card className="border-none shadow-sm bg-white dark:bg-slate-900 overflow-hidden text-left">
            <CardHeader className="bg-slate-50/50 dark:bg-slate-800/50 py-3 text-left">
                <CardTitle className="text-[11px] font-bold uppercase text-slate-400 tracking-widest text-left">Análise Comparativa Financeira (R$)</CardTitle>
            </CardHeader>
            <CardContent className="pt-6">
                <GraficoLinhas 
                    data={dadosDashboard} 
                    eixoX="name"
                    linhas={[
                        { key: 'enel', name: 'Fatura ENEL', color: '#ef4444', dashed: true },
                        { key: 'p2p', name: 'Fatura P2P', color: '#22c55e', glow: true }
                    ]}
                />
            </CardContent>
        </Card>

        <div className="grid grid-cols-1 md:grid-cols-10 gap-6">
          <Card className="md:col-span-6 border-none shadow-sm bg-white dark:bg-slate-900 overflow-hidden text-left">
            <CardHeader className="bg-slate-50/50 dark:bg-slate-800/50 py-3 flex justify-between items-center text-left">
              <CardTitle className="text-[11px] font-bold uppercase text-slate-400 tracking-widest text-left">
                Consumo Mensal (kWh)
              </CardTitle>
              <span className="text-xs font-bold text-blue-600 dark:text-blue-400 text-left">
                Média: {resumo.media} kWh
              </span>
            </CardHeader>
            <CardContent className="h-[300px] pt-6">
              <GraficoBarras 
                data={dadosConsumo} 
                eixoX="name" 
                dataKey="consumo" 
                media={resumo.media} 
              />
            </CardContent>
          </Card>

          <Card className="md:col-span-4 border-none shadow-sm bg-white dark:bg-slate-900 overflow-hidden text-left">
            <CardHeader className="bg-slate-50/50 dark:bg-slate-800/50 py-3 text-left">
              <CardTitle className="text-[11px] font-bold uppercase text-slate-400 tracking-widest text-left">
                Composição de Custos
              </CardTitle>
            </CardHeader>
            <CardContent className="h-[300px]">
              <GraficoPizza data={dadosPizza} />
            </CardContent>
          </Card>
        </div>

        <Card className="border-none shadow-sm bg-white dark:bg-slate-900 overflow-hidden text-left">
          <CardHeader className="border-b border-slate-50 dark:border-slate-800 pb-4 flex flex-row items-center gap-2 text-left">
            <FileText className="w-4 h-4 text-blue-600" /><CardTitle className="text-md font-bold text-slate-700 dark:text-slate-200 uppercase text-left">Histórico de Faturas</CardTitle>
          </CardHeader>
          <CardContent className="p-0 text-left">
            <div className="overflow-x-auto text-left">
                <table className="w-full text-sm text-left">
                  <thead className="text-slate-500 dark:text-slate-400 bg-slate-50/50 dark:bg-slate-800/50 text-left">
                    <tr className="text-left">
                      <th className="p-4 font-semibold uppercase text-[10px] text-left">Mês Ref.</th>
                      <th className="p-4 font-semibold uppercase text-[10px] text-center">Vencimento</th>
                      <th className="p-4 font-semibold uppercase text-[10px] text-center">Valor P2P</th>
                      <th className="p-4 font-semibold uppercase text-[10px] text-center">Status</th>
                      <th className="p-4 font-semibold uppercase text-[10px] text-center">Ações</th>
                    </tr>
                  </thead>
                  <tbody className="divide-y divide-slate-50 dark:divide-slate-800 text-left">
                    {faturasReais?.map((f) => {
                      const cob = Array.isArray(f.cobrancas) ? f.cobrancas[0] : f.cobrancas;
                      const eco = getEconomia(f); // --- USANDO A FUNÇÃO SEGURA ---
                      const statusPg = cob?.status_pagamento || 'pendente';
                      return (
                        <tr key={f.id} className="hover:bg-slate-50 dark:hover:bg-slate-800/50 transition-colors text-left">
                          <td className="p-4 font-bold text-slate-700 dark:text-slate-300 text-left">{f.mes_referencia}</td>
                          <td className="p-4 text-slate-500 dark:text-slate-400 text-center uppercase text-xs">
                            {f.data_vencimento ? new Date(f.data_vencimento + "T12:00:00").toLocaleDateString('pt-BR', {day: '2-digit', month: '2-digit'}) : '---'}
                          </td>
                          <td className="p-4 font-extrabold text-blue-700 dark:text-blue-400 text-center text-xs">
                            R$ {eco?.nova_fatura_p2p?.toLocaleString('pt-BR', { minimumFractionDigits: 2 }) || '0,00'}
                          </td>
                          <td className="p-4 text-center">
                            <Badge variant="outline" className={`text-[10px] font-bold uppercase ${statusPg === 'pago' ? "text-green-600 bg-green-50 dark:bg-green-900/20 border-green-200 dark:border-green-900" : "text-orange-600 bg-orange-50 dark:bg-orange-900/20 border-orange-200 dark:border-orange-900"}`}>
                              {statusPg === 'pago' ? 'Pago' : 'Pendente'}
                            </Badge>
                          </td>
                          <td className="p-4 text-center">
                            <Button size="sm" variant="ghost" className="text-blue-600 dark:text-blue-400 h-8 w-8 p-0" onClick={() => abrirFaturaP2P(f.id)}>
                              <Download className="h-4 w-4" />
                            </Button>
                          </td>
                        </tr>
                      );
                    })}
                  </tbody>
                </table>
            </div>
          </CardContent>
        </Card>
      </div>
    </div>
  )
}