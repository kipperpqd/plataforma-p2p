'use client'

import { 
  LineChart, Line, XAxis, YAxis, CartesianGrid, 
  Tooltip, ResponsiveContainer, Legend 
} from 'recharts'
import { useTheme } from 'next-themes'

interface GraficoLinhasProps {
  data: any[]
  eixoX: string
  linhas: { key: string; name: string; color: string; dashed?: boolean; glow?: boolean }[]
}

export default function GraficoLinhas({ data, eixoX, linhas }: GraficoLinhasProps) {
  const { theme } = useTheme()
  const isDark = theme === 'dark'

  // LÓGICA DE ZOOM DINÂMICO:
  // Encontra o menor e o maior valor entre todas as chaves de linhas presentes no gráfico
  const getMinMax = () => {
    if (!data || data.length === 0) return [0, 'auto'];
    
    const allValues: number[] = [];
    data.forEach(item => {
      linhas.forEach(l => {
        if (item[l.key] !== undefined) allValues.push(item[l.key]);
      });
    });

    const min = Math.min(...allValues);
    const max = Math.max(...allValues);

    // Retorna o mínimo com 15% de margem abaixo e o máximo com 10% acima
    return [
      Math.floor(min * 0.75), 
      Math.ceil(max * 1.1)
    ];
  };

  const [minY, maxY] = getMinMax();

  return (
    <div className="h-[350px] w-full">
      <ResponsiveContainer width="100%" height="100%">
        <LineChart data={data} margin={{ top: 10, right: 30, left: 10, bottom: 0 }}>
          <defs>
            <filter id="shadowGlow" height="200%">
              <feGaussianBlur in="SourceAlpha" stdDeviation="3" />
              <feOffset dx="0" dy="4" result="offsetblur" />
              <feComponentTransfer><feFuncA type="linear" slope="0.3" /></feComponentTransfer>
              <feMerge><feMergeNode /><feMergeNode in="SourceGraphic" /></feMerge>
            </filter>
          </defs>
          <CartesianGrid 
            strokeDasharray="3 3" 
            vertical={false} 
            stroke={isDark ? '#1e293b' : '#f1f5f9'} 
          />
          <XAxis 
            dataKey={eixoX} 
            axisLine={false} 
            tickLine={false} 
            tick={{ fill: isDark ? '#64748b' : '#94a3b8', fontSize: 11 }} 
          />
          <YAxis 
            axisLine={false} 
            tickLine={false} 
            tick={{ fill: isDark ? '#64748b' : '#94a3b8', fontSize: 11 }}
            tickFormatter={(v) => `R$ ${v}`}
            domain={[minY, maxY]} // AQUI ESTÁ O ZOOM DINÂMICO
            allowDecimals={false}
          />
          <Tooltip 
            contentStyle={{ 
              borderRadius: '12px', 
              border: 'none', 
              backgroundColor: isDark ? '#0f172a' : '#fff',
              color: isDark ? '#f8fafc' : '#0f172a',
              boxShadow: '0 10px 15px -3px rgb(0 0 0 / 0.1)' 
            }} 
          />
          <Legend verticalAlign="top" align="right" height={40} />
          
          {linhas.map((linha) => (
            <Line
              key={linha.key}
              type="monotone"
              dataKey={linha.key}
              name={linha.name}
              stroke={linha.color}
              strokeWidth={linha.glow ? 4 : 2}
              strokeDasharray={linha.dashed ? "5 5" : "0"}
              filter={linha.glow ? "url(#shadowGlow)" : "none"}
              dot={linha.glow ? { r: 5, fill: linha.color, strokeWidth: 2, stroke: isDark ? '#0f172a' : '#fff' } : false}
              activeDot={{ r: 8, strokeWidth: 0 }}
              animationDuration={1500}
            />
          ))}
        </LineChart>
      </ResponsiveContainer>
    </div>
  )
}