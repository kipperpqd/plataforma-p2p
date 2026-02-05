'use server'

import { createServerClient } from '@supabase/ssr'
import { cookies } from 'next/headers'
import { redirect } from 'next/navigation'

/**
 * Server Action para verificar o CPF e iniciar o fluxo de login
 */
export async function verifyCpfAndLogin(formData: FormData) {
    const cpf = formData.get('cpf')?.toString().replace(/\D/g, '')

    if (!cpf || cpf.length !== 11) {
        return { error: 'CPF inválido. Digite apenas os 11 números.' }
    }

    const cookieStore = await cookies()
    const supabase = createServerClient(
        process.env.NEXT_PUBLIC_SUPABASE_URL!,
        process.env.SUPABASE_SERVICE_ROLE_KEY!, // Usamos service role para busca administrativa
        {
            cookies: {
                get(name: string) { return cookieStore.get(name)?.value },
                set(name: string, value: string, options: any) { cookieStore.set({ name, value, ...options }) },
                remove(name: string, options: any) { cookieStore.set({ name, value: '', ...options }) },
            },
        }
    )

    // 1. Verifica se o CPF existe na base de clientes
    const { data: cliente, error } = await supabase
        .from('clientes')
        .select('id, email, nome_completo')
        .eq('cpf_cnpj', cpf)
        .single()

    if (error || !cliente) {
        return { error: 'CPF não encontrado em nossa base de clientes ativos.' }
    }

    // 2. Armazena o CPF temporariamente em um cookie para o vínculo no callback
    cookieStore.set('pending_cpf_link', cpf, {
        maxAge: 60 * 10, // 10 minutos
        httpOnly: true,
        secure: process.env.NODE_ENV === 'production'
    })

    // 3. Redireciona para o login social (Google)
    const { data, error: authError } = await supabase.auth.signInWithOAuth({
        provider: 'google',
        options: {
            redirectTo: `${process.env.NEXT_PUBLIC_SITE_URL || 'http://localhost:3000'}/auth/callback`,
        }
    })

    if (authError) {
        return { error: 'Erro ao iniciar autenticação: ' + authError.message }
    }

    if (data.url) {
        redirect(data.url)
    }

    return { success: true }
}
