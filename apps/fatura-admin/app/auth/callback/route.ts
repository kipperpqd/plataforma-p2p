import { createServerClient } from '@supabase/ssr'
import { cookies } from 'next/headers'
import { NextResponse } from 'next/server'

/**
 * Rota de Callback para OAuth do Supabase
 * Aqui vinculamos o usuário autênticado com o cadastro no banco via CPF
 */
export async function GET(request: Request) {
    const { searchParams, origin } = new URL(request.url)
    const code = searchParams.get('code')
    const next = searchParams.get('next') ?? '/'

    if (code) {
        const cookieStore = await cookies()
        const supabase = createServerClient(
            process.env.NEXT_PUBLIC_SUPABASE_URL!,
            process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
            {
                cookies: {
                    get(name: string) { return cookieStore.get(name)?.value },
                    set(name: string, value: string, options: any) { cookieStore.set({ name, value, ...options }) },
                    remove(name: string, options: any) { cookieStore.set({ name, value: '', ...options }) },
                },
            }
        )

        // Troca o código pela sessão
        const { data: { user }, error } = await supabase.auth.exchangeCodeForSession(code)

        if (!error && user) {
            // 1. Verifica se há um CPF pendente de vínculo no cookie
            const pendingCpf = cookieStore.get('pending_cpf_link')?.value

            if (pendingCpf) {
                // Inicializa cliente administrativo para o vínculo
                const supabaseAdmin = createServerClient(
                    process.env.NEXT_PUBLIC_SUPABASE_URL!,
                    process.env.SUPABASE_SERVICE_ROLE_KEY!,
                    {
                        cookies: {
                            get(name: string) { return cookieStore.get(name)?.value },
                            set(name: string, value: string, options: any) { cookieStore.set({ name, value, ...options }) },
                            remove(name: string, options: any) { cookieStore.set({ name, value: '', ...options }) },
                        },
                    }
                )

                // 2. Vincula o auth_id do Supabase ao registro do cliente
                const { error: linkError } = await supabaseAdmin
                    .from('clientes')
                    .update({ auth_id: user.id })
                    .eq('cpf_cnpj', pendingCpf)

                if (!linkError) {
                    // Limpa o cookie de CPF pendente
                    cookieStore.set('pending_cpf_link', '', { maxAge: 0 })

                    // Redireciona para a área do cliente
                    return NextResponse.redirect(`${origin}/cliente`)
                } else {
                    console.error('Erro ao vincular auth_id:', linkError.message)
                }
            }

            return NextResponse.redirect(`${origin}${next}`)
        }
    }

    // Em caso de erro, volta para a verificação
    return NextResponse.redirect(`${origin}/auth/verify-cpf?error=auth_failed`)
}
