import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  output: 'standalone',
  typescript: {
    ignoreBuildErrors: true,
  },
  // O Next.js 15+ já ignora ESLint por padrão se não configurado
};

export default nextConfig;
