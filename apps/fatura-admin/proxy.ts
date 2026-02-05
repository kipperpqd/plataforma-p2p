import { createServerClient, type CookieOptions } from '@supabase/ssr'
import { NextResponse, type NextRequest } from 'next/server'

/**
 * Middleware Proxy de Autenticação
 * 
 * Este arquivo atua como um "segurança" na porta de entrada da aplicação.
 * Ele verifica quem é o usuário, se ele está logado e se tem permissão
 * para acessar a rota que solicitou.
 */
export async function proxy(request: NextRequest) {
  const { pathname } = request.nextUrl
  let response = NextResponse.next({ request: { headers: request.headers } })

  // 1. BYPASS para Desenvolvimento: Libera acesso automático se a variável BYPASS_AUTH for true
  if (process.env.BYPASS_AUTH === 'true' && pathname.startsWith('/admin')) {
    console.log(`[Middleware] BYPASS ATIVO para rota admin: ${pathname}`)
    return response
  }

  // Rotas que não precisam de autenticação ou que fazem parte do fluxo de auth
  const isPublicRoute =
    pathname === '/' ||
    pathname.startsWith('/auth') ||
    pathname === '/login'

  // Configurações de conexão com o Supabase
  const supabaseUrl = process.env.SUPABASE_URL_INTERNAL || process.env.NEXT_PUBLIC_SUPABASE_URL
  const supabaseAnonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY

  // Identifica se o usuário está tentando acessar uma área restrita (Administração ou Painel do Cliente)
  const isProtectedRoute = pathname.startsWith('/admin') || pathname.startsWith('/cliente')

  // 2. Verificação de Configuração: Se não houver chaves do Supabase, bloqueia apenas áreas restritas
  if (!supabaseUrl || !supabaseAnonKey) {
    if (isProtectedRoute) {
      return NextResponse.redirect(new URL('/auth/verify-cpf', request.url))
    }
    return response
  }

  try {
    // Inicializa o cliente do Supabase para verificar a sessão (cookies)
    const supabase = createServerClient(
      supabaseUrl,
      supabaseAnonKey,
      {
        cookies: {
          get(name: string) { return request.cookies.get(name)?.value },
          set(name: string, value: string, options: CookieOptions) {
            request.cookies.set({ name, value, ...options })
            response = NextResponse.next({ request: { headers: request.headers } })
            response.cookies.set({ name, value, ...options })
          },
          remove(name: string, options: CookieOptions) {
            request.cookies.set({ name, value: '', ...options })
            response = NextResponse.next({ request: { headers: request.headers } })
            response.cookies.set({ name, value: '', ...options })
          },
        },
      }
    )

    // 3. Busca o usuário atual com timeout
    const getUserPromise = supabase.auth.getUser()
    const timeoutPromise = new Promise((_, reject) =>
      setTimeout(() => reject(new Error('Timeout ao conectar com Supabase')), 5000)
    )

    let user, authError
    try {
      const result = await Promise.race([getUserPromise, timeoutPromise]) as any
      user = result?.data?.user
      authError = result?.error
    } catch (timeoutError: any) {
      if (isProtectedRoute) {
        return NextResponse.redirect(new URL('/auth/verify-cpf', request.url))
      }
      return response
    }

    if (authError || !user) {
      if (isProtectedRoute) {
        return NextResponse.redirect(new URL('/auth/verify-cpf', request.url))
      }
      return response
    }

    // 4. Lógica de Permissões (Admin vs Cliente)
    const isAdmin = user.email === 'p2penergia@gmail.com'

    // Se o usuário logado for ADMIN e tentar acessar a home ou login, manda pro painel admin
    if (isAdmin && (pathname === '/' || pathname === '/login' || pathname.startsWith('/auth'))) {
      return NextResponse.redirect(new URL('/admin/clientes', request.url))
    }

    // Se o usuário logado for CLIENTE (não admin)
    if (!isAdmin) {
      // 5. Verificação de Vínculo: Usuário logado precisa ter um cadastro na tabela 'clientes'
      const { data: cliente } = await supabase
        .from('clientes')
        .select('id')
        .eq('auth_id', user.id)
        .single()

      // Se logou com social mas não vinculou CPF ainda, manda vincular
      if (!cliente && !pathname.startsWith('/auth')) {
        return NextResponse.redirect(new URL('/auth/verify-cpf', request.url))
      }

      // Se tentar acessar área administrativa sendo apenas cliente, manda pro painel do cliente
      if (pathname.startsWith('/admin')) {
        return NextResponse.redirect(new URL('/cliente', request.url))
      }
    }

    return response
  } catch (error: any) {
    if (isProtectedRoute) {
      return NextResponse.redirect(new URL('/auth/verify-cpf', request.url))
    }
    return response
  }
}

/**
 * CONFIGURAÇÃO DO MATCHER
 * Define em quais URLs este arquivo deve atuar.
 */
export const config = {
  matcher: [
    '/admin/:path*',
    '/cliente/:path*',
    '/auth/:path*',
    '/login',
    // Exclui arquivos estáticos e webhooks
    '/((?!_next/static|_next/image|favicon.ico|api/asaas/webhook).*)'
  ],
}