'use client'

import { useState } from 'react'
import { supabase } from '@/lib/supabase'
import { useRouter } from 'next/navigation'
import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { Card, CardHeader, CardTitle, CardContent } from "@/components/ui/card"
import { Zap, UserCircle2, Lock, ShieldCheck } from 'lucide-react'
import { toast, Toaster } from "sonner"

export default function LoginPage() {
  const [identificador, setIdentificador] = useState('')
  const [password, setPassword] = useState('')
  const [loading, setLoading] = useState(false)
  const router = useRouter()

  async function handleLogin(e: React.FormEvent) {
    e.preventDefault()
    setLoading(true)

    let emailParaLogin = identificador;

    try {
      // DEBUG: Log para verificar o identificador
      console.log('=== DEBUG LOGIN ===')
      console.log('Identificador:', identificador)
      console.log('Contém @:', identificador.includes('@'))
      console.log('Supabase URL:', process.env.NEXT_PUBLIC_SUPABASE_URL)

      // 1. Verificar se o que foi digitado NÃO é um e-mail (ou seja, é CPF/CNPJ)
      if (!identificador.includes('@')) {
        const cleanIdentificador = identificador.replace(/\D/g, '')

        const { data: cliente, error: searchError } = await supabase
          .from('clientes')
          .select('email')
          .eq('cpf_cnpj', cleanIdentificador)
          .maybeSingle()

        if (searchError || !cliente) {
          toast.error("CPF/CNPJ não localizado no sistema.")
          setLoading(false)
          return
        }
        emailParaLogin = cliente.email;
      }

      // 2. Realizar o Login (serve para Admin e Cliente agora)
      const { data, error: loginError } = await supabase.auth.signInWithPassword({
        email: emailParaLogin,
        password: password,
      })

      if (loginError) {
        console.error("Erro Auth:", loginError.message)
        toast.error("Acesso negado. Verifique suas credenciais.")
        setLoading(false)
      } else {
        console.log('Auth Success:', data)
        toast.success("Acesso autorizado!")

        // 3. Redirecionamento Inteligente
        // Se for o admin, vai para /admin. Se for cliente, vai para /cliente/dashboard
        if (emailParaLogin === 'admin@p2p.com') {
          console.log('Redirecting to /admin/clientes')
          router.push('/admin/clientes')
        } else {
          console.log('Redirecting to /cliente')
          router.push('/cliente')
        }

        // Reset loading even on success in case redirect is slow
        // This setTimeout is now redundant if setLoading(false) is called above,
        // but keeping it as per original logic if there's a specific reason for delay.
        // setTimeout(() => setLoading(false), 2000) 
      }
    } catch (err) {
      console.error("Erro inesperado no login:", err)
      toast.error("Falha na conexão.")
      setLoading(false)
    }
  }

  return (
    <div className="flex items-center justify-center min-h-screen bg-slate-50 p-4">
      <Toaster richColors position="top-center" />

      <Card className="w-full max-w-md shadow-2xl border-none overflow-hidden bg-white">
        <CardHeader className="space-y-1 text-center bg-slate-50/50 pb-10 pt-10">
          <div className="flex justify-center mb-4">
            <div className="p-4 bg-emerald-100 rounded-2xl text-emerald-600 shadow-inner rotate-3">
              <Zap className="w-10 h-10 fill-current" />
            </div>
          </div>
          <CardTitle className="text-3xl font-black tracking-tighter text-slate-800">
            P2P <span className="text-emerald-600">ENERGIA</span>
          </CardTitle>
          <p className="text-[10px] font-bold text-slate-400 uppercase tracking-widest pt-2">
            Acesse sua conta com CPF/CNPJ ou E-mail
          </p>
        </CardHeader>

        <CardContent className="pt-8">
          <form onSubmit={handleLogin} className="space-y-6">
            <div className="space-y-2 text-left">
              <label className="text-[10px] font-black uppercase text-slate-400 flex items-center gap-2">
                <UserCircle2 className="w-3 h-3" /> Usuário
              </label>
              <Input
                type="text"
                placeholder="E-mail ou CPF/CNPJ"
                className="h-12 border-slate-200 focus:border-emerald-500 focus:ring-emerald-500"
                value={identificador}
                onChange={(e) => setIdentificador(e.target.value)}
                required
              />
            </div>

            <div className="space-y-2 text-left">
              <label className="text-[10px] font-black uppercase text-slate-400 flex items-center gap-2">
                <Lock className="w-3 h-3" /> Senha
              </label>
              <Input
                type="password"
                placeholder="Sua senha de acesso"
                className="h-12 border-slate-200 focus:border-emerald-500 focus:ring-emerald-500"
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                required
              />
            </div>

            <Button
              className="w-full bg-emerald-600 hover:bg-emerald-700 h-14 text-lg font-bold shadow-lg shadow-emerald-200 transition-all active:scale-[0.98]"
              disabled={loading}
            >
              {loading ? "Autenticando..." : "Entrar no Sistema"}
            </Button>

            <div className="flex items-center justify-center gap-2 text-slate-400">
              <ShieldCheck className="w-4 h-4" />
              <span className="text-[10px] font-medium">Conexão segura e criptografada</span>
            </div>
          </form>
        </CardContent>
      </Card>
    </div>
  )
}