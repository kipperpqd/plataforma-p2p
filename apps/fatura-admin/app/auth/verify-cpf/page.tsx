'use client'

import { useState } from 'react'
import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { Card, CardContent } from "@/components/ui/card"
import { Zap, ShieldCheck, ArrowRight, Loader2 } from 'lucide-react'
import { verifyCpfAndLogin } from '../actions'
import { toast, Toaster } from 'sonner'

export default function VerifyCpfPage() {
    const [loading, setLoading] = useState(false)
    const [cpf, setCpf] = useState('')

    const handleCpfChange = (e: React.ChangeEvent<HTMLInputElement>) => {
        // Máscara simples para CPF
        let val = e.target.value.replace(/\D/g, '')
        if (val.length > 11) val = val.slice(0, 11)
        if (val.length > 9) val = val.replace(/(\d{3})(\d{3})(\d{3})(\d{2})/, '$1.$2.$3-$4')
        else if (val.length > 6) val = val.replace(/(\d{3})(\d{3})(\d{3})/, '$1.$2.$3')
        else if (val.length > 3) val = val.replace(/(\d{3})(\d{3})/, '$1.$2')
        setCpf(val)
    }

    async function handleSubmit(e: React.FormEvent) {
        e.preventDefault()
        setLoading(true)

        const formData = new FormData()
        formData.append('cpf', cpf)

        const result = await verifyCpfAndLogin(formData)

        if (result?.error) {
            toast.error(result.error)
            setLoading(false)
        }
    }

    return (
        <div className="min-h-screen bg-[#0A0C0B] flex flex-col items-center justify-center p-6 font-sans">
            <Toaster richColors position="top-center" />

            {/* Background Decorativo - Industrial Noise Overlay (Simulado) */}
            <div className="fixed inset-0 pointer-events-none opacity-5 bg-[url('https://www.transparenttextures.com/patterns/carbon-fibre.png')]"></div>

            <div className="w-full max-w-md space-y-8 relative z-10">
                <div className="text-center space-y-2">
                    <div className="inline-flex p-3 bg-[#CCFF00]/10 rounded-full mb-4">
                        <Zap className="w-8 h-8 text-[#CCFF00]" />
                    </div>
                    <h1 className="text-4xl font-extrabold tracking-tighter text-white uppercase italic">
                        Acesso <span className="text-[#CCFF00]">Cliente</span>
                    </h1>
                    <p className="text-slate-400 text-sm tracking-widest uppercase">
                        Valide seu CPF para continuar
                    </p>
                </div>

                <Card className="bg-[#121413] border-[#222] shadow-[0_40px_80px_-15px_rgba(0,0,0,0.5)] rounded-none overflow-hidden border-t-4 border-t-[#CCFF00]">
                    <CardContent className="p-10 space-y-6">
                        <form onSubmit={handleSubmit} className="space-y-6">
                            <div className="space-y-2">
                                <label className="text-[10px] font-black text-slate-500 uppercase tracking-[2px] ml-1">
                                    CPF do Titular
                                </label>
                                <div className="relative group">
                                    <Input
                                        placeholder="000.000.000-00"
                                        className="h-14 bg-[#1A1C1B] border-[#333] text-white text-xl font-bold rounded-none focus:border-[#CCFF00] transition-all placeholder:text-slate-700"
                                        value={cpf}
                                        onChange={handleCpfChange}
                                        required
                                    />
                                    <div className="absolute right-4 top-1/2 -translate-y-1/2 text-slate-600 group-focus-within:text-[#CCFF00] transition-colors">
                                        <ShieldCheck className="w-6 h-6" />
                                    </div>
                                </div>
                            </div>

                            <div className="pt-4">
                                <Button
                                    type="submit"
                                    disabled={loading}
                                    className="w-full bg-[#CCFF00] hover:bg-[#DFFF4F] text-black h-16 text-lg font-black rounded-none transition-all hover:scale-[1.02] active:scale-95 flex items-center justify-center gap-2"
                                >
                                    {loading ? (
                                        <Loader2 className="w-6 h-6 animate-spin" />
                                    ) : (
                                        <>
                                            VERIFICAR CONTA
                                            <ArrowRight className="w-5 h-5" />
                                        </>
                                    )}
                                </Button>
                            </div>
                        </form>

                        <div className="p-4 bg-[#CCFF00]/5 border border-[#CCFF00]/10 flex gap-4 items-center">
                            <div className="w-2 h-2 rounded-full bg-[#CCFF00] animate-pulse"></div>
                            <p className="text-[10px] text-slate-400 uppercase font-bold tracking-tight">
                                Sistema utiliza criptografia de ponta a ponta para sua segurança.
                            </p>
                        </div>
                    </CardContent>
                </Card>

                <p className="text-center text-slate-600 text-xs">
                    Ainda não é cliente? <a href="/" className="text-slate-400 hover:text-[#CCFF00] transition-colors underline">Conheça nossos planos</a>
                </p>
            </div>
        </div>
    )
}
