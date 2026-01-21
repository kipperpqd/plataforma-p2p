'use client'

import { useState } from 'react'
import Link from 'next/link'
import { createBrowserClient } from '@supabase/ssr'
import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { Card, CardContent } from "@/components/ui/card"
import { 
  Zap, Leaf, TrendingDown, Users, ArrowRight, 
  TreeDeciduous, Quote, ChevronRight, ChevronLeft 
} from 'lucide-react'
import { toast, Toaster } from "sonner"

export default function LandingPage() {
  // 1. ADICIONADO: Estados que faltavam no seu snippet
  const [valorFatura, setValorFatura] = useState(500)
  const [nome, setNome] = useState('')
  const [email, setEmail] = useState('')
  const [loading, setLoading] = useState(false)
  const [depoimentoIndex, setDepoimentoIndex] = useState(0)

  const supabase = createBrowserClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!
  ) 

  const economiaEstimada = (valorFatura * 0.134)
  const novaFaturaP2P = valorFatura - economiaEstimada
  const arvoresSalvas = Math.floor((valorFatura / 0.89) * 12 / 1000)

  const depoimentos = [
    { nome: "João M. Silva", texto: "Minha conta baixou de R$ 450 para R$ 385 sem eu gastar um real do meu bolso.", local: "Fortaleza/CE" },
    { nome: "Maria Oliveira", texto: "Excelente atendimento. O relatório mensal é muito detalhado e transparente.", local: "Caucaia/CE" },
    { nome: "Carlos Lima", texto: "Sustentabilidade com economia real. Recomendo para todos os amigos.", local: "Aquiraz/CE" },
    { nome: "Ana Costa", texto: "O processo foi muito rápido. Em dois meses já vi a diferença na conta.", local: "Maracanaú/CE" },
    { nome: "Pedro Rocha", texto: "Simplesmente a melhor decisão que tomei para o meu comércio este ano.", local: "Eusébio/CE" },
    { nome: "Roberto Souza", texto: "Transparência total nos itens faturados. Muito confiável.", local: "Sobral/CE" },
    { nome: "Clara Mendes", texto: "A plataforma é intuitiva e o suporte é nota 10.", local: "Juazeiro/CE" },
    { nome: "Luís Fernando", texto: "Economizar ajudando o planeta é o melhor dos mundos.", local: "Crato/CE" },
    { nome: "Beatriz Paz", texto: "Finalmente uma solução simples para energia solar.", local: "Iguatu/CE" },
    { nome: "Alberto Jr.", texto: "O sistema de compensação P2P funciona perfeitamente.", local: "Itapipoca/CE" },
  ]

  // 2. CORRIGIDO: Função handleLead completa e com limpeza de campos
  async function handleLead(e: React.FormEvent) {
  e.preventDefault();
  setLoading(true);

  const { error } = await supabase
    .from('lista_espera')
    .insert([
      { 
        nome: nome, 
        email: email, 
        consumo_estimado: Number(valorFatura) 
      }
    ])
    .select() // Adicione isso para forçar a verificação da política de ALL
    
  if (error) {
    console.error("ERRO:", error);
    toast.error(`Erro: ${error.message}`);
  } else {
    toast.success("Sucesso!");
    setNome('');
    setEmail('');
  }
  setLoading(false);
}

  return (
    <div className="min-h-screen bg-white text-slate-900 overflow-x-hidden text-left">
      <Toaster richColors position="top-center" />
      
      {/* NAVBAR */}
      <nav className="flex justify-between items-center p-6 max-w-7xl mx-auto">
        <div className="text-2xl font-bold text-green-600">
          P2P <span className="font-normal text-green-600">Energia</span>
        </div>
        <Link href="/login">
          <Button variant="outline" className="font-bold border-green-600 text-green-600 hover:bg-green-50">
            Área do Cliente
          </Button>
        </Link>
      </nav>

      {/* HERO SECTION */}
      <section className="px-6 py-12 max-w-7xl mx-auto grid lg:grid-cols-2 gap-12 items-start">
        <div className="space-y-8 pt-8">
          <h1 className="text-5xl md:text-7xl font-black leading-tight text-slate-900">
            Sua conta de luz <br/>
            <span className="text-green-600 underline decoration-slate-200">mais barata</span>.
          </h1>
          <p className="text-xl text-slate-600 max-w-lg leading-relaxed">
            Sem placas no telhado, sem obras. Apenas economia real na sua fatura através de energia limpa e renovável.
          </p>

          <div className="bg-green-600 p-8 rounded-3xl text-white shadow-xl shadow-green-100 flex items-center gap-6 transform transition-transform hover:scale-105">
            <div className="bg-white/20 p-4 rounded-full">
              <TreeDeciduous className="w-12 h-12 text-white" />
            </div>
            <div>
              <h4 className="text-2xl font-black">+{arvoresSalvas} Árvores</h4>
              <p className="text-green-50 text-sm font-medium opacity-90 leading-tight">
                É o impacto ambiental que você gera por ano ao migrar para a P2P Energia.
              </p>
            </div>
          </div>
        </div>

        {/* SIMULADOR + FORMULÁRIO */}
        <Card className="border-none shadow-[0_32px_64px_-12px_rgba(0,0,0,0.1)] rounded-[40px] overflow-hidden">
          <div className="bg-green-600 p-8 text-white text-center">
            <h3 className="font-black uppercase tracking-[3px] text-xs">Simulador de Economia</h3>
            <p className="text-green-100 text-sm mt-1 font-medium">Descubra sua nova fatura em segundos</p>
            <p className="text-green-100 text-sm font-small">* Os valores reais podem sofrer pequenas variações</p>
          </div>
          <CardContent className="p-10 space-y-8 bg-white">
            <div className="space-y-6">
              <div className="flex justify-between items-end">
                <label className="text-[14px] font-black text-slate-400 uppercase tracking-widest">Sua fatura hoje</label>
                <span className="text-4xl font-black text-green-600">R$ {valorFatura}</span>
              </div>
              <input 
                type="range" min="200" max="2000" step="20"
                value={valorFatura}
                onChange={(e) => setValorFatura(Number(e.target.value))}
                className="w-full h-2 bg-slate-400 rounded-lg appearance-none cursor-pointer accent-green-600"
              />
            </div>

            <div className="grid grid-cols-2 gap-4">
              <div className="p-6 bg-slate-50 rounded-2xl border-2 border-slate-100 text-left">
                <p className="text-[14px] font-black text-slate-400 uppercase mb-2">Fatura P2P</p>
                <p className="text-2xl font-black text-slate-800">R$ {novaFaturaP2P.toFixed(2)}</p>
              </div>
              <div className="p-6 bg-green-50 rounded-2xl border-2 border-green-100 text-left">
                <p className="text-[14px] font-black text-green-600 uppercase mb-2">Economia Anual</p>
                <p className="text-2xl font-black text-green-700">R$ {(economiaEstimada * 12).toFixed(2)}</p>
              </div>
            </div>

            <Separator text="Garantir Desconto" />

            <form onSubmit={handleLead} className="space-y-4">
              <div className="space-y-2 text-left">
                <label className="text-[10px] font-bold text-slate-500 uppercase ml-1">Nome Completo</label>
                <Input 
                  placeholder="Ex: João da Silva" 
                  className="h-12 rounded-xl bg-slate-50 border-slate-200" 
                  value={nome} 
                  onChange={e => setNome(e.target.value)} 
                  required
                />
              </div>
              <div className="space-y-2 text-left">
                <label className="text-[10px] font-bold text-slate-500 uppercase ml-1">Melhor E-mail</label>
                <Input 
                  type="email" 
                  placeholder="email@exemplo.com" 
                  className="h-12 rounded-xl bg-slate-50 border-slate-200"
                  value={email} 
                  onChange={e => setEmail(e.target.value)} 
                  required
                />
              </div>
              <Button 
                type="submit"
                className="w-full bg-green-600 hover:bg-green-700 h-14 text-lg font-black rounded-2xl shadow-lg shadow-green-100 transition-all hover:-translate-y-1" 
                disabled={loading}
              >
                {loading ? "ENVIANDO..." : "GARANTIR MINHA ECONOMIA"}
              </Button>
            </form>
          </CardContent>
        </Card>
      </section>

      {/* CARROSSEL DE DEPOIMENTOS */}
      <section className="py-24 bg-slate-50 relative">
        <div className="max-w-7xl mx-auto px-6 text-center">
          <h2 className="text-3xl font-black mb-12 uppercase tracking-tighter">Quem já mudou para a P2P Energia</h2>
          
          <div className="relative group">
            <div className="grid grid-cols-1 md:grid-cols-5 gap-4">
              {depoimentos.slice(depoimentoIndex, depoimentoIndex + 5).map((d, i) => (
                <Card key={i} className="border-none shadow-sm p-6 bg-white rounded-2xl text-left h-full flex flex-col justify-between">
                  <div className="space-y-4">
                    <Quote className="w-8 h-8 text-green-100 fill-green-100" />
                    <p className="text-sm text-slate-600 italic leading-relaxed">"{d.texto}"</p>
                  </div>
                  <div className="mt-6">
                    <p className="text-sm font-black text-slate-900">{d.nome}</p>
                    <p className="text-[10px] font-bold text-green-600 uppercase">{d.local}</p>
                  </div>
                </Card>
              ))}
            </div>

            <button 
              onClick={() => setDepoimentoIndex(0)}
              className={`absolute -left-4 top-1/2 -translate-y-1/2 p-3 rounded-full bg-white shadow-xl border z-10 transition-opacity ${depoimentoIndex === 0 ? 'opacity-30' : 'opacity-100'}`}
            >
              <ChevronLeft className="w-6 h-6" />
            </button>
            <button 
              onClick={() => setDepoimentoIndex(5)}
              className={`absolute -right-4 top-1/2 -translate-y-1/2 p-3 rounded-full bg-white shadow-xl border z-10 transition-opacity ${depoimentoIndex === 5 ? 'opacity-30' : 'opacity-100'}`}
            >
              <ChevronRight className="w-6 h-6" />
            </button>
          </div>
        </div>
      </section>

      {/* FOOTER */}
      <footer className="py-12 border-t text-center text-slate-400 text-sm">
        <div className="text-green-600 font-bold text-lg mb-4">P2P <span className="font-normal text-slate-400">Energia</span></div>
        <p>© 2025 P2P Energia - Inteligência em Gestão Energética</p>
      </footer>
    </div>
  )
}

function Separator({ text }: { text: string }) {
  return (
    <div className="relative flex py-2 items-center">
      <div className="flex-grow border-t border-slate-100"></div>
      <span className="flex-shrink mx-4 text-[10px] font-black text-slate-300 uppercase tracking-widest">{text}</span>
      <div className="flex-grow border-t border-slate-100"></div>
    </div>
  )
}