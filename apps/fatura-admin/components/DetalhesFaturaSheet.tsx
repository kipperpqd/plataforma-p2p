'use client'

import { useState, useEffect } from 'react'
import { supabase } from '@/lib/supabase'
import {
  Sheet, SheetContent, SheetHeader, SheetTitle, SheetDescription, SheetFooter
} from "@/components/ui/sheet"
import { Badge } from "@/components/ui/badge"
import { ScrollArea } from "@/components/ui/scroll-area"
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from "@/components/ui/table"
import { Separator } from "@/components/ui/separator"
import { Input } from "@/components/ui/input"
import { Button } from "@/components/ui/button"
import { FileText, Zap, Edit2, X, Check, BarChart3, History, Wallet, Percent, RefreshCw } from 'lucide-react'
import { toast } from "sonner"
import { QRCodeSVG } from 'qrcode.react'

export function DetalhesFaturaSheet({ faturaId, open, onOpenChange }: { 
  faturaId: string | null, 
  open: boolean, 
  onOpenChange: (open: boolean) => void 
}) {
  const [dados, setDados] = useState<any>(null)
  const [loading, setLoading] = useState(false)
  const [isEditing, setIsEditing] = useState(false)
  const [editForm, setEditForm] = useState<any>({})
  const [canRecalculate, setCanRecalculate] = useState(false)

  const getEconomia = (data: any) => {
    if (!data?.economia_gerada) return null;
    return Array.isArray(data.economia_gerada) ? data.economia_gerada[0] : data.economia_gerada;
  };

  const formatarLinhaDigitavel = (linha: string) => {
    if (!linha) return "";
    const clean = linha.replace(/\D/g, '');
    if (clean.length !== 47) return clean;
    return `${clean.substring(0, 5)}.${clean.substring(5, 10)} ${clean.substring(10, 15)}.${clean.substring(15, 21)} ${clean.substring(21, 26)}.${clean.substring(26, 32)} ${clean.substring(32, 33)} ${clean.substring(33)}`;
  };

  useEffect(() => {
    if (open && faturaId) {
      fetchDetalhes()
    } else {
      setIsEditing(false)
      setCanRecalculate(false)
    }
  }, [open, faturaId])

  async function fetchDetalhes() {
    setLoading(true)
    const { data, error } = await supabase
      .from('faturas')
      .select(`
        *, 
        economia_gerada (*), 
        clientes (*), 
        itens_faturados (*), 
        cobrancas!fatura_id (*)
      `)
      .eq('id', faturaId)
      .single()
    
    if (error) {
      console.error("Erro ao buscar detalhes:", error);
    } else {
      setDados(data)
      const economia = getEconomia(data);
      setEditForm({
        consumo_kwh: data.consumo_kwh,
        bandeira_tarifaria: data.bandeira_tarifaria,
        ft_enel_sem_gd: economia?.ft_enel_sem_gd || 0,
        ft_enel_com_gd: data.ft_enel_com_gd || 0,
        economia_reais: economia?.economia_reais || 0,
        total_itens_compensados: economia?.total_itens_compensados || 0,
        saldo_utilizado_mes: data.saldo_utilizado_mes || 0,
        saldo_total_atualizado: data.saldo_total_atualizado || 0,
        media_consumo: data.media_consumo || 0,
        linha_digitavel_enel: data.linha_digitavel_enel || "",
        tributos: data.tributos || 0,
        desconto_percentual: data.clientes?.desconto_percentual || 0
      })
    }
    setLoading(false)
  }

  const handleSave = async () => {
    try {
      // 1. Atualiza Fatura
      await supabase.from('faturas').update({
        consumo_kwh: Number(editForm.consumo_kwh),
        bandeira_tarifaria: editForm.bandeira_tarifaria,
        ft_enel_com_gd: Number(editForm.ft_enel_com_gd),
        saldo_utilizado_mes: Number(editForm.saldo_utilizado_mes),
        saldo_total_atualizado: Number(editForm.saldo_total_atualizado),
        media_consumo: Number(editForm.media_consumo),
        linha_digitavel_enel: editForm.linha_digitavel_enel,
        tributos: Number(editForm.tributos)
      }).eq('id', faturaId)

      // 2. Atualiza Economia Gerada (Valores base)
      await supabase.from('economia_gerada').update({
        ft_enel_sem_gd: Number(editForm.ft_enel_sem_gd),
        total_itens_compensados: Number(editForm.total_itens_compensados),
      }).eq('fatura_id', faturaId)

      // 3. Atualiza Desconto no Cliente (Caso tenha mudado o contrato)
      if (dados.clientes?.id) {
        await supabase.from('clientes').update({
          desconto_percentual: Number(editForm.desconto_percentual)
        }).eq('id', dados.clientes.id)
      }

      setIsEditing(false)
      await fetchDetalhes()
      setCanRecalculate(true) // Ativa o botão de recálculo
      toast.success("Dados salvos! Clique em Recalcular para atualizar os valores finais.")
    } catch (error) {
      toast.error("Erro ao salvar alterações.")
    }
  }

  const handleRecalculate = async () => {
    const t = toast.loading("Recalculando economia e P2P...");
    try {
      const response = await fetch(`https://uncalibrated-interhemal-cheree.ngrok-free.dev/recalcular/${faturaId}`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'ngrok-skip-browser-warning': 'true' // Vital para ngrok
        }
      });

      if (!response.ok) {
        const errorData = await response.json();
        throw new Error(errorData.detail || "Erro no servidor de cálculo");
      }

      await fetchDetalhes();
      setCanRecalculate(false);
      toast.success("Valores financeiros atualizados!", { id: t });
    } catch (error) {
      console.error("Erro no Recalculo:", error);
      // IMPORTANTE: Isso para o loop limpando o toast anterior
      toast.error(`Falha: ${error.message}`, { id: t }); 
    }
  };

  if (!dados) return null
  const economia = getEconomia(dados);
  const cobranca = Array.isArray(dados.cobrancas) ? dados.cobrancas[0] : dados.cobrancas;

  return (
    <Sheet open={open} onOpenChange={onOpenChange}>
      <SheetContent className="sm:max-w-[600px] w-full border-l shadow-2xl">
        <SheetHeader className="space-y-1">
          <div className="flex justify-between items-start">
            <SheetTitle className="flex items-center gap-2">
              <FileText className="h-5 w-5 text-blue-600" />
              Fatura {dados.mes_referencia}
            </SheetTitle>
            <Button variant={isEditing ? "ghost" : "outline"} size="sm" onClick={() => setIsEditing(!isEditing)}>
              {isEditing ? <X className="h-4 w-4 mr-2" /> : <Edit2 className="h-4 w-4 mr-2" />}
              {isEditing ? "Cancelar" : "Editar"}
            </Button>
          </div>
          <SheetDescription>
            Cód. Cliente: {dados.codigo_cliente} | Nome: {dados.clientes?.nome_completo}
          </SheetDescription>
        </SheetHeader>

        <ScrollArea className="h-[calc(100vh-180px)] mt-6 pr-4 text-left">
          <div className="space-y-6">
            
            {/* BOTÃO RECALCULAR (CONDICIONAL) */}
            {canRecalculate && (
              <Button 
                onClick={handleRecalculate}
                className="w-full bg-amber-500 hover:bg-amber-600 text-white font-bold gap-2 animate-pulse shadow-lg"
              >
                <RefreshCw className="h-4 w-4" />
                Recalcular Valores Financeiros
              </Button>
            )}

            <div className="grid grid-cols-2 gap-4">
              <div className="p-4 rounded-lg bg-green-50 border border-green-100">
                <div className="flex justify-between items-start mb-1">
                  <p className="text-[13px] text-green-700 font-bold uppercase">Economia (R$)</p>
                  <div className="flex flex-col items-end">
                    <span className="text-[10px] text-green-600 font-bold">DESCONTO</span>
                    {isEditing ? (
                      <div className="flex items-center gap-1">
                        <Input 
                          type="number" 
                          value={editForm.desconto_percentual} 
                          onChange={e => setEditForm({...editForm, desconto_percentual: e.target.value})} 
                          className="bg-white h-6 w-12 text-[10px] p-1"
                        />
                        <span className="text-[10px] font-bold">%</span>
                      </div>
                    ) : (
                      <span className="text-xs font-black text-green-700">{dados.clientes?.desconto_percentual}%</span>
                    )}
                  </div>
                </div>
                <p className="text-xl font-bold text-green-900">R$ {economia?.economia_reais?.toFixed(2) || "0.00"}</p>
                <Badge className="mt-2 bg-green-600 text-[9px] h-4 tracking-tighter">{economia?.economia_percentual || 0}% OFF REAL</Badge>
              </div>

              <div className="p-4 rounded-lg bg-blue-50 border border-blue-100">
                <p className="text-[13px] text-blue-700 font-bold uppercase mb-1">Consumo (kWh)</p>
                {isEditing ? (
                  <Input type="number" value={editForm.consumo_kwh} onChange={e => setEditForm({...editForm, consumo_kwh: e.target.value})} className="bg-white h-8 text-sm" />
                ) : (
                  <p className="text-xl font-bold text-blue-900">{dados.consumo_kwh} <span className="text-xs">kWh</span></p>
                )}
                <p className="text-[10px] text-blue-600 mt-2 font-bold uppercase tracking-tighter">Bandeira: {dados.bandeira_tarifaria}</p>
              </div>
            </div>

            <div className="grid grid-cols-3 gap-3">
              <div className="px-3 py-3 rounded-md border bg-gray-50 flex flex-col justify-center gap-1">
                <span className="text-[12px] font-bold text-gray-400 uppercase tracking-tighter leading-none">Sem GD</span>
                {isEditing ? (
                  <Input type="number" value={editForm.ft_enel_sem_gd} onChange={e => setEditForm({...editForm, ft_enel_sem_gd: e.target.value})} className="bg-white h-7 text-xs" />
                ) : (
                  <span className="font-bold text-gray-900 text-sm leading-none">R$ {economia?.ft_enel_sem_gd?.toFixed(2) || "0.00"}</span>
                )}
              </div>
              <div className="px-3 py-3 rounded-md border bg-gray-50 flex flex-col justify-center gap-1">
                <span className="text-[12px] font-bold text-gray-400 uppercase tracking-tighter leading-none">Com GD</span>
                {isEditing ? (
                  <Input type="number" value={editForm.ft_enel_com_gd} onChange={e => setEditForm({...editForm, ft_enel_com_gd: e.target.value})} className="bg-white h-7 text-xs" />
                ) : (
                  <span className="font-bold text-gray-900 text-sm leading-none">R$ {dados.ft_enel_com_gd?.toFixed(2) || "0.00"}</span>
                )}
              </div>
              <div className="px-3 py-3 rounded-md border bg-gray-50 flex flex-col justify-center gap-1">
                <span className="text-[12px] font-bold text-gray-400 uppercase tracking-tighter leading-none">Compensado</span>
                {isEditing ? (
                  <Input type="number" value={editForm.total_itens_compensados} onChange={e => setEditForm({...editForm, total_itens_compensados: e.target.value})} className="bg-white h-7 text-xs" />
                ) : (
                  <span className="font-bold text-green-700 text-sm leading-none">R$ {economia?.total_itens_compensados?.toFixed(2) || "0.00"}</span>
                )}
              </div>
            </div>

            <div className="grid grid-cols-4 gap-2">
              <div className="px-2 py-3 rounded-md border bg-slate-50 flex flex-col items-center text-center gap-1">
                <History className="h-3 w-3 text-slate-400" />
                <span className="text-[10px] font-bold text-slate-500 uppercase leading-none">Utilizado</span>
                <span className="font-bold text-slate-700 text-[12px]">{dados.saldo_utilizado_mes || 0} kWh</span>
              </div>
              <div className="px-2 py-3 rounded-md border bg-slate-50 flex flex-col items-center text-center gap-1">
                <Wallet className="h-3 w-3 text-slate-400" />
                <span className="text-[10px] font-bold text-slate-500 uppercase leading-none">Saldo Tot.</span>
                <span className="font-bold text-slate-700 text-[12px]">{dados.saldo_total_atualizado || 0} kWh</span>
              </div>
              <div className="px-2 py-3 rounded-md border bg-slate-50 flex flex-col items-center text-center gap-1">
                <BarChart3 className="h-3 w-3 text-slate-400" />
                <span className="text-[10px] font-bold text-slate-500 uppercase leading-none">Média Cons.</span>
                <span className="font-bold text-slate-700 text-[12px]">{dados.media_consumo || 0} kWh</span>
              </div>
              <div className="px-2 py-3 rounded-md border bg-indigo-50 border-indigo-100 flex flex-col items-center text-center gap-1">
                <Zap className="h-3 w-3 text-indigo-400" />
                <span className="text-[10px] font-bold text-indigo-500 uppercase leading-none">Reserva</span>
                <span className="font-bold text-indigo-700 text-[12px]">{dados.reserva_creditos || 0} m</span>
              </div>
            </div>

            <Separator />

            {/* TABELA DE ITENS */}
            <div>
              <h4 className="text-sm font-semibold mb-3 flex items-center gap-2">
                <Check className="h-4 w-4 text-green-500" /> Itens Auditados pelo Robô
              </h4>
              <div className="rounded-md border overflow-hidden">
                <Table>
                  <TableHeader className="bg-gray-50">
                    <TableRow>
                      <TableHead className="text-[10px] uppercase font-bold py-2">Descrição</TableHead>
                      <TableHead className="text-[10px] uppercase font-bold text-right py-2">Valor</TableHead>
                    </TableRow>
                  </TableHeader>
                  <TableBody>
                    {dados.itens_faturados?.map((item: any) => (
                      <TableRow key={item.id} className="hover:bg-transparent">
                        <TableCell className="text-[11px] py-1.5 leading-tight">{item.descricao}</TableCell>
                        <TableCell className={`text-[11px] text-right py-1.5 font-mono font-bold ${item.valor < 0 ? 'text-green-600' : 'text-gray-700'}`}>
                          R$ {item.valor.toFixed(2)}
                        </TableCell>
                      </TableRow>
                    ))}
                  </TableBody>
                </Table>
              </div>
            </div>

            {/* CARD COBRANÇA P2P */}
            {cobranca && (
              <div className="p-4 rounded-xl border-2 border-indigo-100 bg-indigo-50/30 space-y-4">
                <div className="flex items-center justify-between">
                    <h4 className="text-sm font-bold text-indigo-900 flex items-center gap-2 uppercase tracking-tighter">
                      <Wallet className="h-4 w-4" /> Cobrança Digital P2P
                    </h4>
                    <Badge variant="outline" className={cobranca.status_pagamento === 'pago' ? "bg-green-50 text-green-700 border-green-200" : "bg-white text-indigo-700 border-indigo-200"}>
                      {cobranca.status_pagamento || 'pendente'}
                    </Badge>
                </div>
                <div className="flex gap-4">
                    <div className="flex-1 space-y-3">
                      <div className="space-y-1">
                        <p className="text-[9px] font-bold text-slate-400 uppercase">Linha Digitável Asaas</p>
                        <div className="bg-white p-3 rounded border border-indigo-100 font-mono text-[11px] text-indigo-900 break-all leading-tight select-all">
                          {formatarLinhaDigitavel(cobranca.linha_digitavel_p2p) || "Aguardando geração..."}
                        </div>
                      </div>
                      <div className="flex gap-4 text-[11px]">
                        <div>
                          <span className="text-slate-400 uppercase font-bold text-[9px]">Vencimento:</span>
                          <p className="font-bold text-slate-700">{cobranca.data_vencimento ? new Date(cobranca.data_vencimento + "T12:00:00").toLocaleDateString('pt-BR') : '---'}</p>
                        </div>
                        <div>
                          <span className="text-slate-400 uppercase font-bold text-[9px]">Valor P2P:</span>
                          <p className="font-bold text-indigo-700">R$ {economia?.nova_fatura_p2p?.toFixed(2) || "0.00"}</p>
                        </div>
                      </div>
                    </div>
                    <div className="bg-white p-2 rounded-lg border border-indigo-100 flex flex-col items-center justify-center shrink-0 shadow-sm">
                      {cobranca.payload_pix ? (
                        <>
                          <QRCodeSVG value={cobranca.payload_pix} size={85} />
                          <span className="text-[8px] font-bold text-slate-400 mt-1 uppercase">Pix Copia e Cola</span>
                        </>
                      ) : (
                        <div className="w-[85px] h-[85px] bg-slate-50 flex items-center justify-center text-[8px] text-slate-300 text-center px-1 italic">PIX INDISPONÍVEL</div>
                      )}
                    </div>
                </div>
              </div>
            )}

            <div className="p-3 bg-red-50 rounded-lg border border-red-100 flex items-center justify-between">
              <div className="flex items-center gap-2">
                <Percent className="h-4 w-4 text-red-500" />
                <span className="text-[12px] font-bold text-red-700 uppercase">Tributos Totais</span>
              </div>
              <p className="text-base font-black text-red-700">R$ {dados.tributos?.toFixed(2) || "0.00"}</p>
            </div>

            <div className="pt-2">
              <Button variant="secondary" className="w-full gap-2 text-xs h-9" asChild>
                <a href={dados.link_pdf_original} target="_blank" rel="noreferrer">
                  <FileText className="h-4 w-4" /> Abrir PDF Original
                </a>
              </Button>
            </div>
          </div>
        </ScrollArea>

        {isEditing && (
          <SheetFooter className="absolute bottom-0 left-0 w-full p-6 bg-white border-t">
            <Button className="w-full bg-blue-600 hover:bg-blue-700 gap-2 font-bold" onClick={handleSave}>
              <Check className="h-4 w-4" /> Salvar Alterações
            </Button>
          </SheetFooter>
        )}
      </SheetContent>
    </Sheet>
  )
}