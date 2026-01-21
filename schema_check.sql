


SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;


CREATE SCHEMA IF NOT EXISTS "public";


ALTER SCHEMA "public" OWNER TO "pg_database_owner";


COMMENT ON SCHEMA "public" IS 'standard public schema';



CREATE TYPE "public"."aal_level" AS ENUM (
    'aal1',
    'aal2',
    'aal3'
);


ALTER TYPE "public"."aal_level" OWNER TO "postgres";


CREATE TYPE "public"."factor_status" AS ENUM (
    'unverified',
    'verified'
);


ALTER TYPE "public"."factor_status" OWNER TO "postgres";


CREATE TYPE "public"."factor_type" AS ENUM (
    'totp',
    'webauthn'
);


ALTER TYPE "public"."factor_type" OWNER TO "postgres";

SET default_tablespace = '';

SET default_table_access_method = "heap";


CREATE TABLE IF NOT EXISTS "public"."clientes" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "nome_completo" "text" NOT NULL,
    "cpf_cnpj" "text" NOT NULL,
    "email" "text" NOT NULL,
    "fone" "text",
    "data_nascimento" "date",
    "codigo_cliente" "text" NOT NULL,
    "numero_medidor" "text" NOT NULL,
    "unidade_consumidora" "text",
    "desconto_percentual" numeric(5,2) DEFAULT 0.20,
    "nr_contrato" "text",
    "link_contrato" "text",
    "endereco_jsonb" "jsonb",
    "created_at" timestamp with time zone DEFAULT "timezone"('utc'::"text", "now"()),
    "updated_at" timestamp with time zone DEFAULT "timezone"('utc'::"text", "now"())
);


ALTER TABLE "public"."clientes" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."cobrancas" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "fatura_id" "uuid",
    "cliente_id" "uuid",
    "valor_p2p" numeric(10,2) NOT NULL,
    "data_emissao" timestamp with time zone DEFAULT "timezone"('brt'::"text", "now"()),
    "data_vencimento" "date" NOT NULL,
    "status_pagamento" "text" DEFAULT 'pendente'::"text",
    "data_pagamento" timestamp with time zone,
    "link_boleto_pdf" "text",
    "linha_digitavel_p2p" "text",
    "id_externo_asaas" "text",
    "created_at" timestamp with time zone DEFAULT "timezone"('brt'::"text", "now"()),
    "qr_code_pix" "text",
    "payload_pix" "text",
    CONSTRAINT "cobrancas_status_pagamento_check" CHECK (("status_pagamento" = ANY (ARRAY['pendente'::"text", 'pago'::"text", 'atrasado'::"text", 'cancelado'::"text"])))
);

ALTER TABLE ONLY "public"."cobrancas" REPLICA IDENTITY FULL;


ALTER TABLE "public"."cobrancas" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."economia_gerada" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "fatura_id" "uuid",
    "cliente_id" "uuid",
    "ft_enel_sem_gd" numeric(10,2),
    "total_itens_compensados" numeric(10,2),
    "lc_p2p" numeric(10,2),
    "nova_fatura_p2p" numeric(10,2),
    "economia_reais" numeric(10,2),
    "economia_percentual" numeric(5,2),
    "created_at" timestamp with time zone DEFAULT "timezone"('utc'::"text", "now"())
);


ALTER TABLE "public"."economia_gerada" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."faturas" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "cliente_id" "uuid",
    "codigo_cliente" "text" NOT NULL,
    "numero_medidor" "text" NOT NULL,
    "mes_referencia" "text" NOT NULL,
    "data_vencimento" "date",
    "ft_enel_com_gd" numeric(10,2),
    "media_consumo" numeric(10,2),
    "saldo_utilizado_mes" numeric(10,2),
    "saldo_total_atualizado" numeric(10,2),
    "reserva_creditos" numeric(10,2),
    "link_pdf_original" "text",
    "status_processamento" "text" DEFAULT 'processado'::"text",
    "created_at" timestamp with time zone DEFAULT "timezone"('utc'::"text", "now"()),
    "consumo_kwh" numeric,
    "bandeira_tarifaria" "text",
    "linha_digitavel_enel" "text",
    "nr_dias" numeric,
    "proxima_leitura" "date",
    "tributos" numeric
);


ALTER TABLE "public"."faturas" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."itens_faturados" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "fatura_id" "uuid",
    "descricao" "text" NOT NULL,
    "quantidade" numeric(12,4),
    "unitario" numeric(12,6),
    "valor" numeric(10,2) NOT NULL,
    "tipo_item" "text",
    "created_at" timestamp with time zone DEFAULT "timezone"('utc'::"text", "now"())
);


