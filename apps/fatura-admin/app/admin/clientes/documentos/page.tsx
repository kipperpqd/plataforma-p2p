'use client'

import { useState } from 'react'
import { supabase } from '@/lib/supabase'
import { Card, CardHeader, CardTitle, CardContent } from "@/components/ui/card"
import { Label } from "@/components/ui/label"
import { Input } from "@/components/ui/input"
import { Button } from "@/components/ui/button"
import { 
  Select, 
  SelectContent, 
  SelectItem, 
  SelectTrigger, 
  SelectValue 
} from "@/components/ui/select"
// Importe os ícones corretamente do lucide-react
import { FileStack, Loader2, CheckCircle2, AlertCircle } from 'lucide-react'

export default function DocumentosPage() {
  const [files, setFiles] = useState<File[]>([])
  const [uploading, setUploading] = useState(false)
  const [tipoDoc, setTipoDoc] = useState('faturas')
  const [progress, setProgress] = useState({ total: 0, current: 0 })

  async function handleBatchUpload(e: React.FormEvent) {
  e.preventDefault()
  if (files.length === 0) return alert('Selecione arquivos!')

  setUploading(true)
  try {
    for (const file of files) {
      const fileName = `${Date.now()}_${file.name.replace(/[^a-zA-Z0-9.]/g, '_')}`
      const filePath = `triagem/${fileName}`

      // 1. Upload do Arquivo
      const { error: uploadError } = await supabase.storage
        .from('faturas')
        .upload(filePath, file)

      if (uploadError) throw new Error(`Erro no Storage: ${uploadError.message}`)

      // 2. Obter URL pública
      const { data: { publicUrl } } = supabase.storage.from('faturas').getPublicUrl(filePath)

      // 3. Registro no Banco (Aqui é onde o RLS ou erro de coluna ataca)
      const { error: dbError } = await supabase.from('faturas').insert({
        link_pdf_original: publicUrl,
        status_processamento: 'aguardando_triagem',
        codigo_cliente: 'PENDENTE',
        numero_medidor: 'PENDENTE',
        mes_referencia: 'PENDENTE'
      })

      if (dbError) throw new Error(`Erro no Banco: ${dbError.message}`)
    }

    alert('Upload concluído!')
    setFiles([])
  } catch (err: any) {
    console.error(err)
    alert(err.message) // Isso vai nos mostrar o erro REAL em vez de "upstream server"
  } finally {
    setUploading(false)
  }
}



  return (
    <div className="container py-10">
      <Card className="max-w-2xl mx-auto shadow-2xl border-t-4 border-emerald-600">
        <CardHeader>
          <CardTitle className="flex items-center gap-2 text-2xl font-bold">
            <FileStack className="text-emerald-600 w-8 h-8" />
            Upload em Lote
          </CardTitle>
          <p className="text-sm text-slate-500">
            As faturas enviadas entrarão em fila para triagem automática via Python.
          </p>
        </CardHeader>
        <CardContent>
          <form onSubmit={handleBatchUpload} className="space-y-8">
            
            <div className="space-y-3">
              <Label className="text-base font-semibold">O que você está enviando?</Label>
              <Select onValueChange={setTipoDoc} defaultValue="faturas">
                <SelectTrigger className="w-full h-12">
                  <SelectValue />
                </SelectTrigger>
                <SelectContent>
                  <SelectItem value="faturas">Faturas de Energia (Triagem Inteligente)</SelectItem>
                  <SelectItem value="contratos">Contratos (Repositório Geral)</SelectItem>
                </SelectContent>
              </Select>
            </div>

            <div className="border-2 border-dashed border-slate-200 rounded-xl p-8 bg-slate-50 hover:bg-slate-100 transition-colors cursor-pointer group">
              <Label htmlFor="file-upload" className="cursor-pointer flex flex-col items-center justify-center gap-3">
                <div className="p-4 bg-white rounded-full shadow-sm group-hover:scale-110 transition-transform">
                  <FileStack className="w-10 h-10 text-emerald-500" />
                </div>
                <div className="text-center">
                  <span className="text-emerald-600 font-bold">Clique para selecionar</span> ou arraste os PDFs
                  <p className="text-xs text-slate-400 mt-1 uppercase tracking-wider">Apenas arquivos .pdf</p>
                </div>
              </Label>
              <Input 
                id="file-upload"
                type="file" 
                accept=".pdf" 
                multiple 
                className="hidden" 
                onChange={(e) => setFiles(Array.from(e.target.files || []))} 
              />
            </div>

            {files.length > 0 && (
              <div className="bg-slate-50 rounded-lg p-4 border border-slate-200">
                <h4 className="text-sm font-bold text-slate-700 mb-2">Arquivos selecionados ({files.length}):</h4>
                <ul className="text-xs text-slate-600 space-y-1 max-h-40 overflow-y-auto">
                  {files.map((f, i) => (
                    <li key={i} className="flex items-center gap-2">
                      <div className="w-1.5 h-1.5 bg-emerald-400 rounded-full" />
                      {f.name}
                    </li>
                  ))}
                </ul>
              </div>
            )}

            <Button 
              type="submit" 
              className="w-full h-14 text-lg bg-emerald-600 hover:bg-emerald-700 shadow-lg shadow-emerald-100 transition-all active:scale-95" 
              disabled={uploading || files.length === 0}
            >
              {uploading ? (
                <div className="flex items-center gap-3">
                  <Loader2 className="animate-spin w-6 h-6" />
                  <span>Enviando {progress.current} de {progress.total}...</span>
                </div>
              ) : (
                <div className="flex items-center gap-2">
                  <CheckCircle2 className="w-6 h-6" />
                  <span>Iniciar Processamento em Lote</span>
                </div>
              )}
            </Button>

            {uploading && (
                <div className="w-full bg-slate-100 rounded-full h-2.5">
                    <div 
                        className="bg-emerald-600 h-2.5 rounded-full transition-all duration-300" 
                        style={{ width: `${(progress.current / progress.total) * 100}%` }}
                    ></div>
                </div>
            )}
          </form>
        </CardContent>
      </Card>

      <div className="max-w-2xl mx-auto mt-8 flex gap-4 p-4 bg-blue-50 border border-blue-100 rounded-lg text-blue-800">
        <AlertCircle className="shrink-0" />
        <p className="text-sm">
          <strong>Como funciona:</strong> Ao clicar em enviar, os arquivos são carregados para uma área de triagem. 
          O robô Python lerá os dados internos de cada conta para identificar o cliente e o mês automaticamente.
        </p>
      </div>
    </div>
  )
}

