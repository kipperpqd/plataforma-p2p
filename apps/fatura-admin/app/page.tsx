'use client'

import { useState } from 'react'
import Link from 'next/link'
import { motion, AnimatePresence } from 'framer-motion'
import { createBrowserClient } from '@supabase/ssr'
import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { Card, CardContent } from "@/components/ui/card"
import {
  Zap, ArrowRight, TreeDeciduous,
  ChevronRight, ChevronLeft, ShieldCheck,
  BarChart3, Globe, ZapOff
} from 'lucide-react'
import { toast, Toaster } from "sonner"

export default function LandingPage() {
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
  ]

  async function handleLead(e: React.FormEvent) {
    e.preventDefault();
    setLoading(true);

    const { error } = await supabase
      .from('lista_espera')
      .insert([{ nome, email, consumo_estimado: Number(valorFatura) }])

    if (error) {
      toast.error(`Erro: ${error.message}`);
    } else {
      toast.success("Inscrição realizada com sucesso! Entraremos em contato.");
      setNome('');
      setEmail('');
    }
    setLoading(false);
  }

  return (
    <div className="min-h-screen bg-[#0A0C0B] text-white selection:bg-[#CCFF00] selection:text-black overflow-x-hidden">
      <Toaster richColors position="top-center" />

      {/* Background Decorativo - Industrial Grid Overlay */}
      <div className="fixed inset-0 pointer-events-none opacity-[0.03] z-0 bg-[url('https://www.transparenttextures.com/patterns/graphy.png')]"></div>

      {/* NAVBAR */}
      <nav className="flex justify-between items-center p-6 lg:px-12 max-w-screen-2xl mx-auto relative z-10">
        <div className="flex items-center gap-2">
          <div className="w-10 h-10 bg-[#CCFF00] flex items-center justify-center">
            <Zap className="w-6 h-6 text-black" />
          </div>
          <div className="text-xl font-black tracking-tighter uppercase italic">
            P2P <span className="text-[#CCFF00]">ENERGIA</span>
          </div>
        </div>
        <div className="flex items-center gap-6">
          <Link href="/auth/verify-cpf" className="hidden md:block text-xs font-bold tracking-[2px] uppercase opacity-60 hover:opacity-100 transition-opacity">
            Suporte
          </Link>
          <Link href="/auth/verify-cpf">
            <Button className="bg-[#CCFF00] hover:bg-white text-black font-black uppercase text-xs tracking-[1px] rounded-none h-10 px-6 transition-all">
              Acesso Cliente
            </Button>
          </Link>
        </div>
      </nav>

      {/* HERO SECTION */}
      <section className="px-6 lg:px-12 py-12 lg:py-24 max-w-screen-2xl mx-auto grid lg:grid-cols-12 gap-12 relative z-10">
        <div className="lg:col-span-7 space-y-12">
          <motion.div
            initial={{ opacity: 0, x: -50 }}
            animate={{ opacity: 1, x: 0 }}
            transition={{ duration: 0.8, ease: "easeOut" }}
            className="space-y-6"
          >
            <div className="inline-block px-3 py-1 bg-[#CCFF00]/10 border border-[#CCFF00]/20 text-[#CCFF00] text-[10px] font-black uppercase tracking-[3px]">
              Eficiência Energética 2.0
            </div>
            <h1 className="text-6xl md:text-9xl font-black leading-[0.9] tracking-tighter uppercase italic">
              ENERGIA <br />
              <span className="text-[#CCFF00]">INTELIGENTE.</span> <br />
              SEM OBRAS.
            </h1>
          </motion.div>

          <motion.p
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            transition={{ delay: 0.4, duration: 1 }}
            className="text-lg text-slate-400 max-w-xl leading-relaxed"
          >
            Digitalizamos sua conexão com a rede elétrica para entregar economia real. Sem instalação de placas, sem custos de manutenção. Apenas energia limpa via compensação P2P.
          </motion.p>

          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            <motion.div
              whileHover={{ scale: 1.02 }}
              className="p-8 bg-[#121413] border border-[#222] flex items-start gap-6 group hover:border-[#CCFF00] transition-colors"
            >
              <div className="p-4 bg-[#CCFF00]/5 rounded-none group-hover:bg-[#CCFF00] transition-colors">
                <TreeDeciduous className="w-8 h-8 text-[#CCFF00] group-hover:text-black transition-colors" />
              </div>
              <div>
                <h4 className="text-3xl font-black italic">+{arvoresSalvas}</h4>
                <p className="text-slate-500 text-[10px] font-bold uppercase tracking-widest mt-1">Árvores Salvas / Ano</p>
              </div>
            </motion.div>

            <motion.div
              whileHover={{ scale: 1.02 }}
              className="p-8 bg-[#121413] border border-[#222] flex items-start gap-6 group hover:border-[#CCFF00] transition-colors"
            >
              <div className="p-4 bg-[#CCFF00]/5 rounded-none group-hover:bg-[#CCFF00] transition-colors">
                <BarChart3 className="w-8 h-8 text-[#CCFF00] group-hover:text-black transition-colors" />
              </div>
              <div>
                <h4 className="text-3xl font-black italic">13.4%</h4>
                <p className="text-slate-500 text-[10px] font-bold uppercase tracking-widest mt-1">Desconto Médio</p>
              </div>
            </motion.div>
          </div>
        </div>

        {/* SIMULADOR + FORMULÁRIO */}
        <div className="lg:col-span-5 relative">
          <motion.div
            initial={{ opacity: 0, scale: 0.9 }}
            animate={{ opacity: 1, scale: 1 }}
            transition={{ duration: 0.6, delay: 0.2 }}
          >
            <Card className="bg-[#121413] border-[#222] rounded-none overflow-hidden shadow-[0_64px_128px_-12px_rgba(0,0,0,0.8)] border-t-8 border-t-[#CCFF00]">
              <CardContent className="p-0">
                <div className="bg-[#1A1C1B] p-8 border-b border-[#222]">
                  <h3 className="font-black uppercase tracking-[4px] text-xs text-slate-500">Simulador de Impacto</h3>
                  <div className="mt-8 space-y-4">
                    <div className="flex justify-between items-baseline">
                      <span className="text-[10px] font-bold text-slate-400 uppercase tracking-widest">Gasto Enel Atual</span>
                      <span className="text-3xl font-black italic text-[#CCFF00]">R$ {valorFatura}</span>
                    </div>
                    <input
                      type="range" min="200" max="2000" step="20"
                      value={valorFatura}
                      onChange={(e) => setValorFatura(Number(e.target.value))}
                      className="w-full h-1 bg-[#222] rounded-none appearance-none cursor-pointer accent-[#CCFF00]"
                    />
                  </div>
                </div>

                <div className="p-8 space-y-8">
                  <div className="grid grid-cols-2 gap-4">
                    <div className="p-6 bg-black/40 border border-[#222] space-y-1">
                      <p className="text-[9px] font-bold text-slate-500 uppercase tracking-widest">Nova Fatura</p>
                      <p className="text-xl font-black text-white italic">R$ {novaFaturaP2P.toFixed(2)}</p>
                    </div>
                    <div className="p-6 bg-[#CCFF00]/5 border border-[#CCFF00]/20 space-y-1">
                      <p className="text-[9px] font-bold text-[#CCFF00] uppercase tracking-widest">Eco. Total / Ano</p>
                      <p className="text-xl font-black text-[#CCFF00] italic">R$ {(economiaEstimada * 12).toFixed(2)}</p>
                    </div>
                  </div>

                  <form onSubmit={handleLead} className="space-y-4">
                    <div className="space-y-1">
                      <label className="text-[9px] font-bold text-slate-500 uppercase tracking-[2px] ml-1">Identificação</label>
                      <Input
                        placeholder="NOME COMPLETO"
                        className="h-12 bg-black border-[#222] text-white rounded-none border-l-4 border-l-[#CCFF00] focus:border-[#CCFF00] placeholder:text-slate-800 font-bold"
                        value={nome}
                        onChange={e => setNome(e.target.value)}
                        required
                      />
                    </div>
                    <div className="space-y-1">
                      <Input
                        type="email"
                        placeholder="E-MAIL@ENDEREÇO.COM"
                        className="h-12 bg-black border-[#222] text-white rounded-none border-l-4 border-l-slate-700 focus:border-[#CCFF00] placeholder:text-slate-800 font-bold"
                        value={email}
                        onChange={e => setEmail(e.target.value)}
                        required
                      />
                    </div>
                    <Button
                      type="submit"
                      disabled={loading}
                      className="w-full bg-[#CCFF00] hover:bg-white text-black h-16 text-sm font-black rounded-none tracking-[2px] transition-all group overflow-hidden"
                    >
                      <span className="relative z-10 flex items-center gap-4">
                        {loading ? "PROCESSANDO..." : "SOLICITAR CONVITE"}
                        <ArrowRight className="w-5 h-5 group-hover:translate-x-2 transition-transform" />
                      </span>
                    </Button>
                  </form>
                </div>
              </CardContent>
            </Card>
          </motion.div>
        </div>
      </section>

      {/* FEATURES - INDUSTRIAL BLOCKS */}
      <section className="py-24 border-y border-[#222]">
        <div className="max-w-screen-2xl mx-auto px-6 grid md:grid-cols-3 gap-0 border-x border-[#222]">
          {[
            { icon: Globe, title: "Energia Limpa", desc: "Proveniente de fazendas solares e biomassa 100% renováveis." },
            { icon: ZapOff, title: "Sem Investimento", desc: "Economia imediata sem compra de equipamentos ou obras." },
            { icon: ShieldCheck, title: "Gestão Digital", desc: "Acompanhamento em tempo real através do painel do cliente." }
          ].map((feature, i) => (
            <div key={i} className="p-12 border-r border-[#222] last:border-r-0 group hover:bg-[#CCFF00]/5 transition-colors">
              <feature.icon className="w-12 h-12 text-[#CCFF00] mb-8" />
              <h3 className="text-xl font-black uppercase italic mb-4">{feature.title}</h3>
              <p className="text-slate-500 text-sm leading-relaxed">{feature.desc}</p>
            </div>
          ))}
        </div>
      </section>

      {/* DEPOIMENTOS - ASYMMETRIC GRID */}
      <section className="py-24 bg-[#121413]/50">
        <div className="max-w-screen-2xl mx-auto px-6">
          <div className="flex justify-between items-end mb-16">
            <h2 className="text-4xl font-black uppercase italic leading-[0.8]">
              COMUNIDADE <br /><span className="text-[#CCFF00]">P2P ENERGIA</span>
            </h2>
            <div className="flex gap-2">
              <Button onClick={() => setDepoimentoIndex(Math.max(0, depoimentoIndex - 1))} className="w-12 h-12 bg-[#222] hover:bg-[#CCFF00] hover:text-black rounded-none">
                <ChevronLeft />
              </Button>
              <Button onClick={() => setDepoimentoIndex(Math.min(depoimentos.length - 1, depoimentoIndex + 1))} className="w-12 h-12 bg-[#222] hover:bg-[#CCFF00] hover:text-black rounded-none">
                <ChevronRight />
              </Button>
            </div>
          </div>

          <div className="relative overflow-hidden">
            <AnimatePresence mode="wait">
              <motion.div
                key={depoimentoIndex}
                initial={{ opacity: 0, y: 20 }}
                animate={{ opacity: 1, y: 0 }}
                exit={{ opacity: 0, y: -20 }}
                className="grid md:grid-cols-3 gap-8"
              >
                {depoimentos.slice(depoimentoIndex, depoimentoIndex + 3).map((d, i) => (
                  <Card key={i} className="bg-black border-[#222] p-8 rounded-none relative overflow-hidden group">
                    <div className="absolute top-0 right-0 w-16 h-16 bg-[#CCFF00]/5 -rotate-45 translate-x-8 -translate-y-8 group-hover:bg-[#CCFF00]/20 transition-colors"></div>
                    <p className="text-lg text-slate-300 italic mb-12">"{d.texto}"</p>
                    <div>
                      <p className="font-black uppercase tracking-tighter text-[#CCFF00]">{d.nome}</p>
                      <p className="text-[10px] font-bold text-slate-600 uppercase tracking-widest">{d.local}</p>
                    </div>
                  </Card>
                ))}
              </motion.div>
            </AnimatePresence>
          </div>
        </div>
      </section>

      {/* FOOTER */}
      <footer className="py-12 border-t border-[#222] bg-black">
        <div className="max-w-screen-2xl mx-auto px-6 flex flex-col md:flex-row justify-between items-center gap-8">
          <div className="text-lg font-black tracking-tighter uppercase italic">
            P2P <span className="text-[#CCFF00]">ENERGIA</span>
          </div>
          <p className="text-[#333] text-[10px] font-bold uppercase tracking-widest">
            © 2025 P2P ENERGIA - INTELIGÊNCIA EM GESTÃO ENERGÉTICA
          </p>
          <div className="flex gap-8">
            <a href="#" className="text-[#333] hover:text-[#CCFF00] text-[10px] font-bold uppercase tracking-widest">Privacidade</a>
            <a href="#" className="text-[#333] hover:text-[#CCFF00] text-[10px] font-bold uppercase tracking-widest">Termos</a>
          </div>
        </div>
      </footer>
    </div>
  )
}