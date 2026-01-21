'use client'

import { useEffect, useState } from 'react'
import { useParams, useRouter } from 'next/navigation'
import { supabase } from '@/lib/supabase'
import { Card, CardHeader, CardTitle, CardContent } from "@/components/ui/card"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Button } from "@/components/ui/button"
import { toast, Toaster } from "sonner"

export default function EditarCliente() {
  const params = useParams()
  const router = useRouter()
  const [loading, setLoading] = useState(true)
  const [saving, setSaving] = useState(false)
  const [cliente, setCliente] = useState<any>(null)

  useEffect(() => {
    async function loadCliente() {
      const { data, error } = await supabase
        .from('clientes')
        .select('*')
        .eq('id', params.id)
        .single()

      if (error) {
        toast.error('Erro ao carregar cliente')
        router.push('/admin/clientes')
      } else {
        setCliente(data)
      }
      setLoading(false)
    }
    loadCliente()
  }, [params.id, router])

  async function handleSubmit(e: React.FormEvent<HTMLFormElement>) {
    e.preventDefault()
    setSaving(true)
    
    const form = e.currentTarget
    const formData = new FormData(form)
    
    // Organizando o objeto JSONB idêntico ao cadastro
    const endereco_jsonb = {
      rua: formData.get('rua'),
      numero: formData.get('numero'),
      complemento: formData.get('complemento'),
      bairro: formData.get('bairro'),
      cidade: formData.get('cidade'),
      CEP: formData.get('CEP')
    }

    const { error } = await supabase
      .from('clientes')
      .update({
        nome_completo: formData.get('nome'),
        cpf_cnpj: formData.get('cpf'),
        data_nascimento: formData.get('data_nascimento'),
        email: formData.get('email'),
        fone: formData.get('fone'),
        codigo_cliente: formData.get('codigo_cliente'),
        numero_medidor: formData.get('medidor'),
        unidade_consumidora: formData.get('uc'),
        desconto_percentual: Number(formData.get('desconto')),
        nr_contrato: formData.get('contrato'),
        endereco_jsonb: endereco_jsonb
      })
      .eq('id', params.id)

    if (error) {
      toast.error('Erro ao atualizar: ' + error.message)
    } else {
      toast.success('Cliente atualizado com sucesso!')
      router.push('/admin/clientes')
    }
    setSaving(false)
  }

  if (loading) return <div className="p-10 text-center italic text-slate-400 animate-pulse">Carregando dados do cliente...</div>

  return (
    <div className="container py-10">
      <Toaster richColors position="top-right" />
      <Card className="max-w-4xl mx-auto shadow-lg text-left">
        <CardHeader className="bg-slate-50 border-b mb-6">
          <CardTitle className="text-2xl font-bold text-slate-800">Editar Cliente</CardTitle>
        </CardHeader>
        <CardContent>
          <form onSubmit={handleSubmit} className="space-y-8 text-left">
            
            {/* SEÇÃO 1: DADOS PESSOAIS */}
            <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
              <div className="space-y-2 md:col-span-2">
                <Label htmlFor="nome">Nome Completo / Razão Social</Label>
                <Input id="nome" name="nome" defaultValue={cliente?.nome_completo} required />
              </div>
              
              <div className="space-y-2">
                <Label htmlFor="cpf">CPF / CNPJ</Label>
                <Input id="cpf" name="cpf" defaultValue={cliente?.cpf_cnpj} required />
              </div>

              <div className="space-y-2">
                <Label htmlFor="data_nascimento">Data de Nascimento</Label>
                <Input id="data_nascimento" name="data_nascimento" type="date" defaultValue={cliente?.data_nascimento} required />
              </div>

              <div className="space-y-2">
                <Label htmlFor="fone">Telefone / WhatsApp</Label>
                <Input id="fone" name="fone" defaultValue={cliente?.fone} placeholder="(00) 00000-0000" />
              </div>

              <div className="space-y-2">
                <Label htmlFor="email">E-mail</Label>
                <Input id="email" name="email" type="email" defaultValue={cliente?.email} required />
              </div>

              <div className="space-y-2">
                <Label htmlFor="contrato">Nº do Contrato P2P</Label>
                <Input id="contrato" name="contrato" defaultValue={cliente?.nr_contrato} />
              </div>
            </div>

            {/* SEÇÃO 2: DADOS TÉCNICOS (ENEL) */}
            <div className="bg-blue-50/50 p-6 rounded-lg border border-blue-100">
              <h3 className="text-blue-800 font-semibold mb-4 flex items-center gap-2 uppercase text-xs tracking-wider">
                Informações da Concessionária
              </h3>
              <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
                <div className="space-y-2">
                  <Label htmlFor="codigo_cliente">Código do Cliente</Label>
                  <Input id="codigo_cliente" name="codigo_cliente" defaultValue={cliente?.codigo_cliente} className="bg-white font-mono" required />
                </div>
                <div className="space-y-2">
                  <Label htmlFor="medidor">Nº do Medidor</Label>
                  <Input id="medidor" name="medidor" defaultValue={cliente?.numero_medidor} className="bg-white font-mono" required />
                </div>
                <div className="space-y-2">
                  <Label htmlFor="uc">Unidade Consumidora (UC)</Label>
                  <Input id="uc" name="uc" defaultValue={cliente?.unidade_consumidora} className="bg-white font-mono" />
                </div>
                <div className="space-y-2 md:col-span-3">
                  <Label htmlFor="desconto" className="text-blue-900 font-bold">
                    Desconto Aplicado (%)
                  </Label>
                  <Input 
                    id="desconto" 
                    name="desconto" 
                    type="number" 
                    step="0.01" 
                    defaultValue={cliente?.desconto_percentual ? (cliente.desconto_percentual * 100).toFixed(2) : ""}
                    className="bg-white border-blue-300 focus:ring-blue-500 font-bold text-lg"
                    required 
                  />
                </div>
              </div>
            </div>

            {/* SEÇÃO 3: ENDEREÇO */}
            <div className="space-y-4">
              <h3 className="font-medium text-slate-500 border-b pb-2 uppercase text-xs tracking-wider">Endereço de Instalação</h3>
              <div className="grid grid-cols-1 md:grid-cols-6 gap-4">
                
                <div className="md:col-span-2 space-y-2">
                  <Label htmlFor="CEP">CEP</Label>
                  <Input id="CEP" name="CEP" defaultValue={cliente?.endereco_jsonb?.CEP} placeholder="00000-000" required />
                </div>

                <div className="md:col-span-4 space-y-2">
                  <Label htmlFor="rua">Logradouro (Rua/Av)</Label>
                  <Input id="rua" name="rua" defaultValue={cliente?.endereco_jsonb?.rua} required />
                </div>

                <div className="md:col-span-1 space-y-2">
                  <Label htmlFor="numero">Número</Label>
                  <Input id="numero" name="numero" defaultValue={cliente?.endereco_jsonb?.numero} required />
                </div>

                <div className="md:col-span-2 space-y-2">
                  <Label htmlFor="complemento">Complemento</Label>
                  <Input id="complemento" name="complemento" defaultValue={cliente?.endereco_jsonb?.complemento} />
                </div>

                <div className="md:col-span-3 space-y-2">
                  <Label htmlFor="bairro">Bairro</Label>
                  <Input id="bairro" name="bairro" defaultValue={cliente?.endereco_jsonb?.bairro} required />
                </div>

                <div className="md:col-span-6 space-y-2">
                  <Label htmlFor="cidade">Cidade</Label>
                  <Input id="cidade" name="cidade" defaultValue={cliente?.endereco_jsonb?.cidade} required />
                </div>
              </div>
            </div>

            {/* BOTÕES ALINHADOS PERFEITAMENTE */}
            <div className="flex flex-col md:flex-row gap-4 pt-6 border-t mt-8">
              <Button 
                type="button" 
                variant="outline" 
                className="w-full md:flex-1 py-6 text-slate-600 font-semibold" 
                onClick={() => router.back()}
              >
                Cancelar
              </Button>
              
              <Button 
                type="submit" 
                className="w-full md:flex-1 bg-blue-600 hover:bg-blue-700 text-white py-6 text-lg font-bold shadow-md transition-all active:scale-[0.98]" 
                disabled={saving}
              >
                {saving ? "Salvando Alterações..." : "Salvar Alterações"}
              </Button>
            </div>
          </form>
        </CardContent>
      </Card>
    </div>
  )
}