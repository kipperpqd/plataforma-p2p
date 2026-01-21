'use client'

import * as React from "react"
import { Moon, Sun } from "lucide-react"
import { useTheme } from "next-themes"
import { Button } from "@/components/ui/button"

export function ThemeToggle() {
  const { theme, setTheme } = useTheme()
  const [mounted, setMounted] = React.useState(false)

  // Garante que o componente só apareça após a hidratação
  React.useEffect(() => {
    setMounted(true)
  }, [])

  // Se ainda não montou, renderizamos um botão "fantasma" para manter o layout estável
  if (!mounted) {
    return <div className="w-9 h-9 flex items-center justify-center opacity-0" />
  }

  return (
    <Button
      variant="ghost"
      size="icon"
      className="relative w-9 h-9 rounded-full flex items-center justify-center hover:bg-slate-100 dark:hover:bg-slate-800 transition-colors border border-transparent"
      onClick={() => setTheme(theme === "dark" ? "light" : "dark")}
      type="button"
    >
      <Sun className="h-[1.2rem] w-[1.2rem] rotate-0 scale-100 transition-all dark:-rotate-90 dark:scale-0 text-yellow-500" />
      <Moon className="absolute h-[1.2rem] w-[1.2rem] rotate-90 scale-0 transition-all dark:rotate-0 dark:scale-100 text-blue-400" />
      <span className="sr-only">Alternar tema</span>
    </Button>
  )
}