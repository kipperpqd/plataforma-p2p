'use client'

import { useEffect, useState } from 'react'
import { supabase } from '@/lib/supabase'
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table"
import { Card, CardHeader, CardTitle, CardContent } from "@/components/ui/card"
import { Button } from "@/components/ui/button"
import Link from 'next/link'
import { Trash2, Edit } from 'lucide-react' // Ícones para os botões

export default function ListaClientes() {
  const [clientes, setClientes] = useState<any[]>([])
  const [loading, setLoading] = useState(true)

  async function fetchClientes() {
    setLoading(true)
    const { data, error } = await supabase
      .from('clientes')
      .select('*')
      .order('created_at', { ascending: false })

    if (error) alert('Erro ao buscar: ' + error.message)
    else setClientes(data || [])
    setLoading(false)
  }

  // Função para EXCLUIR cliente
  async function handleDelete(id: string, nome: string) {
    const confirmar = confirm(`Tem certeza que deseja excluir o cliente ${nome}?`)
    
    if (confirmar) {
      const { error } = await supabase
        .from('clientes')
        .delete()
        .eq('id', id)

      if (error) {
        alert('Erro ao excluir: ' + error.message)
      } else {
        alert('Cliente removido com sucesso!')
        // Atualiza a lista localmente para sumir da tela na hora
        setClientes(clientes.filter(c => c.id !== id))
      }
    }
  }

  useEffect(() => {
    fetchClientes()
  }, [])

  return (
    <div className="container py-10">
      <Card>
        <CardHeader className="flex flex-row items-center justify-between">
          <CardTitle className="text-2xl font-bold text-slate-800">Gerenciamento de Clientes</CardTitle>
          <Link href="/admin/clientes/novo">
            <Button className="bg-blue-600 hover:bg-blue-700">Novo Cliente</Button>
          </Link>
        </CardHeader>
        <CardContent>
          <Table>
            <TableHeader className="bg-slate-50">
              <TableRow>
                <TableHead>Nome</TableHead>
                <TableHead>CPF/CNPJ</TableHead>
                <TableHead>Código/Medidor</TableHead>
                <TableHead>Cidade</TableHead>
                <TableHead className="text-right">Ações</TableHead>
              </TableRow>
            </TableHeader>
            <TableBody>
              {loading ? (
                <TableRow><TableCell colSpan={5} className="text-center py-10 text-slate-500">Carregando dados...</TableCell></TableRow>
              ) : clientes.length === 0 ? (
                <TableRow><TableCell colSpan={5} className="text-center py-10 text-slate-500">Nenhum cliente cadastrado.</TableCell></TableRow>
              ) : (
                clientes.map((cliente) => (
                  <TableRow key={cliente.id} className="hover:bg-slate-50/50 transition-colors">
                    <TableCell className="font-medium">{cliente.nome_completo}</TableCell>
                    <TableCell>{cliente.cpf_cnpj}</TableCell>
                    <TableCell className="text-sm text-slate-600">
                      {cliente.codigo_cliente} <br/>
                      <span className="text-xs text-slate-400">{cliente.numero_medidor}</span>
                    </TableCell>
                    <TableCell>{cliente.endereco_jsonb?.cidade || '-'}</TableCell>
                    <TableCell className="text-right space-x-2">
                      {/* Link dinâmico para edição */}
                      <Link href={`/admin/clientes/editar/${cliente.id}`}>
                        <Button variant="outline" size="icon" className="h-8 w-8 text-blue-600">
                          <Edit className="h-4 w-4" />
                        </Button>
                      </Link>
                      
                      <Button 
                        variant="outline" 
                        size="icon" 
                        className="h-8 w-8 text-red-600 hover:bg-red-50"
                        onClick={() => handleDelete(cliente.id, cliente.nome_completo)}
                      >
                        <Trash2 className="h-4 w-4" />
                      </Button>
                    </TableCell>
                  </TableRow>
                ))
              )}
            </TableBody>
          </Table>
        </CardContent>
      </Card>
    </div>
  )
}