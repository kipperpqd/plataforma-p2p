'use client'

import { useEffect, useState, useCallback } from 'react'
import { supabase } from '@/lib/supabase'
import { DetalhesFaturaSheet } from "@/components/DetalhesFaturaSheet" 
import { AdicionarFaturaModal } from "@/components/AdicionarFaturaModal"
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from "@/components/ui/table"
import { Card, CardHeader, CardContent } from "@/components/ui/card"
import { Badge } from "@/components/ui/badge"
import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { Eye, Zap, Download, Search, AlertTriangle, Clock, CheckCircle2, FileText, RefreshCw } from 'lucide-react'
import { toast, Toaster } from "sonner" 

export default function ListagemFaturasPage() {
  const [faturas, setFaturas] = useState<any[]>([])
  const [loading, setLoading] = useState(true)
  const [filtro, setFiltro] = useState('')
  const [faturaSelecionada, setFaturaSelecionada] = useState<string | null>(null)
  const [sheetOpen, setSheetOpen] = useState(false)

  // Função Auxiliar para extrair economia com segurança (1:1 ou 1:N)
  const getDadosEconomia = (f: any) => {
    if (!f.economia_gerada) return null;
    return Array.isArray(f.economia_gerada) ? f.economia_gerada[0] : f.economia_gerada;
  };

  const fetchFaturas = useCallback(async (isSilent = false) => {
    if (!isSilent) setLoading(true);
    try {
      const { data, error } = await supabase.from('faturas')
        .select(`
          *, 
          clientes (nome_completo, cpf_cnpj), 
          cobrancas!fatura_id (*), 
          economia_gerada (*)
        `)
        .order('created_at', { ascending: false });

      if (error) {
        console.error("Erro do Supabase:", error);
        throw error;
      }
      setFaturas(data || []);
    } catch (error: any) {
      console.error("Erro na busca:", error);
      
      // Mensagens de erro mais específicas
      let mensagemErro = "Erro ao carregar faturas.";
      if (error?.message?.includes('NetworkError') || error?.message?.includes('fetch')) {
        mensagemErro = "Erro de conexão com o Supabase. Verifique sua conexão e as variáveis de ambiente.";
      } else if (error?.message?.includes('environment')) {
        mensagemErro = error.message;
      } else if (error?.message) {
        mensagemErro = `Erro: ${error.message}`;
      }
      
      toast.error(mensagemErro);
    } finally {
      setLoading(false);
    }
  }, []);

  useEffect(() => {
    fetchFaturas();
    const canal = supabase.channel('changes-faturas')
      .on('postgres_changes', 
        { event: '*', schema: 'public', table: 'faturas' }, 
        () => fetchFaturas(true)
      )
      .subscribe();
    return () => { supabase.removeChannel(canal); };
  }, [fetchFaturas]);

  async function handleCheckPagamento(idExterno: string) {
    const t = toast.loading("Sincronizando status...");
    try {
      const res = await fetch(`/api/asaas/gerar-boleto?id_externo=${idExterno}`);
      const data = await res.json();
      toast.success(`Status: ${data.status?.toUpperCase()}`, { id: t });
      fetchFaturas(true); 
    } catch (err) {
      toast.error("Erro ao sincronizar", { id: t });
    }
  }

  async function handleGerarBoleto(fatura: any) {
    const economia = getDadosEconomia(fatura);
    const valorCobrar = economia?.nova_fatura_p2p;

    if (!valorCobrar || valorCobrar <= 0) {
      return toast.error("Valor P2P inválido ou não calculado pelo robô.");
    }

    const loadingToast = toast.loading("Gerando cobrança no Asaas...");
    try {
      const response = await fetch('/api/asaas/gerar-boleto', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          cliente_nome: fatura.clientes?.nome_completo,
          cliente_cpfCnpj: fatura.clientes?.cpf_cnpj,
          valor: valorCobrar,
          vencimento: fatura.data_vencimento,
          fatura_id: fatura.id
        })
      });

      const data = await response.json();

      if (response.ok && data.payment?.id) {
        const { error: upsertError } = await supabase.from('cobrancas').upsert({
          fatura_id: fatura.id,
          valor_p2p: valorCobrar,
          data_vencimento: fatura.data_vencimento,
          linha_digitavel_p2p: data.linhaDigitavel,
          link_boleto_pdf: data.payment.bankSlipUrl,
          id_externo_asaas: data.payment.id,
          qr_code_pix: data.pix?.encodedImage, 
          payload_pix: data.pix?.payload,
          status_pagamento: 'pendente'
        }, { onConflict: 'fatura_id' });

        if (upsertError) throw upsertError;

        toast.success("Enviado e salvo com sucesso!", { id: loadingToast });
        fetchFaturas(true);
      } else {
        throw new Error(data.error || "Falha na API do Asaas");
      }
    } catch (err: any) {
      toast.error(err.message, { id: loadingToast });
    }
  }

  const faturasFiltradas = faturas.filter(f => {
    const termo = filtro.toLowerCase();
    const codigo = f.codigo_cliente?.toLowerCase() || '';
    const nome = f.clientes?.nome_completo?.toLowerCase() || '';
    const mesRef = f.mes_referencia?.toLowerCase() || '';
    return codigo.includes(termo) || nome.includes(termo) || mesRef.includes(termo) || mesRef.replace('/', '').includes(termo);
  });

  return (
    <div className="p-8 space-y-6 bg-slate-50/30 min-h-screen text-left">
      <Toaster richColors position="top-right" />
      
      <div className="flex justify-between items-center">
        <div>
          <h1 className="text-3xl font-bold tracking-tight text-slate-900 text-left">Gestão de Faturas</h1>
          <p className="text-slate-500 text-sm">Controle operacional e financeiro.</p>
        </div>
        <div className="flex gap-2">
          <Button onClick={() => fetchFaturas()} variant="outline" size="sm" className="bg-white" disabled={loading}>
            <RefreshCw className={`h-4 w-4 mr-2 ${loading ? 'animate-spin' : ''}`} />
            Atualizar
          </Button>
          <AdicionarFaturaModal onSucesso={fetchFaturas} />
        </div>
      </div>

      <Card className="shadow-sm border-slate-200">
        <CardHeader className="border-b bg-white/50 py-4">
          <div className="relative max-w-sm">
            <Search className="absolute left-2.5 top-2.5 h-4 w-4 text-muted-foreground" />
            <Input placeholder="Pesquisar cliente ou mês..." className="pl-8 bg-white" value={filtro} onChange={(e) => setFiltro(e.target.value)} />
          </div>
        </CardHeader>
        <CardContent className="p-0">
          <Table>
            <TableHeader>
              <TableRow className="bg-slate-50/50">
                <TableHead>Status Robô</TableHead>
                <TableHead>Pagamento</TableHead>
                <TableHead>Cliente</TableHead>
                <TableHead>Mês Ref.</TableHead>
                <TableHead>Vencimento</TableHead>
                <TableHead>Consumo</TableHead>
                <TableHead>Valor P2P</TableHead>
                <TableHead className="text-right">Ações</TableHead>
              </TableRow>
            </TableHeader>
            <TableBody>
              {faturasFiltradas.map((f) => {
                const cobranca = Array.isArray(f.cobrancas) ? f.cobrancas[0] : f.cobrancas;
                const economia = getDadosEconomia(f);
                const statusPg = cobranca?.status_pagamento || 'pendente';
                
                return (
                  <TableRow key={f.id} className="hover:bg-slate-50/50 transition-colors">
                    <TableCell>{renderStatusProcessamento(f.status_processamento)}</TableCell>
                    <TableCell>
                      <div className="flex items-center gap-2">
                        <Badge 
                          variant="outline" 
                          className={statusPg === 'pago' 
                            ? "text-green-600 border-green-200 bg-green-50 font-bold" 
                            : "text-orange-600 border-orange-200 bg-orange-50 uppercase text-[10px]"
                          }
                        >
                          {statusPg}
                        </Badge>
                        {cobranca?.id_externo_asaas && statusPg !== 'pago' && (
                          <button onClick={() => handleCheckPagamento(cobranca.id_externo_asaas)} className="text-slate-400 hover:text-blue-600">
                            <RefreshCw className="h-3 w-3" />
                          </button>
                        )}
                      </div>
                    </TableCell>
                    <TableCell className="font-medium">
                      <div className="flex flex-col">
                        <span>{f.clientes?.nome_completo || '---'}</span>
                        <span className="text-[10px] text-slate-400">{f.codigo_cliente}</span>
                      </div>
                    </TableCell>
                    <TableCell>{f.mes_referencia}</TableCell>
                    <TableCell>
                      {f.data_vencimento ? new Date(f.data_vencimento + "T12:00:00").toLocaleDateString('pt-BR') : '---'}
                    </TableCell>
                    <TableCell>{f.consumo_kwh} kWh</TableCell>
                    <TableCell className="font-bold text-blue-700 text-nowrap">
                      R$ {economia?.nova_fatura_p2p?.toLocaleString('pt-BR', { minimumFractionDigits: 2 }) || '0,00'}
                    </TableCell>
                    <TableCell className="text-right">
                      <div className="flex items-center justify-end gap-2">
                        <Button size="icon" variant="ghost" className="h-8 w-8 text-emerald-600" title="Ver PDF Original" onClick={() => window.open(`/admin/faturas/gerar/${f.id}`, '_blank')}>
                          <FileText className="h-4 w-4" />
                        </Button>

                        {!cobranca?.id_externo_asaas ? (
                          <Button 
                            size="icon" 
                            variant="outline" 
                            className="h-8 w-8 text-blue-600 border-blue-200" 
                            disabled={f.status_processamento !== 'concluido'}
                            onClick={() => handleGerarBoleto(f)}
                          >
                            <Zap className="h-4 w-4" />
                          </Button>
                        ) : (
                          <div className="flex items-center gap-1">
                            <Badge variant="outline" className="h-6 text-[9px] text-green-600 bg-green-50 border-green-100 font-bold">ASAAS OK</Badge>
                            <Button size="icon" variant="ghost" className="h-8 w-8 text-slate-400 hover:text-blue-600" onClick={() => window.open(cobranca.link_boleto_pdf, '_blank')}>
                              <Download className="h-4 w-4" />
                            </Button>
                          </div>
                        )}

                        <Button variant="ghost" size="icon" className="h-8 w-8 text-slate-400" onClick={() => { setFaturaSelecionada(f.id); setSheetOpen(true); }}>
                          <Eye className="h-4 w-4" />
                        </Button>
                      </div>
                    </TableCell>
                  </TableRow>
                )
              })}
            </TableBody>
          </Table>
        </CardContent>
      </Card>
      
      <DetalhesFaturaSheet faturaId={faturaSelecionada} open={sheetOpen} onOpenChange={setSheetOpen} />
    </div>
  )
}

function renderStatusProcessamento(status: string) {
  switch (status) {
    case 'concluido': return <Badge className="bg-green-100 text-green-700 border-none"><CheckCircle2 className="w-3 h-3 mr-1"/> ROBÔ OK</Badge>
    case 'erro': return <Badge variant="destructive"><AlertTriangle className="w-3 h-3 mr-1"/> ERRO</Badge>
    default: return <Badge variant="secondary" className="bg-slate-100 text-slate-600 border-none"><Clock className="w-3 h-3 mr-1"/> FILA</Badge>
  }
}