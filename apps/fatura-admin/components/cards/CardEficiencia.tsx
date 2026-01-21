'use client'

import { Card } from "@/components/ui/card"
import { ArrowUpRight, ArrowDownRight } from 'lucide-react'

interface CardEficienciaProps {
  dados: {
    valor: number
    tendencia: 'sobe' | 'desce'
    percentual: string
  } | null
}

export default function CardEficiencia({ dados }: CardEficienciaProps) {
  return (
    <Card className="border-none shadow-sm bg-white dark:bg-slate-900 flex flex-col justify-center p-6 border-l-4 border-blue-500 text-left">
      <p className="text-[12px] font-bold text-slate-800 dark:text-slate-500 uppercase mb-3 tracking-tighter text-left">Gestão de consumo</p>
      
      {dados ? (
        <div className="space-y-3">
          <div className="flex items-end gap-3 text-left">
            <div className="flex items-center gap-1">
              {dados.tendencia === 'desce' ? (
                <ArrowDownRight className="w-6 h-6 text-green-500" />
              ) : (
                <ArrowUpRight className="w-6 h-6 text-red-500" />
              )}
              <span className={`text-2xl font-black leading-none ${dados.tendencia === 'desce' ? 'text-green-600' : 'text-red-600'}`}>
                {dados.percentual}%
              </span>
            </div>
            
          </div>
          <p className="text-[15px] text-slate-500 dark:text-slate-400 leading-tight text-left italic">
            Seu consumo foi <strong className={dados.tendencia === 'desce' ? 'text-green-600' : 'text-red-600'}>
              {dados.valor} kWh
            </strong> {dados.tendencia === 'desce' ? 'menor' : 'maior'} que o mês passado.
          </p>
        </div>
      ) : (
        <p className="text-xs text-slate-400 italic text-left">Analisando...</p>
      )}
    </Card>
  )
}