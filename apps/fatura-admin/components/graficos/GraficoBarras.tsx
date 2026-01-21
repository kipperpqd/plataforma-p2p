'use client'

import { 
  BarChart, Bar, XAxis, YAxis, CartesianGrid, 
  Tooltip, ResponsiveContainer, Cell, ReferenceLine 
} from 'recharts'
import { useTheme } from 'next-themes'

interface GraficoBarrasProps {
  data: any[]
  eixoX: string
  dataKey: string
  media?: number
  unidade?: string
}

export default function GraficoBarras({ data, eixoX, dataKey, media, unidade = "kWh" }: GraficoBarrasProps) {
  const { theme } = useTheme()
  const isDark = theme === 'dark'

  return (
    <div className="h-[300px] w-full">
      <ResponsiveContainer width="100%" height="100%">
        {/* Aumentado o bottom para 30 para dar espaço às legendas do eixo X no PDF */}
        <BarChart data={data} margin={{ top: 20, right: 35, left: 0, bottom: 30 }}>
          <CartesianGrid 
            strokeDasharray="3 3" 
            vertical={false} 
            stroke={isDark ? '#1e293b' : '#f1f5f9'} 
          />
          <XAxis 
            dataKey={eixoX} 
            axisLine={false} 
            tickLine={false} 
            tick={{ fill: isDark ? '#64748b' : '#94a3b8', fontSize: 10 }}
            dy={10} // Desloca os textos do eixo X levemente para baixo para não encostar nas barras
          />
          <YAxis 
            axisLine={false} 
            tickLine={false} 
            tick={{ fill: isDark ? '#64748b' : '#94a3b8', fontSize: 10 }}
            tickFormatter={(v) => `${v}`}
          />
          <Tooltip 
            cursor={{ fill: isDark ? '#1e293b' : '#f8fafc', opacity: 0.4 }}
            contentStyle={{ 
              borderRadius: '12px', 
              border: 'none', 
              backgroundColor: isDark ? '#0f172a' : '#fff',
              color: isDark ? '#f8fafc' : '#0f172a',
              boxShadow: '0 10px 15px -3px rgb(0 0 0 / 0.1)' 
            }}
            formatter={(value) => [`${value} ${unidade}`, 'Consumo']}
          />
          
          {media && (
            <ReferenceLine 
              y={media} 
              stroke="#3b82f6" 
              strokeWidth={2} 
              strokeDasharray="3 3"
              label={{ 
                position: 'insideCenter', // Alterado para insideRight para evitar que o texto saia da folha A4
                value: `Média`, 
                fill: '#000000ff', 
                fontSize: 12, 
                fontWeight: 'bold',
                offset: 10
              }} 
            />
          )}

          <Bar dataKey={dataKey} radius={[6, 6, 0, 0]} barSize={32}>
            {data.map((entry, index) => (
              <Cell 
                key={`cell-${index}`} 
                fill={entry.color || '#3b82f6'} 
                className="transition-all duration-300 hover:opacity-80"
              />
            ))}
          </Bar>
        </BarChart>
      </ResponsiveContainer>
    </div>
  )
}