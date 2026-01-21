'use client'

import { useState } from 'react'
import { supabase } from '@/lib/supabase'
import { Card, CardHeader, CardTitle, CardContent } from "@/components/ui/card"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Button } from "@/components/ui/button"
import { useRouter } from 'next/navigation'
import { toast, Toaster } from "sonner" // Adicionado para melhores alertas

export default function NovoCliente() {
  const [loading, setLoading] = useState(false)
  const router = useRouter()

  async function handleSubmit(e: React.FormEvent<HTMLFormElement>) {
    e.preventDefault()
    setLoading(true)
    
    const form = e.currentTarget
    const formData = new FormData(form)
    
    // Organizando o objeto JSONB (Adicionado 'complemento' e 'cep' aqui)
    const endereco_jsonb = {
      rua: formData.get('rua'),
      numero: formData.get('numero'),
      complemento: formData.get('complemento'), // Nova chave no JSONB
      bairro: formData.get('bairro'),
      cidade: formData.get('cidade'),
      cep: formData.get('cep')
    }

    const { error } = await supabase.from('clientes').insert([{
      nome_completo: formData.get('nome'),
      cpf_cnpj: formData.get('cpf'),
      data_nascimento: formData.get('data_nascimento'), // Novo campo na tabela
      email: formData.get('email'),
      fone: formData.get('fone'),
      codigo_cliente: formData.get('codigo_cliente'),
      numero_medidor: formData.get('medidor'),
      unidade_consumidora: formData.get('uc'),
      cep: formData.get('cep'), // Campo direto na tabela
      desconto_percentual: Number(formData.get('desconto')),
      nr_contrato: formData.get('contrato'),
      endereco_jsonb: endereco_jsonb
    }])

    if (error) {
      toast.error('Erro ao cadastrar: ' + error.message)
    } else {
      toast.success('Cliente cadastrado com sucesso!')
      router.push('/admin/clientes')
    }
    setLoading(false)
  }

  return (
    <div className="container py-10">
      <Toaster richColors position="top-right" />
      <Card className="max-w-4xl mx-auto shadow-lg text-left">
        <CardHeader className="bg-slate-50 border-b mb-6">
          <CardTitle className="text-2xl font-bold text-slate-800">Cadastro de Novo Cliente</CardTitle>
        </CardHeader>
        <CardContent>
          <form onSubmit={handleSubmit} className="space-y-8 text-left">
            
            {/* SEÇÃO 1: DADOS PESSOAIS */}
            <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
              <div className="space-y-2 md:col-span-2">
                <Label htmlFor="nome">Nome Completo / Razão Social</Label>
                <Input id="nome" name="nome" placeholder="Nome do titular da conta" required />
              </div>
              
              <div className="space-y-2">
                <Label htmlFor="cpf">CPF / CNPJ</Label>
                <Input id="cpf" name="cpf" placeholder="000.000.000-00" required />
              </div>

              {/* CAMPO NOVO: DATA DE NASCIMENTO */}
              <div className="space-y-2">
                <Label htmlFor="data_nascimento">Data de Nascimento</Label>
                <Input id="data_nascimento" name="data_nascimento" type="date" required />
              </div>

              <div className="space-y-2">
                <Label htmlFor="fone">Telefone / WhatsApp</Label>
                <Input id="fone" name="fone" placeholder="(00) 00000-0000" />
              </div>

              <div className="space-y-2">
                <Label htmlFor="email">E-mail</Label>
                <Input id="email" name="email" type="email" placeholder="cliente@email.com" required />
              </div>

              <div className="space-y-2">
                <Label htmlFor="contrato">Nº do Contrato P2P</Label>
                <Input id="contrato" name="contrato" placeholder="Ex: 2024-001" />
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
                  <Input id="codigo_cliente" name="codigo_cliente" className="bg-white font-mono" required />
                </div>
                <div className="space-y-2">
                  <Label htmlFor="medidor">Nº do Medidor</Label>
                  <Input id="medidor" name="medidor" className="bg-white font-mono" required />
                </div>
                <div className="space-y-2">
                  <Label htmlFor="uc">Unidade Consumidora (UC)</Label>
                  <Input id="uc" name="uc" className="bg-white font-mono" />
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
                    placeholder="Ex: 15" 
                    className="bg-white border-blue-300 focus:ring-blue-500 font-bold text-lg"
                    required 
                  />
                  <p className="text-xs text-blue-600 italic">Este valor será usado para calcular a economia gerada.</p>
                </div>
              </div>
            </div>

            {/* SEÇÃO 3: ENDEREÇO */}
            <div className="space-y-4">
              <h3 className="font-medium text-slate-500 border-b pb-2 uppercase text-xs tracking-wider">Endereço de Instalação</h3>
              <div className="grid grid-cols-1 md:grid-cols-6 gap-4">
                
                {/* CAMPO NOVO: CEP */}
                <div className="md:col-span-4 space-y-2">
                  <Label htmlFor="rua">Logradouro (Rua/Av)</Label>
                  <Input id="rua" name="rua" placeholder="Rua exemplo..." required />
                </div>

                <div className="md:col-span-2 space-y-2">
                  <Label htmlFor="numero">Número</Label>
                  <Input id="numero" name="numero" placeholder="123" required />
                </div>

                {/* CAMPO NOVO: COMPLEMENTO */}
                <div className="md:col-span-3 space-y-2">
                  <Label htmlFor="complemento">Complemento</Label>
                  <Input id="complemento" name="complemento" placeholder="Apto, Bloco, Fundos..." />
                </div>

                <div className="md:col-span-3 space-y-2">
                  <Label htmlFor="bairro">Bairro</Label>
                  <Input id="bairro" name="bairro" required />
                </div>
                
                <div className="md:col-span-2 space-y-2">
                  <Label htmlFor="cep">CEP</Label>
                  <Input id="cep" name="cep" placeholder="00000-000" required />
                </div>

                <div className="md:col-span-4 space-y-2">
                  <Label htmlFor="cidade">Cidade</Label>
                  <Input id="cidade" name="cidade" defaultValue="Fortaleza" required />
                </div>
              </div>
            </div>

            <div className="flex gap-4 pt-4">
              {/* SEÇÃO DE BOTÕES ALINHADA */}
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
                  disabled={loading}
                >
                  {loading ? (
                    <span className="flex items-center gap-2">
                      <svg className="animate-spin h-5 w-5 text-white" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                        <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4"></circle>
                        <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                      </svg>
                      Processando...
                    </span>
                  ) : (
                    "Finalizar Cadastro de Cliente"
                  )}
                </Button>
              </div>
            </div>
          </form>
        </CardContent>
      </Card>
    </div>
  )
}