ALTER TABLE "public"."itens_faturados" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."lista_espera" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"(),
    "nome" "text" NOT NULL,
    "email" "text" NOT NULL,
    "consumo_estimado" numeric NOT NULL
);


ALTER TABLE "public"."lista_espera" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."schema_migrations" (
    "version" character varying(14) NOT NULL
);


ALTER TABLE "public"."schema_migrations" OWNER TO "postgres";


ALTER TABLE ONLY "public"."clientes"
    ADD CONSTRAINT "clientes_codigo_cliente_key" UNIQUE ("codigo_cliente");



ALTER TABLE ONLY "public"."clientes"
    ADD CONSTRAINT "clientes_cpf_codigo_uc" UNIQUE ("cpf_cnpj", "codigo_cliente");



ALTER TABLE ONLY "public"."clientes"
    ADD CONSTRAINT "clientes_email_key" UNIQUE ("email");



ALTER TABLE ONLY "public"."clientes"
    ADD CONSTRAINT "clientes_numero_medidor_key" UNIQUE ("numero_medidor");



ALTER TABLE ONLY "public"."clientes"
    ADD CONSTRAINT "clientes_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."cobrancas"
    ADD CONSTRAINT "cobrancas_fatura_id_unique" UNIQUE ("fatura_id");



ALTER TABLE ONLY "public"."cobrancas"
    ADD CONSTRAINT "cobrancas_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."economia_gerada"
    ADD CONSTRAINT "economia_gerada_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."faturas"
    ADD CONSTRAINT "faturas_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."itens_faturados"
    ADD CONSTRAINT "itens_faturados_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."lista_espera"
    ADD CONSTRAINT "lista_espera_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."schema_migrations"
    ADD CONSTRAINT "schema_migrations_pkey" PRIMARY KEY ("version");



ALTER TABLE ONLY "public"."cobrancas"
    ADD CONSTRAINT "unique_fatura_cobranca" UNIQUE ("fatura_id");



ALTER TABLE ONLY "public"."economia_gerada"
    ADD CONSTRAINT "unique_fatura_economia" UNIQUE ("fatura_id");



CREATE INDEX "idx_faturas_match" ON "public"."faturas" USING "btree" ("codigo_cliente", "numero_medidor");



CREATE INDEX "idx_itens_faturados_fatura_id" ON "public"."itens_faturados" USING "btree" ("fatura_id");



CREATE UNIQUE INDEX "schema_migrations_version_idx" ON "public"."schema_migrations" USING "btree" ("version");



CREATE OR REPLACE TRIGGER "webhook_extract" AFTER INSERT ON "public"."faturas" FOR EACH ROW EXECUTE FUNCTION "supabase_functions"."http_request"('https://uncalibrated-interhemal-cheree.ngrok-free.dev/webhook/fatura', 'POST', '{"Content-type":"application/json"}', '{}', '5000');



ALTER TABLE ONLY "public"."cobrancas"
    ADD CONSTRAINT "cobrancas_cliente_id_fkey" FOREIGN KEY ("cliente_id") REFERENCES "public"."clientes"("id");



ALTER TABLE ONLY "public"."cobrancas"
    ADD CONSTRAINT "cobrancas_fatura_id_fkey" FOREIGN KEY ("fatura_id") REFERENCES "public"."faturas"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."economia_gerada"
    ADD CONSTRAINT "economia_gerada_cliente_id_fkey" FOREIGN KEY ("cliente_id") REFERENCES "public"."clientes"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."economia_gerada"
    ADD CONSTRAINT "economia_gerada_fatura_id_fkey" FOREIGN KEY ("fatura_id") REFERENCES "public"."faturas"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."faturas"
    ADD CONSTRAINT "faturas_cliente_id_fkey" FOREIGN KEY ("cliente_id") REFERENCES "public"."clientes"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."itens_faturados"
    ADD CONSTRAINT "itens_faturados_fatura_id_fkey" FOREIGN KEY ("fatura_id") REFERENCES "public"."faturas"("id") ON DELETE CASCADE;



CREATE POLICY "Acesso exclusivo Admin - Economia" ON "public"."economia_gerada" FOR UPDATE TO "authenticated" USING ((("auth"."jwt"() ->> 'email'::"text") = 'admin@p2p.com'::"text")) WITH CHECK ((("auth"."jwt"() ->> 'email'::"text") = 'admin@p2p.com'::"text"));



