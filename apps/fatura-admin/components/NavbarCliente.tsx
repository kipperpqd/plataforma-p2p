'use client'

import { supabase } from '@/lib/supabase'
import { useRouter } from 'next/navigation'
import { LogOut } from 'lucide-react'
import { Button } from '@/components/ui/button'
import { toast } from 'sonner'

export default function NavbarCliente() {
  const router = useRouter()

  const handleLogout = async () => {
    const { error } = await supabase.auth.signOut()
    if (error) {
      toast.error('Erro ao sair da sessão')
    } else {
      router.push('/login')
    }
  }

  return (
    <nav className="fixed top-0 left-0 right-0 z-50 bg-white/80 backdrop-blur-md border-b border-slate-200">
      <div className="max-w-7xl mx-auto px-4 h-16 flex items-center justify-between"> 
        
        {/* LOGO COM EFEITO BRILHO SOLAR (SHIMMER) */}
        <div className="relative group cursor-default">
          <div className="text-2xl font-black tracking-tighter flex items-center gap-1">
            <span className="relative overflow-hidden text-emerald-900">
              P2P ENERGIA
              
              {/* CAMADA DE BRILHO (O SOL PASSANDO) */}
              <div className="absolute inset-0 -translate-x-full group-hover:animate-[shimmer_0.5s_infinite] bg-gradient-to-r from-transparent via-white/60 to-transparent skew-x-[-20deg]" />
              
              {/* ANIMAÇÃO AUTOMÁTICA (OPCIONAL) */}
              <div className="absolute inset-0 -translate-x-full animate-[shimmer_3s_infinite] bg-gradient-to-r from-transparent via-white/40 to-transparent skew-x-[-20deg]" />
            </span>
          </div>
          <p className="text-[8px] font-bold text-slate-700 uppercase tracking-[0.3em] -mt-1">
            Inteligência Energética
          </p>
        </div>

        {/* BOTÃO DE SAIR */}
        <Button 
          variant="ghost" 
          size="sm" 
          onClick={handleLogout}
          className="text-slate-500 hover:text-red-600 hover:bg-red-50 transition-all gap-2"
        >
          <span className="hidden md:inline font-medium">Sair da Conta</span>
          <LogOut className="w-4 h-4" />
        </Button>
      </div>

      <style jsx global>{`
        @keyframes shimmer {
          100% {
            transform: translateX(100%);
          }
        }
      `}</style>
    </nav>
  )
}