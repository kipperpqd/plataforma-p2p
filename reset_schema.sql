-- ATENÇÃO: ISSO APAGARÁ TODOS OS DADOS DO SCHEMA PUBLIC
-- Execute isso no Editor SQL do Supabase Dashboard

DROP SCHEMA public CASCADE;
CREATE SCHEMA public;

-- Restaurar permissões padrão do Supabase
GRANT USAGE ON SCHEMA public TO postgres, anon, authenticated, service_role;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO postgres, anon, authenticated, service_role;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres, anon, authenticated, service_role;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres, anon, authenticated, service_role;

-- Opcional: Se você usa extensions no public, pode ser necessário reativá-las,
-- mas geralmente o backup já contém os comandos 'CREATE EXTENSION IF NOT EXISTS'.
