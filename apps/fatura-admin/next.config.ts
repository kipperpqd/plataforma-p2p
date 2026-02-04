import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  output: 'standalone',
  env: {
    // Injetando a chave manualmente para garantir que o servidor a enxergue
    ASAAS_API_KEY: process.env.ASAAS_API_KEY || '$aact_hmlg_000MzkwODA2MWY2OGM3MWRlMDU2NWM3MzJlNzZmNGZhZGY6OjIwMmU2NTBlLTcwYzMtNGUyNS1iODcxLTMwNmM5ZTE0Y2E0Yzo6JGFhY2hfN2NmMDZmMGItZDRjYy00YzNhLWJiNmMtODE5N2NiYjc1YmJl',
    ASAAS_WEBHOOK_TOKEN: process.env.ASAAS_WEBHOOK_TOKEN || 'aDccE5VLFRqefG2OIJtA20svjjpdvGwxM9YYeas0pOFHXrehRwLz24kG0fVu0deg',
  },
  turbopack: {},
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
