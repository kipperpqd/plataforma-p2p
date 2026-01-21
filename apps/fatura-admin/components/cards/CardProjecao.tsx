'use client'

import { Card, CardContent } from "@/components/ui/card"
import { TrendingDown, Zap } from 'lucide-react'

interface CardProjecaoProps {
  valorAnual: number
}

export default function CardProjecao({ valorAnual }: CardProjecaoProps) {
  return (
    <Card className="border-none shadow-md bg-gradient-to-br from-slate-800 to-slate-950 text-white overflow-hidden relative">
      <CardContent className="pt-6 relative z-10 h-full flex flex-col justify-between">
        <TrendingDown className="absolute -right-4 -bottom-4 w-24 h-24 opacity-10 rotate-12 text-emerald-400" />
        <div>
          <p className="text-[10px] font-bold text-emerald-400 uppercase tracking-widest mb-1 text-left">Projeção de Futuro</p>
          <h4 className="text-sm font-bold leading-tight text-left italic">Economia anual estimada</h4>
        </div>
        <div className="mt-2 text-left">
          <p className="text-2xl font-black text-emerald-400">
            R$ {valorAnual.toLocaleString('pt-BR', { minimumFractionDigits: 2 })}
          </p>
          <p className="text-[11px] text-slate-400 mt-1 italic text-left">*Baseado na sua economia média mensal.</p>
        </div>
        <div className="mt-3 pt-3 border-t border-white/10 flex items-center gap-2">
          <Zap className="w-3 h-3 text-emerald-400" />
          <p className="text-[10px] text-slate-300 text-left">Aprox. <strong>2 faturas gratuitas</strong>/ano.</p>
        </div>
      </CardContent>
    </Card>
  )
}