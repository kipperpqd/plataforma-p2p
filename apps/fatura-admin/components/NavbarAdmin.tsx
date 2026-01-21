'use client'

import { supabase } from '@/lib/supabase'
import { useRouter, usePathname } from 'next/navigation'
import { 
  LogOut, 
  LayoutDashboard, 
  Users, 
  FileBarChart, 
  Factory, 
  Settings,
  Menu
} from 'lucide-react'
import { Button } from '@/components/ui/button'
import { Badge } from '@/components/ui/badge'
import { toast } from 'sonner'
import Link from 'next/link'
import { ThemeToggle } from '@/components/ThemeToggle' // Importando o botão


export default function NavbarAdmin() {
  const router = useRouter()
  const pathname = usePathname()

  const handleLogout = async () => {
    const { error } = await supabase.auth.signOut()
    if (error) {
      toast.error('Erro ao sair da sessão')
    } else {
      router.push('/login')
    }
  }

  // Função para verificar se o link está ativo
  const isActive = (path: string) => pathname === path

  return (
    <nav className="fixed top-0 left-0 right-0 z-50 bg-white/90 dark:bg-slate-950/90 backdrop-blur-md border-b border-slate-200 dark:border-slate-800 shadow-sm transition-colors duration-300">
      <div className="max-w-7xl mx-auto px-4 h-15 flex items-center justify-between"> 
        
        {/* LADO ESQUERDO: LOGO E NAVEGAÇÃO */}
        <div className="flex items-center gap-8">
          {/* LOGO COM EFEITO SHIMMER */}
          <Link href="/admin" className="relative group cursor-pointer block">
            <div className="text-2xl font-black tracking-tighter flex items-center gap-1">
              <span className="relative overflow-hidden text-emerald-900 dark:text-emerald-400">
                P2P ENERGIA
                <div className="absolute inset-0 -translate-x-full group-hover:animate-[shimmer_0.8s_infinite] bg-gradient-to-r from-transparent via-white/70 to-transparent dark:via-white/20 skew-x-[-20deg]" />
                <div className="absolute inset-0 -translate-x-full animate-[shimmer_4s_infinite] bg-gradient-to-r from-transparent via-white/30 to-transparent dark:via-white/10 skew-x-[-20deg]" />
              </span>
            </div>
            <div className="flex items-center gap-2 -mt-1">
              <p className="text-[8px] font-bold text-slate-500 dark:text-slate-400 uppercase tracking-[0.3em]">
                Painel de Gestão
              </p>
              <Badge variant="outline" className="text-[7px] h-3 px-1 border-emerald-200 dark:border-emerald-800 text-emerald-700 dark:text-emerald-400 bg-emerald-50 dark:bg-emerald-950/30 font-black">ADMIN</Badge>
            </div>
          </Link>

          {/* MENU DE ITENS COMPLETO */}
          <div className="hidden lg:flex items-center gap-1 border-l pl-6 border-slate-200 dark:border-slate-800">
            <Link href="/admin">
              <Button variant="ghost" size="sm" className={`text-xs font-bold gap-2 ${isActive('/admin') ? 'text-emerald-600 bg-emerald-50 dark:bg-emerald-950/30' : 'text-slate-600 dark:text-slate-400'}`}>
                <LayoutDashboard className="w-3.5 h-3.5" /> Dashboard
              </Button>
            </Link>

            <Link href="/admin/clientes">
              <Button variant="ghost" size="sm" className={`text-xs font-bold gap-2 ${isActive('/admin/clientes') ? 'text-emerald-600 bg-emerald-50 dark:bg-emerald-950/30' : 'text-slate-600 dark:text-slate-400'}`}>
                <Users className="w-3.5 h-3.5" /> Clientes
              </Button>
            </Link>

            <Link href="/admin/faturas">
              <Button variant="ghost" size="sm" className={`text-xs font-bold gap-2 ${isActive('/admin/faturas') ? 'text-emerald-600 bg-emerald-50 dark:bg-emerald-950/30' : 'text-slate-600 dark:text-slate-400'}`}>
                <FileBarChart className="w-3.5 h-3.5" /> Faturas
              </Button>
            </Link>

            <Link href="/admin/clientes/documentos">
              <Button variant="ghost" size="sm" className={`text-xs font-bold gap-2 ${isActive('/admin/clientes/documentos') ? 'text-emerald-600 bg-emerald-50 dark:bg-emerald-950/30' : 'text-slate-600 dark:text-slate-400'}`}>
                <Factory className="w-3.5 h-3.5" /> Upload
              </Button>
            </Link>

            <Link href="/admin/relatorios">
              <Button variant="ghost" size="sm" className={`text-xs font-bold gap-2 ${isActive('/admin/relatorios') ? 'text-emerald-600 bg-emerald-50 dark:bg-emerald-950/30' : 'text-slate-600 dark:text-slate-400'}`}>
                <Settings className="w-3.5 h-3.5" /> Relatórios
              </Button>
            </Link>
          </div>
        </div>

        {/* LADO DIREITO: TEMA + SAIR */}
        <div className="flex items-center gap-2">
          {/* BOTÃO DARK MODE */}
          <ThemeToggle />
          
          <div className="h-6 w-[1px] bg-slate-200 dark:bg-slate-800 mx-1 hidden sm:block" />

          <Button 
            variant="ghost" 
            size="sm" 
            onClick={handleLogout}
            className="text-slate-500 hover:text-red-600 dark:text-slate-400 dark:hover:text-red-400 hover:bg-red-50 dark:hover:bg-red-950/20 transition-all gap-2 font-bold text-xs"
          >
            <span className="hidden sm:inline">Sair</span>
            <LogOut className="w-4 h-4" />
          </Button>
          
          <Button variant="ghost" size="icon" className="lg:hidden text-slate-500 dark:text-slate-400">
            <Menu className="w-5 h-5" />
          </Button>
        </div>
      </div>

      <style jsx global>{`
        @keyframes shimmer {
          0% { transform: translateX(-100%) skewX(-20deg); }
          100% { transform: translateX(100%) skewX(-20deg); }
        }
      `}</style>
    </nav>
  )
}