CREATE POLICY "Acesso exclusivo Admin - Faturas" ON "public"."faturas" FOR UPDATE TO "authenticated" USING ((("auth"."jwt"() ->> 'email'::"text") = 'admin@p2p.com'::"text")) WITH CHECK ((("auth"."jwt"() ->> 'email'::"text") = 'admin@p2p.com'::"text"));



CREATE POLICY "Acesso exclusivo Admin - Itens" ON "public"."itens_faturados" TO "authenticated" USING ((("auth"."jwt"() ->> 'email'::"text") = 'admin@p2p.com'::"text"));



CREATE POLICY "Allow public read" ON "public"."clientes" FOR SELECT USING (true);



CREATE POLICY "Allow public read" ON "public"."economia_gerada" FOR SELECT USING (true);



CREATE POLICY "Allow public read" ON "public"."itens_faturados" FOR SELECT USING (true);



CREATE POLICY "Enable insert for authenticated users only" ON "public"."cobrancas" FOR INSERT TO "authenticated" WITH CHECK (true);



CREATE POLICY "Enable read access for autenticator" ON "public"."cobrancas" FOR SELECT TO "authenticator" USING (true);



CREATE POLICY "Lote_Livre_Anon" ON "public"."lista_espera" TO "anon" USING (true) WITH CHECK (true);



CREATE POLICY "Permitir atualiza????o p??blica de clientes" ON "public"."clientes" FOR UPDATE USING (true);



CREATE POLICY "Permitir inser????o p??blica de clientes" ON "public"."clientes" FOR INSERT WITH CHECK (true);



CREATE POLICY "Permitir update em faturas para admins" ON "public"."faturas" FOR UPDATE TO "authenticated" USING (true) WITH CHECK (true);



CREATE POLICY "Permitir_Insert_Faturas_Anon_Auth" ON "public"."faturas" FOR INSERT TO "authenticated", "anon" WITH CHECK (true);



CREATE POLICY "Permitir_Select_Faturas_Anon_Auth" ON "public"."faturas" FOR SELECT TO "authenticated", "anon" USING (true);



CREATE POLICY "Update par autenticados" ON "public"."cobrancas" FOR UPDATE TO "authenticated" USING (true) WITH CHECK (true);



ALTER TABLE "public"."clientes" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."cobrancas" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."economia_gerada" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."faturas" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."itens_faturados" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "leitura_completa_cobrancas" ON "public"."cobrancas" FOR SELECT TO "authenticated" USING (true);



ALTER TABLE "public"."lista_espera" ENABLE ROW LEVEL SECURITY;


GRANT USAGE ON SCHEMA "public" TO "postgres";
GRANT USAGE ON SCHEMA "public" TO "anon";
GRANT USAGE ON SCHEMA "public" TO "authenticated";
GRANT USAGE ON SCHEMA "public" TO "service_role";



GRANT ALL ON TABLE "public"."clientes" TO "anon";
GRANT ALL ON TABLE "public"."clientes" TO "authenticated";
GRANT ALL ON TABLE "public"."clientes" TO "service_role";



GRANT ALL ON TABLE "public"."cobrancas" TO "anon";
GRANT ALL ON TABLE "public"."cobrancas" TO "authenticated";
GRANT ALL ON TABLE "public"."cobrancas" TO "service_role";



GRANT ALL ON TABLE "public"."economia_gerada" TO "anon";
GRANT ALL ON TABLE "public"."economia_gerada" TO "authenticated";
GRANT ALL ON TABLE "public"."economia_gerada" TO "service_role";



GRANT ALL ON TABLE "public"."faturas" TO "anon";
GRANT ALL ON TABLE "public"."faturas" TO "authenticated";
GRANT ALL ON TABLE "public"."faturas" TO "service_role";



GRANT ALL ON TABLE "public"."itens_faturados" TO "anon";
GRANT ALL ON TABLE "public"."itens_faturados" TO "authenticated";
GRANT ALL ON TABLE "public"."itens_faturados" TO "service_role";



GRANT ALL ON TABLE "public"."lista_espera" TO "anon";
GRANT ALL ON TABLE "public"."lista_espera" TO "authenticated";
GRANT ALL ON TABLE "public"."lista_espera" TO "service_role";



GRANT ALL ON TABLE "public"."schema_migrations" TO "anon";
GRANT ALL ON TABLE "public"."schema_migrations" TO "authenticated";
GRANT ALL ON TABLE "public"."schema_migrations" TO "service_role";



ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "service_role";






ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "service_role";






ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES TO "service_role";







