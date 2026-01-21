'use client'

import { useState } from 'react'
import { supabase } from '@/lib/supabase'
import { Dialog, DialogContent, DialogHeader, DialogTitle, DialogTrigger } from "@/components/ui/dialog"
import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { PlusCircle } from 'lucide-react'
import { toast } from "sonner"

export function AdicionarFaturaModal({ onSucesso }: { onSucesso: () => void }) {
  const [open, setOpen] = useState(false)
  const [loading, setLoading] = useState(false)

  async function handleSubmit(e: React.FormEvent<HTMLFormElement>) {
    e.preventDefault()
    setLoading(true)
    const formData = new FormData(e.currentTarget)
    
    const dados = {
      codigo_cliente: formData.get('codigo_cliente'),
      mes_referencia: formData.get('mes_referencia'),
      consumo_kwh: Number(formData.get('consumo_kwh')),
      ft_enel_com_gd: Number(formData.get('valor_total')),
      data_vencimento: formData.get('vencimento'),
      status_processamento: 'concluido', // Já entra como concluído pois é manual
    }

    const { error } = await supabase.from('faturas').insert(dados)

    if (error) {
      toast.error("Erro ao salvar fatura: " + error.message)
    } else {
      toast.success("Fatura adicionada manualmente!")
      setOpen(false)
      onSucesso()
    }
    setLoading(false)
  }

  return (
    <Dialog open={open} onOpenChange={setOpen}>
      <DialogTrigger asChild>
        <Button className="bg-blue-600 hover:bg-blue-700">
          <PlusCircle className="w-4 h-4 mr-2" /> Adicionar Fatura
        </Button>
      </DialogTrigger>
      <DialogContent className="max-w-md">
        <DialogHeader>
          <DialogTitle>Cadastrar Fatura Manual</DialogTitle>
        </DialogHeader>
        <form onSubmit={handleSubmit} className="space-y-4">
          <div className="grid grid-cols-2 gap-4">
            <div className="space-y-2">
              <Label>Código do Cliente</Label>
              <Input name="codigo_cliente" placeholder="Ex: 64755218" required />
            </div>
            <div className="space-y-2">
              <Label>Mês Ref. (MM/AAAA)</Label>
              <Input name="mes_referencia" placeholder="11/2025" required />
            </div>
          </div>
          <div className="grid grid-cols-2 gap-4">
            <div className="space-y-2">
              <Label>Consumo (kWh)</Label>
              <Input name="consumo_kwh" type="number" required />
            </div>
            <div className="space-y-2">
              <Label>Valor Total (R$)</Label>
              <Input name="valor_total" type="number" step="0.01" required />
            </div>
          </div>
          <div className="space-y-2">
            <Label>Data de Vencimento</Label>
            <Input name="vencimento" type="date" required />
          </div>
          <Button type="submit" className="w-full" disabled={loading}>
            {loading ? "Salvando..." : "Salvar Fatura"}
          </Button>
        </form>
      </DialogContent>
    </Dialog>
  )
}