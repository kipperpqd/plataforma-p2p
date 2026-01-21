'use client'

import { TreeDeciduous, Zap, Medal, Trophy, Star } from 'lucide-react'

interface CardImpactoProps {
  totalKwh: number
}

export default function CardImpacto({ totalKwh }: CardImpactoProps) {
  // Lógica de Gamificação
  const co2Evitado = totalKwh * 0.089;
  const arvoresRaw = totalKwh / 1000;
  const arvoresSalvas = Math.floor(arvoresRaw);
  const progresso = (arvoresRaw % 1) * 100;

  // Definição de Níveis
  const getNivel = () => {
    if (arvoresSalvas >= 15) return { nome: 'Guardião da Floresta', cor: 'from-amber-500 to-yellow-700', icone: <Trophy className="w-8 h-8" />, badge: 'Nível Épico' };
    if (arvoresSalvas >= 6) return { nome: 'Protetor da Natureza', cor: 'from-blue-500 to-indigo-700', icone: <Medal className="w-8 h-8" />, badge: 'Nível Avançado' };
    return { nome: 'Semente Sustentável', cor: 'from-emerald-500 to-teal-700', icone: <Star className="w-8 h-8" />, badge: 'Nível Inicial' };
  };

  const nivel = getNivel();

  return (
    <div className={`md:col-span-2 rounded-xl shadow-md bg-gradient-to-br ${nivel.cor} text-white overflow-hidden relative transition-all duration-500`}>
      <div className="p-6 relative">
        <Zap className="absolute -right-4 -bottom-4 w-32 h-32 opacity-10 rotate-12" />
        
        <div className="flex justify-between items-start relative z-10">
          <div className="flex items-center gap-4">
            <div className="p-3 bg-white/20 rounded-full animate-pulse">
              {nivel.icone}
            </div>
            <div className="text-left">
              <div className="flex items-center gap-2">
                <p className="text-[10px] font-bold opacity-80 uppercase tracking-[0.2em]">Selo P2P Sustentável</p>
                <span className="text-[9px] bg-white/20 px-2 py-0.5 rounded-full font-bold uppercase">{nivel.badge}</span>
              </div>
              <h3 className="text-xl font-extrabold">{nivel.nome}</h3>
              <p className="text-[12px] opacity-90 mt-1 max-w-[280px]">
                Seu consumo evitou <strong>{co2Evitado.toFixed(1)}kg</strong> de CO₂. <br/>
                Você já salvou <strong>{arvoresSalvas}</strong> árvores adultas!
              </p>
            </div>
          </div>
          
          <div className="hidden sm:block text-right">
             <TreeDeciduous className="w-12 h-12 opacity-40 text-white" />
          </div>
        </div>

        {/* Barra de Progresso Gamificada */}
        <div className="mt-6 relative z-10">
          <div className="flex justify-between text-[9px] font-bold mb-1 uppercase opacity-80">
            <span>Progresso para a próxima árvore</span>
            <span>{progresso.toFixed(0)}%</span>
          </div>
          <div className="h-2.5 w-full bg-black/20 rounded-full overflow-hidden border border-white/10">
            <div 
              className="h-full bg-white shadow-[0_0_10px_rgba(255,255,255,0.5)] transition-all duration-1000 ease-out" 
              style={{ width: `${progresso}%` }} 
            />
          </div>
          <p className="text-[8px] mt-2 opacity-60 text-center uppercase tracking-tighter">
            Cada 1.000 kWh consumidos de fonte renovável equivalem a 1 árvore plantada.
          </p>
        </div>
      </div>
    </div>
  )
}