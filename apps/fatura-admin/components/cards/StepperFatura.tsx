'use client'

import { Check, Clock, FileSearch, Wallet, CheckCircle2, AlertTriangle } from 'lucide-react'
import { Card, CardContent } from "@/components/ui/card"
import { Badge } from "@/components/ui/badge"

interface StepperFaturaProps {
  status: 1 | 2 | 3 | 4
  mesRef: string
  isAtrasada?: boolean // Nova Prop
}

export default function StepperFatura({ status = 2, mesRef, isAtrasada = false }: StepperFaturaProps) {
  const passos = [
    { id: 1, label: 'Identificada', icon: FileSearch, desc: 'Leitura recebida' },
    { id: 2, label: 'Processando', icon: Clock, desc: 'Calculando descontos' },
    { id: 3, label: 'Pagamento', icon: isAtrasada ? AlertTriangle : Wallet, desc: isAtrasada ? 'Pagamento Pendente' : 'Aguardando PIX' },
    { id: 4, label: 'Consolidada', icon: CheckCircle2, desc: 'Economia garantida' },
  ]

  return (
    <Card className={`border-none shadow-sm overflow-hidden transition-all ${isAtrasada ? 'bg-red-50/50 dark:bg-red-950/10 border-l-4 border-red-500' : 'bg-white dark:bg-slate-900'}`}>
      <CardContent className="pt-6 pb-8">
        <div className="flex flex-col md:flex-row justify-between items-start md:items-center mb-6 px-2">
          <div className="text-left">
            <h4 className={`text-sm font-bold uppercase tracking-tight ${isAtrasada ? 'text-red-600' : 'text-slate-700 dark:text-slate-200'}`}>
              Acompanhamento da Fatura {isAtrasada && " - VENCIDA"}
            </h4>
            <p className="text-[11px] text-slate-500 italic">Mês de Referência: {mesRef}</p>
          </div>
          <Badge variant="outline" className={`mt-2 md:mt-0 ${isAtrasada ? 'bg-red-100 text-red-700 border-red-200' : 'bg-blue-50 text-blue-600 border-blue-200'}`}>
            {isAtrasada ? "Atenção: Regularize Agora" : passos[status - 1].label}
          </Badge>
        </div>

        <div className="relative flex flex-col md:flex-row justify-between items-center w-full px-4 gap-8 md:gap-0">
          <div className="absolute top-5 left-0 w-full h-0.5 bg-slate-100 dark:bg-slate-800 hidden md:block" />
          
          {passos.map((passo) => {
            const Icon = passo.icon
            const isCompleted = status > passo.id
            const isActive = status === passo.id
            const isAlert = isAtrasada && passo.id === 3 && status < 4;

            return (
              <div key={passo.id} className="relative z-10 flex flex-row md:flex-col items-center gap-4 md:gap-2 w-full text-left md:text-center">
                <div className={`
                  flex items-center justify-center w-10 h-10 rounded-full border-2 transition-all duration-500
                  ${isCompleted ? 'bg-emerald-500 border-emerald-500 text-white' : ''}
                  ${isAlert ? 'bg-red-500 border-red-500 text-white animate-bounce shadow-[0_0_15px_rgba(239,68,68,0.5)]' : 
                    isActive ? 'bg-white dark:bg-slate-900 border-blue-500 text-blue-500 shadow-[0_0_15px_rgba(59,130,246,0.5)] scale-110' : 
                    !isCompleted ? 'bg-slate-50 dark:bg-slate-800 border-slate-200 dark:border-slate-700 text-slate-400' : ''}
                `}>
                  {isCompleted ? <Check className="w-5 h-5" /> : <Icon className="w-5 h-5" />}
                </div>
                <div>
                   <p className={`text-[11px] font-bold uppercase tracking-tighter ${isAlert ? 'text-red-600' : isActive ? 'text-blue-600' : 'text-slate-500'}`}>
                    {passo.label}
                  </p>
                </div>
              </div>
            )
          })}
        </div>
      </CardContent>
    </Card>
  )
}