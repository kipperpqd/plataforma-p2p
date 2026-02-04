import { createServerClient, type CookieOptions } from '@supabase/ssr'
import { NextResponse, type NextRequest } from 'next/server'

export async function proxy(request: NextRequest) {
  const { pathname } = request.nextUrl
  let response = NextResponse.next({ request: { headers: request.headers } })

  // BYPASS AUTH: Se estiver ativo e for rota admin, libera direto no topo
  if (process.env.BYPASS_AUTH === 'true' && pathname.startsWith('/admin')) {
    console.log(`[Middleware] BYPASS ATIVO para rota admin: ${pathname}`)
    return response
  }

  // Validação das variáveis de ambiente
  const supabaseUrl = process.env.SUPABASE_URL_INTERNAL || process.env.NEXT_PUBLIC_SUPABASE_URL
  const supabaseAnonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY

  const isProtectedRoute = pathname.startsWith('/admin') || pathname.startsWith('/cliente')

  if (!supabaseUrl || !supabaseAnonKey) {
    if (isProtectedRoute) {
      return NextResponse.redirect(new URL('/login', request.url))
    }
    return response
  }

  try {
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
      console.error('Middleware Supabase timeout:', timeoutError.message)
      if (isProtectedRoute) {
        return NextResponse.redirect(new URL('/login', request.url))
      }
      return response
    }

    if (authError) {
      if (authError.message !== 'Auth session missing!') {
        console.error('Proxy Supabase error:', authError.message)
      }
      if (isProtectedRoute) {
        return NextResponse.redirect(new URL('/login', request.url))
      }
      return response
    }

    const userEmail = user?.email
    const isAdmin = userEmail === 'p2penergia@gmail.com'

    if (user && pathname === '/login') {
      return NextResponse.redirect(new URL(isAdmin ? '/admin/clientes' : '/cliente', request.url))
    }

    if (!user && isProtectedRoute) {
      return NextResponse.redirect(new URL('/login', request.url))
    }

    if (pathname.startsWith('/admin') && !isAdmin) {
      return NextResponse.redirect(new URL('/cliente', request.url))
    }

    return response
  } catch (error: any) {
    console.error('Middleware error:', error?.message || error)
    if (isProtectedRoute) {
      return NextResponse.redirect(new URL('/login', request.url))
    }
    return response
  }
}

export const config = {
  matcher: [
    '/admin/:path*',
    '/cliente/:path*',
    '/login',
    '/((?!_next/static|_next/image|favicon.ico|api/asaas/webhook).*)'
  ],
}