import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  output: 'standalone',
  typescript: {
    ignoreBuildErrors: true,
  },
  eslint: {
    ignoreDuringBuilds: true,
  },
  webpack: (config, { dev, isServer }) => {
    if (dev && !isServer) {
      config.watchOptions = {
        poll: 1000, // Verifica mudanças a cada 1 segundo
        aggregateTimeout: 300, // Aguarda um pouco antes de recompilar
      };
    }
    return config;
  },
};

export default nextConfig;
