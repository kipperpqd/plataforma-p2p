'use client'

import { 
  PieChart, Pie, Cell, Tooltip, ResponsiveContainer, Legend 
} from 'recharts'
import { useTheme } from 'next-themes'

interface GraficoPizzaProps {
  data: { name: string; value: number }[]
  colors?: string[]
}

const DEFAULT_COLORS = ['#0be132ff', '#152fddff', '#f5d20bff', '#ef4444', '#8b5cf6'];

export default function GraficoPizza({ data, colors = DEFAULT_COLORS }: GraficoPizzaProps) {
  const { theme } = useTheme()
  const isDark = theme === 'dark'

  return (
    /* Adicionada a classe "break-inside-avoid" para evitar que o gráfico seja cortado entre páginas
       e "print:h-[350px]" para garantir altura fixa no PDF, evitando o deslocamento. */
    <div className="h-[300px] w-full print:h-[350px] break-inside-avoid relative">
      <ResponsiveContainer width="100%" height="100%" debounce={1}>
        <PieChart margin={{ top: 0, left: 10, right: 10, bottom: 40 }}>
          <Pie 
            data={data} 
            innerRadius={65} 
            outerRadius={85} 
            paddingAngle={5} 
            dataKey="value"
            cx="50%" 
            cy="45%"
            isAnimationActive={false} // CRÍTICO: Desativar animação para impressão estável
          >
            {data.map((entry, i) => (
              <Cell 
                key={`cell-${i}`} 
                fill={colors[i % colors.length]} 
                className="outline-none"
              />
            ))}
          </Pie>
          
          <Tooltip 
            formatter={(v: number, n: string) => [`R$ ${v.toLocaleString('pt-BR', { minimumFractionDigits: 2 })}`, n]}
            contentStyle={{ 
              borderRadius: '12px', 
              border: 'none', 
              backgroundColor: isDark ? '#0f172a' : '#fff',
              color: isDark ? '#f8fafc' : '#0f172a',
              boxShadow: '0 10px 15px -3px rgb(0 0 0 / 0.1)' 
            }}
          />

          {/* Ajuste na Legenda: Usamos position relative para forçar o Recharts 
              a reservar o espaço real no DOM durante a impressão. */}
          <Legend 
            verticalAlign="bottom" 
            align="center" 
            layout="horizontal"
            iconType="circle"
            iconSize={8}
            wrapperStyle={{ 
              position: 'relative', 
              paddingTop: '20px',
              fontSize: '11px',
              color: isDark ? '#94a3b8' : '#64748b'
            }} 
          />
        </PieChart>
      </ResponsiveContainer>
    </div>
  )
}