-- \connect postgres

--
-- PostgreSQL database dump
--


-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: _realtime; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA _realtime;


ALTER SCHEMA _realtime OWNER TO postgres;

--
-- Name: auth; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA auth;


ALTER SCHEMA auth OWNER TO supabase_admin;

--
-- Name: extensions; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA extensions;


ALTER SCHEMA extensions OWNER TO postgres;

--
-- Name: graphql; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql;


ALTER SCHEMA graphql OWNER TO supabase_admin;

--
-- Name: graphql_public; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql_public;


ALTER SCHEMA graphql_public OWNER TO supabase_admin;

--
-- Name: pg_net; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_net WITH SCHEMA extensions;


--
-- Name: EXTENSION pg_net; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_net IS 'Async HTTP';


--
-- Name: pgbouncer; Type: SCHEMA; Schema: -; Owner: pgbouncer
--

CREATE SCHEMA pgbouncer;


ALTER SCHEMA pgbouncer OWNER TO pgbouncer;

--
-- Name: realtime; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA realtime;


ALTER SCHEMA realtime OWNER TO supabase_admin;

--
-- Name: storage; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA storage;


ALTER SCHEMA storage OWNER TO supabase_admin;

--
-- Name: supabase_functions; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA supabase_functions;


ALTER SCHEMA supabase_functions OWNER TO supabase_admin;

--
-- Name: vault; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA vault;


ALTER SCHEMA vault OWNER TO supabase_admin;

--
-- Name: pg_graphql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_graphql WITH SCHEMA graphql;


--
-- Name: EXTENSION pg_graphql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_graphql IS 'pg_graphql: GraphQL support';


--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA extensions;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA extensions;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: supabase_vault; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS supabase_vault WITH SCHEMA vault;


--
-- Name: EXTENSION supabase_vault; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION supabase_vault IS 'Supabase Vault Extension';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA extensions;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: aal_level; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.aal_level AS ENUM (
    'aal1',
    'aal2',
    'aal3'
);


ALTER TYPE auth.aal_level OWNER TO supabase_auth_admin;

--
-- Name: code_challenge_method; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.code_challenge_method AS ENUM (
    's256',
    'plain'
);


ALTER TYPE auth.code_challenge_method OWNER TO supabase_auth_admin;

--
-- Name: factor_status; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_status AS ENUM (
    'unverified',
    'verified'
);


ALTER TYPE auth.factor_status OWNER TO supabase_auth_admin;

--
-- Name: factor_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_type AS ENUM (
    'totp',
    'webauthn',
    'phone'
);


ALTER TYPE auth.factor_type OWNER TO supabase_auth_admin;

--
-- Name: oauth_authorization_status; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_authorization_status AS ENUM (
    'pending',
    'approved',
    'denied',
    'expired'
);


ALTER TYPE auth.oauth_authorization_status OWNER TO supabase_auth_admin;

--
-- Name: oauth_client_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_client_type AS ENUM (
    'public',
    'confidential'
);


ALTER TYPE auth.oauth_client_type OWNER TO supabase_auth_admin;

--
-- Name: oauth_registration_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_registration_type AS ENUM (
    'dynamic',
    'manual'
);


ALTER TYPE auth.oauth_registration_type OWNER TO supabase_auth_admin;

--
-- Name: oauth_response_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_response_type AS ENUM (
    'code'
);


ALTER TYPE auth.oauth_response_type OWNER TO supabase_auth_admin;

--
-- Name: one_time_token_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.one_time_token_type AS ENUM (
    'confirmation_token',
    'reauthentication_token',
    'recovery_token',
    'email_change_token_new',
    'email_change_token_current',
    'phone_change_token'
);


ALTER TYPE auth.one_time_token_type OWNER TO supabase_auth_admin;

--
-- Name: aal_level; Type: TYPE; Schema: public; Owner: supabase_admin
--

CREATE TYPE public.aal_level AS ENUM (
    'aal1',
    'aal2',
    'aal3'
);


ALTER TYPE public.aal_level OWNER TO supabase_admin;

--
-- Name: factor_status; Type: TYPE; Schema: public; Owner: supabase_admin
--

CREATE TYPE public.factor_status AS ENUM (
    'unverified',
    'verified'
);


ALTER TYPE public.factor_status OWNER TO supabase_admin;

--
-- Name: factor_type; Type: TYPE; Schema: public; Owner: supabase_admin
--

CREATE TYPE public.factor_type AS ENUM (
    'totp',
    'webauthn'
);


ALTER TYPE public.factor_type OWNER TO supabase_admin;

--
-- Name: action; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.action AS ENUM (
    'INSERT',
    'UPDATE',
    'DELETE',
    'TRUNCATE',
    'ERROR'
);


ALTER TYPE realtime.action OWNER TO supabase_admin;

--
-- Name: equality_op; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.equality_op AS ENUM (
    'eq',
    'neq',
    'lt',
    'lte',
    'gt',
    'gte',
    'in'
);


ALTER TYPE realtime.equality_op OWNER TO supabase_admin;

--
-- Name: user_defined_filter; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.user_defined_filter AS (
	column_name text,
	op realtime.equality_op,
	value text
);


ALTER TYPE realtime.user_defined_filter OWNER TO supabase_admin;

--
-- Name: wal_column; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_column AS (
	name text,
	type_name text,
	type_oid oid,
	value jsonb,
	is_pkey boolean,
	is_selectable boolean
);


ALTER TYPE realtime.wal_column OWNER TO supabase_admin;

--
-- Name: wal_rls; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_rls AS (
	wal jsonb,
	is_rls_enabled boolean,
	subscription_ids uuid[],
	errors text[]
);


ALTER TYPE realtime.wal_rls OWNER TO supabase_admin;

--
-- Name: buckettype; Type: TYPE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TYPE storage.buckettype AS ENUM (
    'STANDARD',
    'ANALYTICS',
    'VECTOR'
);


ALTER TYPE storage.buckettype OWNER TO supabase_storage_admin;

--
-- Name: email(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.email() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.email', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'email')
  )::text
$$;


ALTER FUNCTION auth.email() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION email(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.email() IS 'Deprecated. Use auth.jwt() -> ''email'' instead.';


--
-- Name: jwt(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.jwt() RETURNS jsonb
    LANGUAGE sql STABLE
    AS $$
  select 
    coalesce(
        nullif(current_setting('request.jwt.claim', true), ''),
        nullif(current_setting('request.jwt.claims', true), '')
    )::jsonb
$$;


ALTER FUNCTION auth.jwt() OWNER TO supabase_auth_admin;

--
-- Name: role(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.role() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.role', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'role')
  )::text
$$;


ALTER FUNCTION auth.role() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION role(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.role() IS 'Deprecated. Use auth.jwt() -> ''role'' instead.';


--
-- Name: uid(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.uid() RETURNS uuid
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.sub', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'sub')
  )::uuid
$$;


ALTER FUNCTION auth.uid() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION uid(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.uid() IS 'Deprecated. Use auth.jwt() -> ''sub'' instead.';


--
-- Name: grant_pg_cron_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_cron_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_cron'
  )
  THEN
    grant usage on schema cron to postgres with grant option;

    alter default privileges in schema cron grant all on tables to postgres with grant option;
    alter default privileges in schema cron grant all on functions to postgres with grant option;
    alter default privileges in schema cron grant all on sequences to postgres with grant option;

    alter default privileges for user supabase_admin in schema cron grant all
        on sequences to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on tables to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on functions to postgres with grant option;

    grant all privileges on all tables in schema cron to postgres with grant option;
    revoke all on table cron.job from postgres;
    grant select on table cron.job to postgres with grant option;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_cron_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_cron_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_cron_access() IS 'Grants access to pg_cron';


--
-- Name: grant_pg_graphql_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_graphql_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
DECLARE
    func_is_graphql_resolve bool;
BEGIN
    func_is_graphql_resolve = (
        SELECT n.proname = 'resolve'
        FROM pg_event_trigger_ddl_commands() AS ev
        LEFT JOIN pg_catalog.pg_proc AS n
        ON ev.objid = n.oid
    );

    IF func_is_graphql_resolve
    THEN
        -- Update public wrapper to pass all arguments through to the pg_graphql resolve func
        DROP FUNCTION IF EXISTS graphql_public.graphql;
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language sql
        as $$
            select graphql.resolve(
                query := query,
                variables := coalesce(variables, '{}'),
                "operationName" := "operationName",
                extensions := extensions
            );
        $$;

        -- This hook executes when `graphql.resolve` is created. That is not necessarily the last
        -- function in the extension so we need to grant permissions on existing entities AND
        -- update default permissions to any others that are created after `graphql.resolve`
        grant usage on schema graphql to postgres, anon, authenticated, service_role;
        grant select on all tables in schema graphql to postgres, anon, authenticated, service_role;
        grant execute on all functions in schema graphql to postgres, anon, authenticated, service_role;
        grant all on all sequences in schema graphql to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on tables to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on functions to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on sequences to postgres, anon, authenticated, service_role;

        -- Allow postgres role to allow granting usage on graphql and graphql_public schemas to custom roles
        grant usage on schema graphql_public to postgres with grant option;
        grant usage on schema graphql to postgres with grant option;
    END IF;

END;
$_$;


ALTER FUNCTION extensions.grant_pg_graphql_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_graphql_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_graphql_access() IS 'Grants access to pg_graphql';


--
-- Name: grant_pg_net_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_net_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_net'
  )
  THEN
    GRANT USAGE ON SCHEMA net TO supabase_functions_admin, postgres, anon, authenticated, service_role;

    ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;
    ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;

    ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;
    ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;

    REVOKE ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;
    REVOKE ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;

    GRANT EXECUTE ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
    GRANT EXECUTE ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_net_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_net_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_net_access() IS 'Grants access to pg_net';


--
-- Name: pgrst_ddl_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_ddl_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  cmd record;
BEGIN
  FOR cmd IN SELECT * FROM pg_event_trigger_ddl_commands()
  LOOP
    IF cmd.command_tag IN (
      'CREATE SCHEMA', 'ALTER SCHEMA'
    , 'CREATE TABLE', 'CREATE TABLE AS', 'SELECT INTO', 'ALTER TABLE'
    , 'CREATE FOREIGN TABLE', 'ALTER FOREIGN TABLE'
    , 'CREATE VIEW', 'ALTER VIEW'
    , 'CREATE MATERIALIZED VIEW', 'ALTER MATERIALIZED VIEW'
    , 'CREATE FUNCTION', 'ALTER FUNCTION'
    , 'CREATE TRIGGER'
    , 'CREATE TYPE', 'ALTER TYPE'
    , 'CREATE RULE'
    , 'COMMENT'
    )
    -- don't notify in case of CREATE TEMP table or other objects created on pg_temp
    AND cmd.schema_name is distinct from 'pg_temp'
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_ddl_watch() OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_drop_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  obj record;
BEGIN
  FOR obj IN SELECT * FROM pg_event_trigger_dropped_objects()
  LOOP
    IF obj.object_type IN (
      'schema'
    , 'table'
    , 'foreign table'
    , 'view'
    , 'materialized view'
    , 'function'
    , 'trigger'
    , 'type'
    , 'rule'
    )
    AND obj.is_temporary IS false -- no pg_temp objects
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_drop_watch() OWNER TO supabase_admin;

--
-- Name: set_graphql_placeholder(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.set_graphql_placeholder() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
    DECLARE
    graphql_is_dropped bool;
    BEGIN
    graphql_is_dropped = (
        SELECT ev.schema_name = 'graphql_public'
        FROM pg_event_trigger_dropped_objects() AS ev
        WHERE ev.schema_name = 'graphql_public'
    );

    IF graphql_is_dropped
    THEN
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language plpgsql
        as $$
            DECLARE
                server_version float;
            BEGIN
                server_version = (SELECT (SPLIT_PART((select version()), ' ', 2))::float);

                IF server_version >= 14 THEN
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql extension is not enabled.'
                            )
                        )
                    );
                ELSE
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql is only available on projects running Postgres 14 onwards.'
                            )
                        )
                    );
                END IF;
            END;
        $$;
    END IF;

    END;
$_$;


ALTER FUNCTION extensions.set_graphql_placeholder() OWNER TO supabase_admin;

--
-- Name: FUNCTION set_graphql_placeholder(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.set_graphql_placeholder() IS 'Reintroduces placeholder function for graphql_public.graphql';


--
-- Name: get_auth(text); Type: FUNCTION; Schema: pgbouncer; Owner: supabase_admin
--

CREATE FUNCTION pgbouncer.get_auth(p_usename text) RETURNS TABLE(username text, password text)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO ''
    AS $_$
begin
    raise debug 'PgBouncer auth request: %', p_usename;

    return query
    select 
        rolname::text, 
        case when rolvaliduntil < now() 
            then null 
            else rolpassword::text 
        end 
    from pg_authid 
    where rolname=$1 and rolcanlogin;
end;
$_$;


ALTER FUNCTION pgbouncer.get_auth(p_usename text) OWNER TO supabase_admin;

--
-- Name: apply_rls(jsonb, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer DEFAULT (1024 * 1024)) RETURNS SETOF realtime.wal_rls
    LANGUAGE plpgsql
    AS $$
declare
-- Regclass of the table e.g. public.notes
entity_ regclass = (quote_ident(wal ->> 'schema') || '.' || quote_ident(wal ->> 'table'))::regclass;

-- I, U, D, T: insert, update ...
action realtime.action = (
    case wal ->> 'action'
        when 'I' then 'INSERT'
        when 'U' then 'UPDATE'
        when 'D' then 'DELETE'
        else 'ERROR'
    end
);

-- Is row level security enabled for the table
is_rls_enabled bool = relrowsecurity from pg_class where oid = entity_;

subscriptions realtime.subscription[] = array_agg(subs)
    from
        realtime.subscription subs
    where
        subs.entity = entity_;

-- Subscription vars
roles regrole[] = array_agg(distinct us.claims_role::text)
    from
        unnest(subscriptions) us;

working_role regrole;
claimed_role regrole;
claims jsonb;

subscription_id uuid;
subscription_has_access bool;
visible_to_subscription_ids uuid[] = '{}';

-- structured info for wal's columns
columns realtime.wal_column[];
-- previous identity values for update/delete
old_columns realtime.wal_column[];

error_record_exceeds_max_size boolean = octet_length(wal::text) > max_record_bytes;

-- Primary jsonb output for record
output jsonb;

begin
perform set_config('role', null, true);

columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'columns') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

old_columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'identity') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

for working_role in select * from unnest(roles) loop

    -- Update `is_selectable` for columns and old_columns
    columns =
        array_agg(
            (
                c.name,
                c.type_name,
                c.type_oid,
                c.value,
                c.is_pkey,
                pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
            )::realtime.wal_column
        )
        from
            unnest(columns) c;

    old_columns =
            array_agg(
                (
                    c.name,
                    c.type_name,
                    c.type_oid,
                    c.value,
                    c.is_pkey,
                    pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
                )::realtime.wal_column
            )
            from
                unnest(old_columns) c;

    if action <> 'DELETE' and count(1) = 0 from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            -- subscriptions is already filtered by entity
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 400: Bad Request, no primary key']
        )::realtime.wal_rls;

    -- The claims role does not have SELECT permission to the primary key of entity
    elsif action <> 'DELETE' and sum(c.is_selectable::int) <> count(1) from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 401: Unauthorized']
        )::realtime.wal_rls;

    else
        output = jsonb_build_object(
            'schema', wal ->> 'schema',
            'table', wal ->> 'table',
            'type', action,
            'commit_timestamp', to_char(
                ((wal ->> 'timestamp')::timestamptz at time zone 'utc'),
                'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"'
            ),
            'columns', (
                select
                    jsonb_agg(
                        jsonb_build_object(
                            'name', pa.attname,
                            'type', pt.typname
                        )
                        order by pa.attnum asc
                    )
                from
                    pg_attribute pa
                    join pg_type pt
                        on pa.atttypid = pt.oid
                where
                    attrelid = entity_
                    and attnum > 0
                    and pg_catalog.has_column_privilege(working_role, entity_, pa.attname, 'SELECT')
            )
        )
        -- Add "record" key for insert and update
        || case
            when action in ('INSERT', 'UPDATE') then
                jsonb_build_object(
                    'record',
                    (
                        select
                            jsonb_object_agg(
                                -- if unchanged toast, get column name and value from old record
                                coalesce((c).name, (oc).name),
                                case
                                    when (c).name is null then (oc).value
                                    else (c).value
                                end
                            )
                        from
                            unnest(columns) c
                            full outer join unnest(old_columns) oc
                                on (c).name = (oc).name
                        where
                            coalesce((c).is_selectable, (oc).is_selectable)
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                    )
                )
            else '{}'::jsonb
        end
        -- Add "old_record" key for update and delete
        || case
            when action = 'UPDATE' then
                jsonb_build_object(
                        'old_record',
                        (
                            select jsonb_object_agg((c).name, (c).value)
                            from unnest(old_columns) c
                            where
                                (c).is_selectable
                                and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                        )
                    )
            when action = 'DELETE' then
                jsonb_build_object(
                    'old_record',
                    (
                        select jsonb_object_agg((c).name, (c).value)
                        from unnest(old_columns) c
                        where
                            (c).is_selectable
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                            and ( not is_rls_enabled or (c).is_pkey ) -- if RLS enabled, we can't secure deletes so filter to pkey
                    )
                )
            else '{}'::jsonb
        end;

        -- Create the prepared statement
        if is_rls_enabled and action <> 'DELETE' then
            if (select 1 from pg_prepared_statements where name = 'walrus_rls_stmt' limit 1) > 0 then
                deallocate walrus_rls_stmt;
            end if;
            execute realtime.build_prepared_statement_sql('walrus_rls_stmt', entity_, columns);
        end if;

        visible_to_subscription_ids = '{}';

        for subscription_id, claims in (
                select
                    subs.subscription_id,
                    subs.claims
                from
                    unnest(subscriptions) subs
                where
                    subs.entity = entity_
                    and subs.claims_role = working_role
                    and (
                        realtime.is_visible_through_filters(columns, subs.filters)
                        or (
                          action = 'DELETE'
                          and realtime.is_visible_through_filters(old_columns, subs.filters)
                        )
                    )
        ) loop

            if not is_rls_enabled or action = 'DELETE' then
                visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
            else
                -- Check if RLS allows the role to see the record
                perform
                    -- Trim leading and trailing quotes from working_role because set_config
                    -- doesn't recognize the role as valid if they are included
                    set_config('role', trim(both '"' from working_role::text), true),
                    set_config('request.jwt.claims', claims::text, true);

                execute 'execute walrus_rls_stmt' into subscription_has_access;

                if subscription_has_access then
                    visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
                end if;
            end if;
        end loop;

        perform set_config('role', null, true);

        return next (
            output,
            is_rls_enabled,
            visible_to_subscription_ids,
            case
                when error_record_exceeds_max_size then array['Error 413: Payload Too Large']
                else '{}'
            end
        )::realtime.wal_rls;

    end if;
end loop;

perform set_config('role', null, true);
end;
$$;


ALTER FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: broadcast_changes(text, text, text, text, text, record, record, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text DEFAULT 'ROW'::text) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    -- Declare a variable to hold the JSONB representation of the row
    row_data jsonb := '{}'::jsonb;
BEGIN
    IF level = 'STATEMENT' THEN
        RAISE EXCEPTION 'function can only be triggered for each row, not for each statement';
    END IF;
    -- Check the operation type and handle accordingly
    IF operation = 'INSERT' OR operation = 'UPDATE' OR operation = 'DELETE' THEN
        row_data := jsonb_build_object('old_record', OLD, 'record', NEW, 'operation', operation, 'table', table_name, 'schema', table_schema);
        PERFORM realtime.send (row_data, event_name, topic_name);
    ELSE
        RAISE EXCEPTION 'Unexpected operation type: %', operation;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'Failed to process the row: %', SQLERRM;
END;

$$;


ALTER FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) OWNER TO supabase_admin;

--
-- Name: build_prepared_statement_sql(text, regclass, realtime.wal_column[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) RETURNS text
    LANGUAGE sql
    AS $$
      /*
      Builds a sql string that, if executed, creates a prepared statement to
      tests retrive a row from *entity* by its primary key columns.
      Example
          select realtime.build_prepared_statement_sql('public.notes', '{"id"}'::text[], '{"bigint"}'::text[])
      */
          select
      'prepare ' || prepared_statement_name || ' as
          select
              exists(
                  select
                      1
                  from
                      ' || entity || '
                  where
                      ' || string_agg(quote_ident(pkc.name) || '=' || quote_nullable(pkc.value #>> '{}') , ' and ') || '
              )'
          from
              unnest(columns) pkc
          where
              pkc.is_pkey
          group by
              entity
      $$;


ALTER FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) OWNER TO supabase_admin;

--
-- Name: cast(text, regtype); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime."cast"(val text, type_ regtype) RETURNS jsonb
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    declare
      res jsonb;
    begin
      execute format('select to_jsonb(%L::'|| type_::text || ')', val)  into res;
      return res;
    end
    $$;


ALTER FUNCTION realtime."cast"(val text, type_ regtype) OWNER TO supabase_admin;

--
-- Name: check_equality_op(realtime.equality_op, regtype, text, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) RETURNS boolean
    LANGUAGE plpgsql IMMUTABLE
    AS $$
      /*
      Casts *val_1* and *val_2* as type *type_* and check the *op* condition for truthiness
      */
      declare
          op_symbol text = (
              case
                  when op = 'eq' then '='
                  when op = 'neq' then '!='
                  when op = 'lt' then '<'
                  when op = 'lte' then '<='
                  when op = 'gt' then '>'
                  when op = 'gte' then '>='
                  when op = 'in' then '= any'
                  else 'UNKNOWN OP'
              end
          );
          res boolean;
      begin
          execute format(
              'select %L::'|| type_::text || ' ' || op_symbol
              || ' ( %L::'
              || (
                  case
                      when op = 'in' then type_::text || '[]'
                      else type_::text end
              )
              || ')', val_1, val_2) into res;
          return res;
      end;
      $$;


ALTER FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) OWNER TO supabase_admin;

--
-- Name: is_visible_through_filters(realtime.wal_column[], realtime.user_defined_filter[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$
    /*
    Should the record be visible (true) or filtered out (false) after *filters* are applied
    */
        select
            -- Default to allowed when no filters present
            $2 is null -- no filters. this should not happen because subscriptions has a default
            or array_length($2, 1) is null -- array length of an empty array is null
            or bool_and(
                coalesce(
                    realtime.check_equality_op(
                        op:=f.op,
                        type_:=coalesce(
                            col.type_oid::regtype, -- null when wal2json version <= 2.4
                            col.type_name::regtype
                        ),
                        -- cast jsonb to text
                        val_1:=col.value #>> '{}',
                        val_2:=f.value
                    ),
                    false -- if null, filter does not match
                )
            )
        from
            unnest(filters) f
            join unnest(columns) col
                on f.column_name = col.name;
    $_$;


ALTER FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) OWNER TO supabase_admin;

--
-- Name: list_changes(name, name, integer, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) RETURNS SETOF realtime.wal_rls
    LANGUAGE sql
    SET log_min_messages TO 'fatal'
    AS $$
      with pub as (
        select
          concat_ws(
            ',',
            case when bool_or(pubinsert) then 'insert' else null end,
            case when bool_or(pubupdate) then 'update' else null end,
            case when bool_or(pubdelete) then 'delete' else null end
          ) as w2j_actions,
          coalesce(
            string_agg(
              realtime.quote_wal2json(format('%I.%I', schemaname, tablename)::regclass),
              ','
            ) filter (where ppt.tablename is not null and ppt.tablename not like '% %'),
            ''
          ) w2j_add_tables
        from
          pg_publication pp
          left join pg_publication_tables ppt
            on pp.pubname = ppt.pubname
        where
          pp.pubname = publication
        group by
          pp.pubname
        limit 1
      ),
      w2j as (
        select
          x.*, pub.w2j_add_tables
        from
          pub,
          pg_logical_slot_get_changes(
            slot_name, null, max_changes,
            'include-pk', 'true',
            'include-transaction', 'false',
            'include-timestamp', 'true',
            'include-type-oids', 'true',
            'format-version', '2',
            'actions', pub.w2j_actions,
            'add-tables', pub.w2j_add_tables
          ) x
      )
      select
        xyz.wal,
        xyz.is_rls_enabled,
        xyz.subscription_ids,
        xyz.errors
      from
        w2j,
        realtime.apply_rls(
          wal := w2j.data::jsonb,
          max_record_bytes := max_record_bytes
        ) xyz(wal, is_rls_enabled, subscription_ids, errors)
      where
        w2j.w2j_add_tables <> ''
        and xyz.subscription_ids[1] is not null
    $$;


ALTER FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: quote_wal2json(regclass); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.quote_wal2json(entity regclass) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
      select
        (
          select string_agg('' || ch,'')
          from unnest(string_to_array(nsp.nspname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
        )
        || '.'
        || (
          select string_agg('' || ch,'')
          from unnest(string_to_array(pc.relname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
          )
      from
        pg_class pc
        join pg_namespace nsp
          on pc.relnamespace = nsp.oid
      where
        pc.oid = entity
    $$;


ALTER FUNCTION realtime.quote_wal2json(entity regclass) OWNER TO supabase_admin;

--
-- Name: send(jsonb, text, text, boolean); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  generated_id uuid;
  final_payload jsonb;
BEGIN
  BEGIN
    -- Generate a new UUID for the id
    generated_id := gen_random_uuid();

    -- Check if payload has an 'id' key, if not, add the generated UUID
    IF payload ? 'id' THEN
      final_payload := payload;
    ELSE
      final_payload := jsonb_set(payload, '{id}', to_jsonb(generated_id));
    END IF;

    -- Set the topic configuration
    EXECUTE format('SET LOCAL realtime.topic TO %L', topic);

    -- Attempt to insert the message
    INSERT INTO realtime.messages (id, payload, event, topic, private, extension)
    VALUES (generated_id, final_payload, event, topic, private, 'broadcast');
  EXCEPTION
    WHEN OTHERS THEN
      -- Capture and notify the error
      RAISE WARNING 'ErrorSendingBroadcastMessage: %', SQLERRM;
  END;
END;
$$;


ALTER FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) OWNER TO supabase_admin;

--
-- Name: subscription_check_filters(); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.subscription_check_filters() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    /*
    Validates that the user defined filters for a subscription:
    - refer to valid columns that the claimed role may access
    - values are coercable to the correct column type
    */
    declare
        col_names text[] = coalesce(
                array_agg(c.column_name order by c.ordinal_position),
                '{}'::text[]
            )
            from
                information_schema.columns c
            where
                format('%I.%I', c.table_schema, c.table_name)::regclass = new.entity
                and pg_catalog.has_column_privilege(
                    (new.claims ->> 'role'),
                    format('%I.%I', c.table_schema, c.table_name)::regclass,
                    c.column_name,
                    'SELECT'
                );
        filter realtime.user_defined_filter;
        col_type regtype;

        in_val jsonb;
    begin
        for filter in select * from unnest(new.filters) loop
            -- Filtered column is valid
            if not filter.column_name = any(col_names) then
                raise exception 'invalid column for filter %', filter.column_name;
            end if;

            -- Type is sanitized and safe for string interpolation
            col_type = (
                select atttypid::regtype
                from pg_catalog.pg_attribute
                where attrelid = new.entity
                      and attname = filter.column_name
            );
            if col_type is null then
                raise exception 'failed to lookup type for column %', filter.column_name;
            end if;

            -- Set maximum number of entries for in filter
            if filter.op = 'in'::realtime.equality_op then
                in_val = realtime.cast(filter.value, (col_type::text || '[]')::regtype);
                if coalesce(jsonb_array_length(in_val), 0) > 100 then
                    raise exception 'too many values for `in` filter. Maximum 100';
                end if;
            else
                -- raises an exception if value is not coercable to type
                perform realtime.cast(filter.value, col_type);
            end if;

        end loop;

        -- Apply consistent order to filters so the unique constraint on
        -- (subscription_id, entity, filters) can't be tricked by a different filter order
        new.filters = coalesce(
            array_agg(f order by f.column_name, f.op, f.value),
            '{}'
        ) from unnest(new.filters) f;

        return new;
    end;
    $$;


ALTER FUNCTION realtime.subscription_check_filters() OWNER TO supabase_admin;

--
-- Name: to_regrole(text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.to_regrole(role_name text) RETURNS regrole
    LANGUAGE sql IMMUTABLE
    AS $$ select role_name::regrole $$;


ALTER FUNCTION realtime.to_regrole(role_name text) OWNER TO supabase_admin;

--
-- Name: topic(); Type: FUNCTION; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE FUNCTION realtime.topic() RETURNS text
    LANGUAGE sql STABLE
    AS $$
select nullif(current_setting('realtime.topic', true), '')::text;
$$;


ALTER FUNCTION realtime.topic() OWNER TO supabase_realtime_admin;

--
-- Name: add_prefixes(text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.add_prefixes(_bucket_id text, _name text) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    prefixes text[];
BEGIN
    prefixes := "storage"."get_prefixes"("_name");

    IF array_length(prefixes, 1) > 0 THEN
        INSERT INTO storage.prefixes (name, bucket_id)
        SELECT UNNEST(prefixes) as name, "_bucket_id" ON CONFLICT DO NOTHING;
    END IF;
END;
$$;


ALTER FUNCTION storage.add_prefixes(_bucket_id text, _name text) OWNER TO supabase_storage_admin;

--
-- Name: can_insert_object(text, text, uuid, jsonb); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO "storage"."objects" ("bucket_id", "name", "owner", "metadata") VALUES (bucketid, name, owner, metadata);
  -- hack to rollback the successful insert
  RAISE sqlstate 'PT200' using
  message = 'ROLLBACK',
  detail = 'rollback successful insert';
END
$$;


ALTER FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) OWNER TO supabase_storage_admin;

--
-- Name: delete_leaf_prefixes(text[], text[]); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.delete_leaf_prefixes(bucket_ids text[], names text[]) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    v_rows_deleted integer;
BEGIN
    LOOP
        WITH candidates AS (
            SELECT DISTINCT
                t.bucket_id,
                unnest(storage.get_prefixes(t.name)) AS name
            FROM unnest(bucket_ids, names) AS t(bucket_id, name)
        ),
        uniq AS (
             SELECT
                 bucket_id,
                 name,
                 storage.get_level(name) AS level
             FROM candidates
             WHERE name <> ''
             GROUP BY bucket_id, name
        ),
        leaf AS (
             SELECT
                 p.bucket_id,
                 p.name,
                 p.level
             FROM storage.prefixes AS p
                  JOIN uniq AS u
                       ON u.bucket_id = p.bucket_id
                           AND u.name = p.name
                           AND u.level = p.level
             WHERE NOT EXISTS (
                 SELECT 1
                 FROM storage.objects AS o
                 WHERE o.bucket_id = p.bucket_id
                   AND o.level = p.level + 1
                   AND o.name COLLATE "C" LIKE p.name || '/%'
             )
             AND NOT EXISTS (
                 SELECT 1
                 FROM storage.prefixes AS c
                 WHERE c.bucket_id = p.bucket_id
                   AND c.level = p.level + 1
                   AND c.name COLLATE "C" LIKE p.name || '/%'
             )
        )
        DELETE
        FROM storage.prefixes AS p
            USING leaf AS l
        WHERE p.bucket_id = l.bucket_id
          AND p.name = l.name
          AND p.level = l.level;

        GET DIAGNOSTICS v_rows_deleted = ROW_COUNT;
        EXIT WHEN v_rows_deleted = 0;
    END LOOP;
END;
$$;


ALTER FUNCTION storage.delete_leaf_prefixes(bucket_ids text[], names text[]) OWNER TO supabase_storage_admin;

--
-- Name: delete_prefix(text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.delete_prefix(_bucket_id text, _name text) RETURNS boolean
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN
    -- Check if we can delete the prefix
    IF EXISTS(
        SELECT FROM "storage"."prefixes"
        WHERE "prefixes"."bucket_id" = "_bucket_id"
          AND level = "storage"."get_level"("_name") + 1
          AND "prefixes"."name" COLLATE "C" LIKE "_name" || '/%'
        LIMIT 1
    )
    OR EXISTS(
        SELECT FROM "storage"."objects"
        WHERE "objects"."bucket_id" = "_bucket_id"
          AND "storage"."get_level"("objects"."name") = "storage"."get_level"("_name") + 1
          AND "objects"."name" COLLATE "C" LIKE "_name" || '/%'
        LIMIT 1
    ) THEN
    -- There are sub-objects, skip deletion
    RETURN false;
    ELSE
        DELETE FROM "storage"."prefixes"
        WHERE "prefixes"."bucket_id" = "_bucket_id"
          AND level = "storage"."get_level"("_name")
          AND "prefixes"."name" = "_name";
        RETURN true;
    END IF;
END;
$$;


ALTER FUNCTION storage.delete_prefix(_bucket_id text, _name text) OWNER TO supabase_storage_admin;

--
-- Name: delete_prefix_hierarchy_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.delete_prefix_hierarchy_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    prefix text;
BEGIN
    prefix := "storage"."get_prefix"(OLD."name");

    IF coalesce(prefix, '') != '' THEN
        PERFORM "storage"."delete_prefix"(OLD."bucket_id", prefix);
    END IF;

    RETURN OLD;
END;
$$;


ALTER FUNCTION storage.delete_prefix_hierarchy_trigger() OWNER TO supabase_storage_admin;

--
-- Name: enforce_bucket_name_length(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.enforce_bucket_name_length() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
    if length(new.name) > 100 then
        raise exception 'bucket name "%" is too long (% characters). Max is 100.', new.name, length(new.name);
    end if;
    return new;
end;
$$;


ALTER FUNCTION storage.enforce_bucket_name_length() OWNER TO supabase_storage_admin;

--
-- Name: extension(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.extension(name text) RETURNS text
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE
    _parts text[];
    _filename text;
BEGIN
    SELECT string_to_array(name, '/') INTO _parts;
    SELECT _parts[array_length(_parts,1)] INTO _filename;
    RETURN reverse(split_part(reverse(_filename), '.', 1));
END
$$;


ALTER FUNCTION storage.extension(name text) OWNER TO supabase_storage_admin;

--
-- Name: filename(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.filename(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
	select string_to_array(name, '/') into _parts;
	return _parts[array_length(_parts,1)];
END
$$;


ALTER FUNCTION storage.filename(name text) OWNER TO supabase_storage_admin;

--
-- Name: foldername(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.foldername(name text) RETURNS text[]
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE
    _parts text[];
BEGIN
    -- Split on "/" to get path segments
    SELECT string_to_array(name, '/') INTO _parts;
    -- Return everything except the last segment
    RETURN _parts[1 : array_length(_parts,1) - 1];
END
$$;


ALTER FUNCTION storage.foldername(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_level(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_level(name text) RETURNS integer
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
SELECT array_length(string_to_array("name", '/'), 1);
$$;


ALTER FUNCTION storage.get_level(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_prefix(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_prefix(name text) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
SELECT
    CASE WHEN strpos("name", '/') > 0 THEN
             regexp_replace("name", '[\/]{1}[^\/]+\/?$', '')
         ELSE
             ''
        END;
$_$;


ALTER FUNCTION storage.get_prefix(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_prefixes(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_prefixes(name text) RETURNS text[]
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $$
DECLARE
    parts text[];
    prefixes text[];
    prefix text;
BEGIN
    -- Split the name into parts by '/'
    parts := string_to_array("name", '/');
    prefixes := '{}';

    -- Construct the prefixes, stopping one level below the last part
    FOR i IN 1..array_length(parts, 1) - 1 LOOP
            prefix := array_to_string(parts[1:i], '/');
            prefixes := array_append(prefixes, prefix);
    END LOOP;

    RETURN prefixes;
END;
$$;


ALTER FUNCTION storage.get_prefixes(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_size_by_bucket(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_size_by_bucket() RETURNS TABLE(size bigint, bucket_id text)
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    return query
        select sum((metadata->>'size')::bigint) as size, obj.bucket_id
        from "storage".objects as obj
        group by obj.bucket_id;
END
$$;


ALTER FUNCTION storage.get_size_by_bucket() OWNER TO supabase_storage_admin;

--
-- Name: list_multipart_uploads_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, next_key_token text DEFAULT ''::text, next_upload_token text DEFAULT ''::text) RETURNS TABLE(key text, id text, created_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(key COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                        substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1)))
                    ELSE
                        key
                END AS key, id, created_at
            FROM
                storage.s3_multipart_uploads
            WHERE
                bucket_id = $5 AND
                key ILIKE $1 || ''%'' AND
                CASE
                    WHEN $4 != '''' AND $6 = '''' THEN
                        CASE
                            WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                                substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                key COLLATE "C" > $4
                            END
                    ELSE
                        true
                END AND
                CASE
                    WHEN $6 != '''' THEN
                        id COLLATE "C" > $6
                    ELSE
                        true
                    END
            ORDER BY
                key COLLATE "C" ASC, created_at ASC) as e order by key COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_key_token, bucket_id, next_upload_token;
END;
$_$;


ALTER FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, next_key_token text, next_upload_token text) OWNER TO supabase_storage_admin;

--
-- Name: list_objects_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, start_after text DEFAULT ''::text, next_token text DEFAULT ''::text) RETURNS TABLE(name text, id uuid, metadata jsonb, updated_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(name COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                        substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1)))
                    ELSE
                        name
                END AS name, id, metadata, updated_at
            FROM
                storage.objects
            WHERE
                bucket_id = $5 AND
                name ILIKE $1 || ''%'' AND
                CASE
                    WHEN $6 != '''' THEN
                    name COLLATE "C" > $6
                ELSE true END
                AND CASE
                    WHEN $4 != '''' THEN
                        CASE
                            WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                                substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                name COLLATE "C" > $4
                            END
                    ELSE
                        true
                END
            ORDER BY
                name COLLATE "C" ASC) as e order by name COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_token, bucket_id, start_after;
END;
$_$;


ALTER FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, start_after text, next_token text) OWNER TO supabase_storage_admin;

--
-- Name: lock_top_prefixes(text[], text[]); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.lock_top_prefixes(bucket_ids text[], names text[]) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    v_bucket text;
    v_top text;
BEGIN
    FOR v_bucket, v_top IN
        SELECT DISTINCT t.bucket_id,
            split_part(t.name, '/', 1) AS top
        FROM unnest(bucket_ids, names) AS t(bucket_id, name)
        WHERE t.name <> ''
        ORDER BY 1, 2
        LOOP
            PERFORM pg_advisory_xact_lock(hashtextextended(v_bucket || '/' || v_top, 0));
        END LOOP;
END;
$$;


ALTER FUNCTION storage.lock_top_prefixes(bucket_ids text[], names text[]) OWNER TO supabase_storage_admin;

--
-- Name: objects_delete_cleanup(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.objects_delete_cleanup() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    v_bucket_ids text[];
    v_names      text[];
BEGIN
    IF current_setting('storage.gc.prefixes', true) = '1' THEN
        RETURN NULL;
    END IF;

    PERFORM set_config('storage.gc.prefixes', '1', true);

    SELECT COALESCE(array_agg(d.bucket_id), '{}'),
           COALESCE(array_agg(d.name), '{}')
    INTO v_bucket_ids, v_names
    FROM deleted AS d
    WHERE d.name <> '';

    PERFORM storage.lock_top_prefixes(v_bucket_ids, v_names);
    PERFORM storage.delete_leaf_prefixes(v_bucket_ids, v_names);

    RETURN NULL;
END;
$$;


ALTER FUNCTION storage.objects_delete_cleanup() OWNER TO supabase_storage_admin;

--
-- Name: objects_insert_prefix_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.objects_insert_prefix_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    PERFORM "storage"."add_prefixes"(NEW."bucket_id", NEW."name");
    NEW.level := "storage"."get_level"(NEW."name");

    RETURN NEW;
END;
$$;


ALTER FUNCTION storage.objects_insert_prefix_trigger() OWNER TO supabase_storage_admin;

--
-- Name: objects_update_cleanup(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.objects_update_cleanup() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    -- NEW - OLD (destinations to create prefixes for)
    v_add_bucket_ids text[];
    v_add_names      text[];

    -- OLD - NEW (sources to prune)
    v_src_bucket_ids text[];
    v_src_names      text[];
BEGIN
    IF TG_OP <> 'UPDATE' THEN
        RETURN NULL;
    END IF;

    -- 1) Compute NEWÔêÆOLD (added paths) and OLDÔêÆNEW (moved-away paths)
    WITH added AS (
        SELECT n.bucket_id, n.name
        FROM new_rows n
        WHERE n.name <> '' AND position('/' in n.name) > 0
        EXCEPT
        SELECT o.bucket_id, o.name FROM old_rows o WHERE o.name <> ''
    ),
    moved AS (
         SELECT o.bucket_id, o.name
         FROM old_rows o
         WHERE o.name <> ''
         EXCEPT
         SELECT n.bucket_id, n.name FROM new_rows n WHERE n.name <> ''
    )
    SELECT
        -- arrays for ADDED (dest) in stable order
        COALESCE( (SELECT array_agg(a.bucket_id ORDER BY a.bucket_id, a.name) FROM added a), '{}' ),
        COALESCE( (SELECT array_agg(a.name      ORDER BY a.bucket_id, a.name) FROM added a), '{}' ),
        -- arrays for MOVED (src) in stable order
        COALESCE( (SELECT array_agg(m.bucket_id ORDER BY m.bucket_id, m.name) FROM moved m), '{}' ),
        COALESCE( (SELECT array_agg(m.name      ORDER BY m.bucket_id, m.name) FROM moved m), '{}' )
    INTO v_add_bucket_ids, v_add_names, v_src_bucket_ids, v_src_names;

    -- Nothing to do?
    IF (array_length(v_add_bucket_ids, 1) IS NULL) AND (array_length(v_src_bucket_ids, 1) IS NULL) THEN
        RETURN NULL;
    END IF;

    -- 2) Take per-(bucket, top) locks: ALL prefixes in consistent global order to prevent deadlocks
    DECLARE
        v_all_bucket_ids text[];
        v_all_names text[];
    BEGIN
        -- Combine source and destination arrays for consistent lock ordering
        v_all_bucket_ids := COALESCE(v_src_bucket_ids, '{}') || COALESCE(v_add_bucket_ids, '{}');
        v_all_names := COALESCE(v_src_names, '{}') || COALESCE(v_add_names, '{}');

        -- Single lock call ensures consistent global ordering across all transactions
        IF array_length(v_all_bucket_ids, 1) IS NOT NULL THEN
            PERFORM storage.lock_top_prefixes(v_all_bucket_ids, v_all_names);
        END IF;
    END;

    -- 3) Create destination prefixes (NEWÔêÆOLD) BEFORE pruning sources
    IF array_length(v_add_bucket_ids, 1) IS NOT NULL THEN
        WITH candidates AS (
            SELECT DISTINCT t.bucket_id, unnest(storage.get_prefixes(t.name)) AS name
            FROM unnest(v_add_bucket_ids, v_add_names) AS t(bucket_id, name)
            WHERE name <> ''
        )
        INSERT INTO storage.prefixes (bucket_id, name)
        SELECT c.bucket_id, c.name
        FROM candidates c
        ON CONFLICT DO NOTHING;
    END IF;

    -- 4) Prune source prefixes bottom-up for OLDÔêÆNEW
    IF array_length(v_src_bucket_ids, 1) IS NOT NULL THEN
        -- re-entrancy guard so DELETE on prefixes won't recurse
        IF current_setting('storage.gc.prefixes', true) <> '1' THEN
            PERFORM set_config('storage.gc.prefixes', '1', true);
        END IF;

        PERFORM storage.delete_leaf_prefixes(v_src_bucket_ids, v_src_names);
    END IF;

    RETURN NULL;
END;
$$;


ALTER FUNCTION storage.objects_update_cleanup() OWNER TO supabase_storage_admin;

--
-- Name: objects_update_level_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.objects_update_level_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    -- Ensure this is an update operation and the name has changed
    IF TG_OP = 'UPDATE' AND (NEW."name" <> OLD."name" OR NEW."bucket_id" <> OLD."bucket_id") THEN
        -- Set the new level
        NEW."level" := "storage"."get_level"(NEW."name");
    END IF;
    RETURN NEW;
END;
$$;


ALTER FUNCTION storage.objects_update_level_trigger() OWNER TO supabase_storage_admin;

--
-- Name: objects_update_prefix_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.objects_update_prefix_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    old_prefixes TEXT[];
BEGIN
    -- Ensure this is an update operation and the name has changed
    IF TG_OP = 'UPDATE' AND (NEW."name" <> OLD."name" OR NEW."bucket_id" <> OLD."bucket_id") THEN
        -- Retrieve old prefixes
        old_prefixes := "storage"."get_prefixes"(OLD."name");

        -- Remove old prefixes that are only used by this object
        WITH all_prefixes as (
            SELECT unnest(old_prefixes) as prefix
        ),
        can_delete_prefixes as (
             SELECT prefix
             FROM all_prefixes
             WHERE NOT EXISTS (
                 SELECT 1 FROM "storage"."objects"
                 WHERE "bucket_id" = OLD."bucket_id"
                   AND "name" <> OLD."name"
                   AND "name" LIKE (prefix || '%')
             )
         )
        DELETE FROM "storage"."prefixes" WHERE name IN (SELECT prefix FROM can_delete_prefixes);

        -- Add new prefixes
        PERFORM "storage"."add_prefixes"(NEW."bucket_id", NEW."name");
    END IF;
    -- Set the new level
    NEW."level" := "storage"."get_level"(NEW."name");

    RETURN NEW;
END;
$$;


ALTER FUNCTION storage.objects_update_prefix_trigger() OWNER TO supabase_storage_admin;

--
-- Name: operation(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.operation() RETURNS text
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    RETURN current_setting('storage.operation', true);
END;
$$;


ALTER FUNCTION storage.operation() OWNER TO supabase_storage_admin;

--
-- Name: prefixes_delete_cleanup(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.prefixes_delete_cleanup() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    v_bucket_ids text[];
    v_names      text[];
BEGIN
    IF current_setting('storage.gc.prefixes', true) = '1' THEN
        RETURN NULL;
    END IF;

    PERFORM set_config('storage.gc.prefixes', '1', true);

    SELECT COALESCE(array_agg(d.bucket_id), '{}'),
           COALESCE(array_agg(d.name), '{}')
    INTO v_bucket_ids, v_names
    FROM deleted AS d
    WHERE d.name <> '';

    PERFORM storage.lock_top_prefixes(v_bucket_ids, v_names);
    PERFORM storage.delete_leaf_prefixes(v_bucket_ids, v_names);

    RETURN NULL;
END;
$$;


ALTER FUNCTION storage.prefixes_delete_cleanup() OWNER TO supabase_storage_admin;

--
-- Name: prefixes_insert_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.prefixes_insert_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    PERFORM "storage"."add_prefixes"(NEW."bucket_id", NEW."name");
    RETURN NEW;
END;
$$;


ALTER FUNCTION storage.prefixes_insert_trigger() OWNER TO supabase_storage_admin;

--
-- Name: search(text, text, integer, integer, integer); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql
    AS $$
BEGIN
	return query 
		with files_folders as (
			select path_tokens[levels] as folder
			from storage.objects
			where objects.name ilike prefix || '%'
			and bucket_id = bucketname
			GROUP by folder
			limit limits
			offset offsets
		) 
		select files_folders.folder as name, objects.id, objects.updated_at, objects.created_at, objects.last_accessed_at, objects.metadata from files_folders 
		left join storage.objects
		on prefix || files_folders.folder = objects.name and objects.bucket_id=bucketname;
END
$$;


ALTER FUNCTION storage.search(prefix text, bucketname text, limits integer, levels integer, offsets integer) OWNER TO supabase_storage_admin;

--
-- Name: search(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql
    AS $$
declare
    can_bypass_rls BOOLEAN;
begin
    SELECT rolbypassrls
    INTO can_bypass_rls
    FROM pg_roles
    WHERE rolname = coalesce(nullif(current_setting('role', true), 'none'), current_user);

    IF can_bypass_rls THEN
        RETURN QUERY SELECT * FROM storage.search_v1_optimised(prefix, bucketname, limits, levels, offsets, search, sortcolumn, sortorder);
    ELSE
        RETURN QUERY SELECT * FROM storage.search_legacy_v1(prefix, bucketname, limits, levels, offsets, search, sortcolumn, sortorder);
    END IF;
end;
$$;


ALTER FUNCTION storage.search(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- Name: search_legacy_v1(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_legacy_v1(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
declare
    v_order_by text;
    v_sort_order text;
begin
    case
        when sortcolumn = 'name' then
            v_order_by = 'name';
        when sortcolumn = 'updated_at' then
            v_order_by = 'updated_at';
        when sortcolumn = 'created_at' then
            v_order_by = 'created_at';
        when sortcolumn = 'last_accessed_at' then
            v_order_by = 'last_accessed_at';
        else
            v_order_by = 'name';
        end case;

    case
        when sortorder = 'asc' then
            v_sort_order = 'asc';
        when sortorder = 'desc' then
            v_sort_order = 'desc';
        else
            v_sort_order = 'asc';
        end case;

    v_order_by = v_order_by || ' ' || v_sort_order;

    return query execute
        'with folders as (
           select path_tokens[$1] as folder
           from storage.objects
             where objects.name ilike $2 || $3 || ''%''
               and bucket_id = $4
               and array_length(objects.path_tokens, 1) <> $1
           group by folder
           order by folder ' || v_sort_order || '
     )
     (select folder as "name",
            null as id,
            null as updated_at,
            null as created_at,
            null as last_accessed_at,
            null as metadata from folders)
     union all
     (select path_tokens[$1] as "name",
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
     from storage.objects
     where objects.name ilike $2 || $3 || ''%''
       and bucket_id = $4
       and array_length(objects.path_tokens, 1) = $1
     order by ' || v_order_by || ')
     limit $5
     offset $6' using levels, prefix, search, bucketname, limits, offsets;
end;
$_$;


ALTER FUNCTION storage.search_legacy_v1(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- Name: search_v1_optimised(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_v1_optimised(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
declare
    v_order_by text;
    v_sort_order text;
begin
    case
        when sortcolumn = 'name' then
            v_order_by = 'name';
        when sortcolumn = 'updated_at' then
            v_order_by = 'updated_at';
        when sortcolumn = 'created_at' then
            v_order_by = 'created_at';
        when sortcolumn = 'last_accessed_at' then
            v_order_by = 'last_accessed_at';
        else
            v_order_by = 'name';
        end case;

    case
        when sortorder = 'asc' then
            v_sort_order = 'asc';
        when sortorder = 'desc' then
            v_sort_order = 'desc';
        else
            v_sort_order = 'asc';
        end case;

    v_order_by = v_order_by || ' ' || v_sort_order;

    return query execute
        'with folders as (
           select (string_to_array(name, ''/''))[level] as name
           from storage.prefixes
             where lower(prefixes.name) like lower($2 || $3) || ''%''
               and bucket_id = $4
               and level = $1
           order by name ' || v_sort_order || '
     )
     (select name,
            null as id,
            null as updated_at,
            null as created_at,
            null as last_accessed_at,
            null as metadata from folders)
     union all
     (select path_tokens[level] as "name",
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
     from storage.objects
     where lower(objects.name) like lower($2 || $3) || ''%''
       and bucket_id = $4
       and level = $1
     order by ' || v_order_by || ')
     limit $5
     offset $6' using levels, prefix, search, bucketname, limits, offsets;
end;
$_$;


ALTER FUNCTION storage.search_v1_optimised(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- Name: search_v2(text, text, integer, integer, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_v2(prefix text, bucket_name text, limits integer DEFAULT 100, levels integer DEFAULT 1, start_after text DEFAULT ''::text) RETURNS TABLE(key text, name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
BEGIN
    RETURN query EXECUTE
        $sql$
        SELECT * FROM (
            (
                SELECT
                    split_part(name, '/', $4) AS key,
                    name || '/' AS name,
                    NULL::uuid AS id,
                    NULL::timestamptz AS updated_at,
                    NULL::timestamptz AS created_at,
                    NULL::jsonb AS metadata
                FROM storage.prefixes
                WHERE name COLLATE "C" LIKE $1 || '%'
                AND bucket_id = $2
                AND level = $4
                AND name COLLATE "C" > $5
                ORDER BY prefixes.name COLLATE "C" LIMIT $3
            )
            UNION ALL
            (SELECT split_part(name, '/', $4) AS key,
                name,
                id,
                updated_at,
                created_at,
                metadata
            FROM storage.objects
            WHERE name COLLATE "C" LIKE $1 || '%'
                AND bucket_id = $2
                AND level = $4
                AND name COLLATE "C" > $5
            ORDER BY name COLLATE "C" LIMIT $3)
        ) obj
        ORDER BY name COLLATE "C" LIMIT $3;
        $sql$
        USING prefix, bucket_name, limits, levels, start_after;
END;
$_$;


ALTER FUNCTION storage.search_v2(prefix text, bucket_name text, limits integer, levels integer, start_after text) OWNER TO supabase_storage_admin;

--
-- Name: search_v2(text, text, integer, integer, text, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_v2(prefix text, bucket_name text, limits integer DEFAULT 100, levels integer DEFAULT 1, start_after text DEFAULT ''::text, sort_order text DEFAULT 'asc'::text, sort_column text DEFAULT 'name'::text, sort_column_after text DEFAULT ''::text) RETURNS TABLE(key text, name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
DECLARE
    sort_col text;
    sort_ord text;
    cursor_op text;
    cursor_expr text;
    sort_expr text;
BEGIN
    -- Validate sort_order
    sort_ord := lower(sort_order);
    IF sort_ord NOT IN ('asc', 'desc') THEN
        sort_ord := 'asc';
    END IF;

    -- Determine cursor comparison operator
    IF sort_ord = 'asc' THEN
        cursor_op := '>';
    ELSE
        cursor_op := '<';
    END IF;
    
    sort_col := lower(sort_column);
    -- Validate sort column  
    IF sort_col IN ('updated_at', 'created_at') THEN
        cursor_expr := format(
            '($5 = '''' OR ROW(date_trunc(''milliseconds'', %I), name COLLATE "C") %s ROW(COALESCE(NULLIF($6, '''')::timestamptz, ''epoch''::timestamptz), $5))',
            sort_col, cursor_op
        );
        sort_expr := format(
            'COALESCE(date_trunc(''milliseconds'', %I), ''epoch''::timestamptz) %s, name COLLATE "C" %s',
            sort_col, sort_ord, sort_ord
        );
    ELSE
        cursor_expr := format('($5 = '''' OR name COLLATE "C" %s $5)', cursor_op);
        sort_expr := format('name COLLATE "C" %s', sort_ord);
    END IF;

    RETURN QUERY EXECUTE format(
        $sql$
        SELECT * FROM (
            (
                SELECT
                    split_part(name, '/', $4) AS key,
                    name,
                    NULL::uuid AS id,
                    updated_at,
                    created_at,
                    NULL::timestamptz AS last_accessed_at,
                    NULL::jsonb AS metadata
                FROM storage.prefixes
                WHERE name COLLATE "C" LIKE $1 || '%%'
                    AND bucket_id = $2
                    AND level = $4
                    AND %s
                ORDER BY %s
                LIMIT $3
            )
            UNION ALL
            (
                SELECT
                    split_part(name, '/', $4) AS key,
                    name,
                    id,
                    updated_at,
                    created_at,
                    last_accessed_at,
                    metadata
                FROM storage.objects
                WHERE name COLLATE "C" LIKE $1 || '%%'
                    AND bucket_id = $2
                    AND level = $4
                    AND %s
                ORDER BY %s
                LIMIT $3
            )
        ) obj
        ORDER BY %s
        LIMIT $3
        $sql$,
        cursor_expr,    -- prefixes WHERE
        sort_expr,      -- prefixes ORDER BY
        cursor_expr,    -- objects WHERE
        sort_expr,      -- objects ORDER BY
        sort_expr       -- final ORDER BY
    )
    USING prefix, bucket_name, limits, levels, start_after, sort_column_after;
END;
$_$;


ALTER FUNCTION storage.search_v2(prefix text, bucket_name text, limits integer, levels integer, start_after text, sort_order text, sort_column text, sort_column_after text) OWNER TO supabase_storage_admin;

--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW; 
END;
$$;


ALTER FUNCTION storage.update_updated_at_column() OWNER TO supabase_storage_admin;

--
-- Name: http_request(); Type: FUNCTION; Schema: supabase_functions; Owner: supabase_functions_admin
--

CREATE FUNCTION supabase_functions.http_request() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'supabase_functions'
    AS $$
  DECLARE
    request_id bigint;
    payload jsonb;
    url text := TG_ARGV[0]::text;
    method text := TG_ARGV[1]::text;
    headers jsonb DEFAULT '{}'::jsonb;
    params jsonb DEFAULT '{}'::jsonb;
    timeout_ms integer DEFAULT 1000;
  BEGIN
    IF url IS NULL OR url = 'null' THEN
      RAISE EXCEPTION 'url argument is missing';
    END IF;

    IF method IS NULL OR method = 'null' THEN
      RAISE EXCEPTION 'method argument is missing';
    END IF;

    IF TG_ARGV[2] IS NULL OR TG_ARGV[2] = 'null' THEN
      headers = '{"Content-Type": "application/json"}'::jsonb;
    ELSE
      headers = TG_ARGV[2]::jsonb;
    END IF;

    IF TG_ARGV[3] IS NULL OR TG_ARGV[3] = 'null' THEN
      params = '{}'::jsonb;
    ELSE
      params = TG_ARGV[3]::jsonb;
    END IF;

    IF TG_ARGV[4] IS NULL OR TG_ARGV[4] = 'null' THEN
      timeout_ms = 1000;
    ELSE
      timeout_ms = TG_ARGV[4]::integer;
    END IF;

    CASE
      WHEN method = 'GET' THEN
        SELECT http_get INTO request_id FROM net.http_get(
          url,
          params,
          headers,
          timeout_ms
        );
      WHEN method = 'POST' THEN
        payload = jsonb_build_object(
          'old_record', OLD,
          'record', NEW,
          'type', TG_OP,
          'table', TG_TABLE_NAME,
          'schema', TG_TABLE_SCHEMA
        );

        SELECT http_post INTO request_id FROM net.http_post(
          url,
          payload,
          params,
          headers,
          timeout_ms
        );
      ELSE
        RAISE EXCEPTION 'method argument % is invalid', method;
    END CASE;

    INSERT INTO supabase_functions.hooks
      (hook_table_id, hook_name, request_id)
    VALUES
      (TG_RELID, TG_NAME, request_id);

    RETURN NEW;
  END
$$;


ALTER FUNCTION supabase_functions.http_request() OWNER TO supabase_functions_admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: extensions; Type: TABLE; Schema: _realtime; Owner: supabase_admin
--

CREATE TABLE _realtime.extensions (
    id uuid NOT NULL,
    type text,
    settings jsonb,
    tenant_external_id text,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE _realtime.extensions OWNER TO supabase_admin;

--
-- Name: schema_migrations; Type: TABLE; Schema: _realtime; Owner: supabase_admin
--

CREATE TABLE _realtime.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


ALTER TABLE _realtime.schema_migrations OWNER TO supabase_admin;

--
-- Name: tenants; Type: TABLE; Schema: _realtime; Owner: supabase_admin
--

CREATE TABLE _realtime.tenants (
    id uuid NOT NULL,
    name text,
    external_id text,
    jwt_secret text,
    max_concurrent_users integer DEFAULT 200 NOT NULL,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    max_events_per_second integer DEFAULT 100 NOT NULL,
    postgres_cdc_default text DEFAULT 'postgres_cdc_rls'::text,
    max_bytes_per_second integer DEFAULT 100000 NOT NULL,
    max_channels_per_client integer DEFAULT 100 NOT NULL,
    max_joins_per_second integer DEFAULT 500 NOT NULL,
    suspend boolean DEFAULT false,
    jwt_jwks jsonb,
    notify_private_alpha boolean DEFAULT false,
    private_only boolean DEFAULT false NOT NULL,
    migrations_ran integer DEFAULT 0,
    broadcast_adapter character varying(255) DEFAULT 'gen_rpc'::character varying,
    max_presence_events_per_second integer DEFAULT 1000,
    max_payload_size_in_kb integer DEFAULT 3000,
    CONSTRAINT jwt_secret_or_jwt_jwks_required CHECK (((jwt_secret IS NOT NULL) OR (jwt_jwks IS NOT NULL)))
);


ALTER TABLE _realtime.tenants OWNER TO supabase_admin;

--
-- Name: audit_log_entries; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.audit_log_entries (
    instance_id uuid,
    id uuid NOT NULL,
    payload json,
    created_at timestamp with time zone,
    ip_address character varying(64) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE auth.audit_log_entries OWNER TO supabase_auth_admin;

--
-- Name: TABLE audit_log_entries; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.audit_log_entries IS 'Auth: Audit trail for user actions.';


--
-- Name: flow_state; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.flow_state (
    id uuid NOT NULL,
    user_id uuid,
    auth_code text NOT NULL,
    code_challenge_method auth.code_challenge_method NOT NULL,
    code_challenge text NOT NULL,
    provider_type text NOT NULL,
    provider_access_token text,
    provider_refresh_token text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    authentication_method text NOT NULL,
    auth_code_issued_at timestamp with time zone
);


ALTER TABLE auth.flow_state OWNER TO supabase_auth_admin;

--
-- Name: TABLE flow_state; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.flow_state IS 'stores metadata for pkce logins';


--
-- Name: identities; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.identities (
    provider_id text NOT NULL,
    user_id uuid NOT NULL,
    identity_data jsonb NOT NULL,
    provider text NOT NULL,
    last_sign_in_at timestamp with time zone,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    email text GENERATED ALWAYS AS (lower((identity_data ->> 'email'::text))) STORED,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE auth.identities OWNER TO supabase_auth_admin;

--
-- Name: TABLE identities; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.identities IS 'Auth: Stores identities associated to a user.';


--
-- Name: COLUMN identities.email; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.identities.email IS 'Auth: Email is a generated column that references the optional email property in the identity_data';


--
-- Name: instances; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.instances (
    id uuid NOT NULL,
    uuid uuid,
    raw_base_config text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE auth.instances OWNER TO supabase_auth_admin;

--
-- Name: TABLE instances; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.instances IS 'Auth: Manages users across multiple sites.';


--
-- Name: mfa_amr_claims; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_amr_claims (
    session_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    authentication_method text NOT NULL,
    id uuid NOT NULL
);


ALTER TABLE auth.mfa_amr_claims OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_amr_claims; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_amr_claims IS 'auth: stores authenticator method reference claims for multi factor authentication';


--
-- Name: mfa_challenges; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_challenges (
    id uuid NOT NULL,
    factor_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    verified_at timestamp with time zone,
    ip_address inet NOT NULL,
    otp_code text,
    web_authn_session_data jsonb
);


ALTER TABLE auth.mfa_challenges OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_challenges; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_challenges IS 'auth: stores metadata about challenge requests made';


--
-- Name: mfa_factors; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_factors (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    friendly_name text,
    factor_type auth.factor_type NOT NULL,
    status auth.factor_status NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    secret text,
    phone text,
    last_challenged_at timestamp with time zone,
    web_authn_credential jsonb,
    web_authn_aaguid uuid,
    last_webauthn_challenge_data jsonb
);


ALTER TABLE auth.mfa_factors OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_factors; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_factors IS 'auth: stores metadata about factors';


--
-- Name: COLUMN mfa_factors.last_webauthn_challenge_data; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.mfa_factors.last_webauthn_challenge_data IS 'Stores the latest WebAuthn challenge data including attestation/assertion for customer verification';


--
-- Name: oauth_authorizations; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_authorizations (
    id uuid NOT NULL,
    authorization_id text NOT NULL,
    client_id uuid NOT NULL,
    user_id uuid,
    redirect_uri text NOT NULL,
    scope text NOT NULL,
    state text,
    resource text,
    code_challenge text,
    code_challenge_method auth.code_challenge_method,
    response_type auth.oauth_response_type DEFAULT 'code'::auth.oauth_response_type NOT NULL,
    status auth.oauth_authorization_status DEFAULT 'pending'::auth.oauth_authorization_status NOT NULL,
    authorization_code text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    expires_at timestamp with time zone DEFAULT (now() + '00:03:00'::interval) NOT NULL,
    approved_at timestamp with time zone,
    nonce text,
    CONSTRAINT oauth_authorizations_authorization_code_length CHECK ((char_length(authorization_code) <= 255)),
    CONSTRAINT oauth_authorizations_code_challenge_length CHECK ((char_length(code_challenge) <= 128)),
    CONSTRAINT oauth_authorizations_expires_at_future CHECK ((expires_at > created_at)),
    CONSTRAINT oauth_authorizations_nonce_length CHECK ((char_length(nonce) <= 255)),
    CONSTRAINT oauth_authorizations_redirect_uri_length CHECK ((char_length(redirect_uri) <= 2048)),
    CONSTRAINT oauth_authorizations_resource_length CHECK ((char_length(resource) <= 2048)),
    CONSTRAINT oauth_authorizations_scope_length CHECK ((char_length(scope) <= 4096)),
    CONSTRAINT oauth_authorizations_state_length CHECK ((char_length(state) <= 4096))
);


ALTER TABLE auth.oauth_authorizations OWNER TO supabase_auth_admin;

--
-- Name: oauth_client_states; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_client_states (
    id uuid NOT NULL,
    provider_type text NOT NULL,
    code_verifier text,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE auth.oauth_client_states OWNER TO supabase_auth_admin;

--
-- Name: TABLE oauth_client_states; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.oauth_client_states IS 'Stores OAuth states for third-party provider authentication flows where Supabase acts as the OAuth client.';


--
-- Name: oauth_clients; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_clients (
    id uuid NOT NULL,
    client_secret_hash text,
    registration_type auth.oauth_registration_type NOT NULL,
    redirect_uris text NOT NULL,
    grant_types text NOT NULL,
    client_name text,
    client_uri text,
    logo_uri text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    client_type auth.oauth_client_type DEFAULT 'confidential'::auth.oauth_client_type NOT NULL,
    CONSTRAINT oauth_clients_client_name_length CHECK ((char_length(client_name) <= 1024)),
    CONSTRAINT oauth_clients_client_uri_length CHECK ((char_length(client_uri) <= 2048)),
    CONSTRAINT oauth_clients_logo_uri_length CHECK ((char_length(logo_uri) <= 2048))
);


ALTER TABLE auth.oauth_clients OWNER TO supabase_auth_admin;

--
-- Name: oauth_consents; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_consents (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    client_id uuid NOT NULL,
    scopes text NOT NULL,
    granted_at timestamp with time zone DEFAULT now() NOT NULL,
    revoked_at timestamp with time zone,
    CONSTRAINT oauth_consents_revoked_after_granted CHECK (((revoked_at IS NULL) OR (revoked_at >= granted_at))),
    CONSTRAINT oauth_consents_scopes_length CHECK ((char_length(scopes) <= 2048)),
    CONSTRAINT oauth_consents_scopes_not_empty CHECK ((char_length(TRIM(BOTH FROM scopes)) > 0))
);


ALTER TABLE auth.oauth_consents OWNER TO supabase_auth_admin;

--
-- Name: one_time_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.one_time_tokens (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    token_type auth.one_time_token_type NOT NULL,
    token_hash text NOT NULL,
    relates_to text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT one_time_tokens_token_hash_check CHECK ((char_length(token_hash) > 0))
);


ALTER TABLE auth.one_time_tokens OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.refresh_tokens (
    instance_id uuid,
    id bigint NOT NULL,
    token character varying(255),
    user_id character varying(255),
    revoked boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    parent character varying(255),
    session_id uuid
);


ALTER TABLE auth.refresh_tokens OWNER TO supabase_auth_admin;

--
-- Name: TABLE refresh_tokens; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.refresh_tokens IS 'Auth: Store of tokens used to refresh JWT tokens once they expire.';


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE; Schema: auth; Owner: supabase_auth_admin
--

CREATE SEQUENCE auth.refresh_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE auth.refresh_tokens_id_seq OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: supabase_auth_admin
--

ALTER SEQUENCE auth.refresh_tokens_id_seq OWNED BY auth.refresh_tokens.id;


--
-- Name: saml_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_providers (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    entity_id text NOT NULL,
    metadata_xml text NOT NULL,
    metadata_url text,
    attribute_mapping jsonb,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    name_id_format text,
    CONSTRAINT "entity_id not empty" CHECK ((char_length(entity_id) > 0)),
    CONSTRAINT "metadata_url not empty" CHECK (((metadata_url = NULL::text) OR (char_length(metadata_url) > 0))),
    CONSTRAINT "metadata_xml not empty" CHECK ((char_length(metadata_xml) > 0))
);


ALTER TABLE auth.saml_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_providers IS 'Auth: Manages SAML Identity Provider connections.';


--
-- Name: saml_relay_states; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_relay_states (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    request_id text NOT NULL,
    for_email text,
    redirect_to text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    flow_state_id uuid,
    CONSTRAINT "request_id not empty" CHECK ((char_length(request_id) > 0))
);


ALTER TABLE auth.saml_relay_states OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_relay_states; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_relay_states IS 'Auth: Contains SAML Relay State information for each Service Provider initiated login.';


--
-- Name: schema_migrations; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE auth.schema_migrations OWNER TO supabase_auth_admin;

--
-- Name: TABLE schema_migrations; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.schema_migrations IS 'Auth: Manages updates to the auth system.';


--
-- Name: sessions; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sessions (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    factor_id uuid,
    aal auth.aal_level,
    not_after timestamp with time zone,
    refreshed_at timestamp without time zone,
    user_agent text,
    ip inet,
    tag text,
    oauth_client_id uuid,
    refresh_token_hmac_key text,
    refresh_token_counter bigint,
    scopes text,
    CONSTRAINT sessions_scopes_length CHECK ((char_length(scopes) <= 4096))
);


ALTER TABLE auth.sessions OWNER TO supabase_auth_admin;

--
-- Name: TABLE sessions; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sessions IS 'Auth: Stores session data associated to a user.';


--
-- Name: COLUMN sessions.not_after; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.not_after IS 'Auth: Not after is a nullable column that contains a timestamp after which the session should be regarded as expired.';


--
-- Name: COLUMN sessions.refresh_token_hmac_key; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.refresh_token_hmac_key IS 'Holds a HMAC-SHA256 key used to sign refresh tokens for this session.';


--
-- Name: COLUMN sessions.refresh_token_counter; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.refresh_token_counter IS 'Holds the ID (counter) of the last issued refresh token.';


--
-- Name: sso_domains; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_domains (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    domain text NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "domain not empty" CHECK ((char_length(domain) > 0))
);


ALTER TABLE auth.sso_domains OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_domains; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_domains IS 'Auth: Manages SSO email address domain mapping to an SSO Identity Provider.';


--
-- Name: sso_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_providers (
    id uuid NOT NULL,
    resource_id text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    disabled boolean,
    CONSTRAINT "resource_id not empty" CHECK (((resource_id = NULL::text) OR (char_length(resource_id) > 0)))
);


ALTER TABLE auth.sso_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_providers IS 'Auth: Manages SSO identity provider information; see saml_providers for SAML.';


--
-- Name: COLUMN sso_providers.resource_id; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sso_providers.resource_id IS 'Auth: Uniquely identifies a SSO provider according to a user-chosen resource ID (case insensitive), useful in infrastructure as code.';


--
-- Name: sso_sessions; Type: TABLE; Schema: auth; Owner: supabase_admin
--

CREATE TABLE auth.sso_sessions (
    id uuid NOT NULL,
    session_id uuid NOT NULL,
    sso_provider_id uuid,
    not_before timestamp with time zone,
    not_after timestamp with time zone,
    idp_initiated boolean DEFAULT false,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE auth.sso_sessions OWNER TO supabase_admin;

--
-- Name: TABLE sso_sessions; Type: COMMENT; Schema: auth; Owner: supabase_admin
--

COMMENT ON TABLE auth.sso_sessions IS 'Auth: A session initiated by an SSO Identity Provider';


--
-- Name: users; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.users (
    instance_id uuid,
    id uuid NOT NULL,
    aud character varying(255),
    role character varying(255),
    email character varying(255),
    encrypted_password character varying(255),
    email_confirmed_at timestamp with time zone,
    invited_at timestamp with time zone,
    confirmation_token character varying(255),
    confirmation_sent_at timestamp with time zone,
    recovery_token character varying(255),
    recovery_sent_at timestamp with time zone,
    email_change_token_new character varying(255),
    email_change character varying(255),
    email_change_sent_at timestamp with time zone,
    last_sign_in_at timestamp with time zone,
    raw_app_meta_data jsonb,
    raw_user_meta_data jsonb,
    is_super_admin boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    phone text DEFAULT NULL::character varying,
    phone_confirmed_at timestamp with time zone,
    phone_change text DEFAULT ''::character varying,
    phone_change_token character varying(255) DEFAULT ''::character varying,
    phone_change_sent_at timestamp with time zone,
    confirmed_at timestamp with time zone GENERATED ALWAYS AS (LEAST(email_confirmed_at, phone_confirmed_at)) STORED,
    email_change_token_current character varying(255) DEFAULT ''::character varying,
    email_change_confirm_status smallint DEFAULT 0,
    banned_until timestamp with time zone,
    reauthentication_token character varying(255) DEFAULT ''::character varying,
    reauthentication_sent_at timestamp with time zone,
    is_sso_user boolean DEFAULT false NOT NULL,
    deleted_at timestamp with time zone,
    is_anonymous boolean DEFAULT false NOT NULL,
    CONSTRAINT users_email_change_confirm_status_check CHECK (((email_change_confirm_status >= 0) AND (email_change_confirm_status <= 2)))
);


ALTER TABLE auth.users OWNER TO supabase_auth_admin;

--
-- Name: TABLE users; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.users IS 'Auth: Stores user login data within a secure schema.';


--
-- Name: COLUMN users.is_sso_user; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.users.is_sso_user IS 'Auth: Set this column to true when the account comes from SSO. These accounts can have duplicate emails.';


--
-- Name: clientes; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.clientes (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    nome_completo text NOT NULL,
    cpf_cnpj text NOT NULL,
    email text NOT NULL,
    fone text,
    data_nascimento date,
    codigo_cliente text NOT NULL,
    numero_medidor text NOT NULL,
    unidade_consumidora text,
    desconto_percentual numeric(5,2) DEFAULT 0.20,
    nr_contrato text,
    link_contrato text,
    endereco_jsonb jsonb,
    created_at timestamp with time zone DEFAULT timezone('utc'::text, now()),
    updated_at timestamp with time zone DEFAULT timezone('utc'::text, now())
);


ALTER TABLE public.clientes OWNER TO supabase_admin;

--
-- Name: cobrancas; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.cobrancas (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    fatura_id uuid,
    cliente_id uuid,
    valor_p2p numeric(10,2) NOT NULL,
    data_emissao timestamp with time zone DEFAULT timezone('brt'::text, now()),
    data_vencimento date NOT NULL,
    status_pagamento text DEFAULT 'pendente'::text,
    data_pagamento timestamp with time zone,
    link_boleto_pdf text,
    linha_digitavel_p2p text,
    id_externo_asaas text,
    created_at timestamp with time zone DEFAULT timezone('brt'::text, now()),
    qr_code_pix text,
    payload_pix text,
    CONSTRAINT cobrancas_status_pagamento_check CHECK ((status_pagamento = ANY (ARRAY['pendente'::text, 'pago'::text, 'atrasado'::text, 'cancelado'::text])))
);

ALTER TABLE ONLY public.cobrancas REPLICA IDENTITY FULL;


ALTER TABLE public.cobrancas OWNER TO supabase_admin;

--
-- Name: economia_gerada; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.economia_gerada (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    fatura_id uuid,
    cliente_id uuid,
    ft_enel_sem_gd numeric(10,2),
    total_itens_compensados numeric(10,2),
    lc_p2p numeric(10,2),
    nova_fatura_p2p numeric(10,2),
    economia_reais numeric(10,2),
    economia_percentual numeric(5,2),
    created_at timestamp with time zone DEFAULT timezone('utc'::text, now())
);


ALTER TABLE public.economia_gerada OWNER TO supabase_admin;

--
-- Name: faturas; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.faturas (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    cliente_id uuid,
    codigo_cliente text NOT NULL,
    numero_medidor text NOT NULL,
    mes_referencia text NOT NULL,
    data_vencimento date,
    ft_enel_com_gd numeric(10,2),
    media_consumo numeric(10,2),
    saldo_utilizado_mes numeric(10,2),
    saldo_total_atualizado numeric(10,2),
    reserva_creditos numeric(10,2),
    link_pdf_original text,
    status_processamento text DEFAULT 'processado'::text,
    created_at timestamp with time zone DEFAULT timezone('utc'::text, now()),
    consumo_kwh numeric,
    bandeira_tarifaria text,
    linha_digitavel_enel text,
    nr_dias numeric,
    proxima_leitura date,
    tributos numeric
);


ALTER TABLE public.faturas OWNER TO supabase_admin;

--
-- Name: itens_faturados; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.itens_faturados (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    fatura_id uuid,
    descricao text NOT NULL,
    quantidade numeric(12,4),
    unitario numeric(12,6),
    valor numeric(10,2) NOT NULL,
    tipo_item text,
    created_at timestamp with time zone DEFAULT timezone('utc'::text, now())
);


ALTER TABLE public.itens_faturados OWNER TO supabase_admin;

--
-- Name: lista_espera; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.lista_espera (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    nome text NOT NULL,
    email text NOT NULL,
    consumo_estimado numeric NOT NULL
);


ALTER TABLE public.lista_espera OWNER TO supabase_admin;

--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_migrations (
    version character varying(14) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- Name: messages; Type: TABLE; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE TABLE realtime.messages (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
)
PARTITION BY RANGE (inserted_at);


ALTER TABLE realtime.messages OWNER TO supabase_realtime_admin;

--
-- Name: messages_2026_01_16; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2026_01_16 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2026_01_16 OWNER TO supabase_admin;

--
-- Name: messages_2026_01_17; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2026_01_17 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2026_01_17 OWNER TO supabase_admin;

--
-- Name: messages_2026_01_18; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2026_01_18 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2026_01_18 OWNER TO supabase_admin;

--
-- Name: messages_2026_01_19; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2026_01_19 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2026_01_19 OWNER TO supabase_admin;

--
-- Name: messages_2026_01_20; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2026_01_20 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2026_01_20 OWNER TO supabase_admin;

--
-- Name: messages_2026_01_21; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2026_01_21 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2026_01_21 OWNER TO supabase_admin;

--
-- Name: messages_2026_01_22; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2026_01_22 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2026_01_22 OWNER TO supabase_admin;

--
-- Name: schema_migrations; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


ALTER TABLE realtime.schema_migrations OWNER TO supabase_admin;

--
-- Name: subscription; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.subscription (
    id bigint NOT NULL,
    subscription_id uuid NOT NULL,
    entity regclass NOT NULL,
    filters realtime.user_defined_filter[] DEFAULT '{}'::realtime.user_defined_filter[] NOT NULL,
    claims jsonb NOT NULL,
    claims_role regrole GENERATED ALWAYS AS (realtime.to_regrole((claims ->> 'role'::text))) STORED NOT NULL,
    created_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);


ALTER TABLE realtime.subscription OWNER TO supabase_admin;

--
-- Name: subscription_id_seq; Type: SEQUENCE; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE realtime.subscription ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME realtime.subscription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: buckets; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets (
    id text NOT NULL,
    name text NOT NULL,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    public boolean DEFAULT false,
    avif_autodetection boolean DEFAULT false,
    file_size_limit bigint,
    allowed_mime_types text[],
    owner_id text,
    type storage.buckettype DEFAULT 'STANDARD'::storage.buckettype NOT NULL
);


ALTER TABLE storage.buckets OWNER TO supabase_storage_admin;

--
-- Name: COLUMN buckets.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.buckets.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: buckets_analytics; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets_analytics (
    name text NOT NULL,
    type storage.buckettype DEFAULT 'ANALYTICS'::storage.buckettype NOT NULL,
    format text DEFAULT 'ICEBERG'::text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE storage.buckets_analytics OWNER TO supabase_storage_admin;

--
-- Name: buckets_vectors; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets_vectors (
    id text NOT NULL,
    type storage.buckettype DEFAULT 'VECTOR'::storage.buckettype NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.buckets_vectors OWNER TO supabase_storage_admin;

--
-- Name: iceberg_namespaces; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.iceberg_namespaces (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    bucket_name text NOT NULL,
    name text NOT NULL COLLATE pg_catalog."C",
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    metadata jsonb DEFAULT '{}'::jsonb NOT NULL,
    catalog_id uuid NOT NULL
);


ALTER TABLE storage.iceberg_namespaces OWNER TO supabase_storage_admin;

--
-- Name: iceberg_tables; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.iceberg_tables (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    namespace_id uuid NOT NULL,
    bucket_name text NOT NULL,
    name text NOT NULL COLLATE pg_catalog."C",
    location text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    remote_table_id text,
    shard_key text,
    shard_id text,
    catalog_id uuid NOT NULL
);


ALTER TABLE storage.iceberg_tables OWNER TO supabase_storage_admin;

--
-- Name: migrations; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.migrations (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    hash character varying(40) NOT NULL,
    executed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE storage.migrations OWNER TO supabase_storage_admin;

--
-- Name: objects; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.objects (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    bucket_id text,
    name text,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    last_accessed_at timestamp with time zone DEFAULT now(),
    metadata jsonb,
    path_tokens text[] GENERATED ALWAYS AS (string_to_array(name, '/'::text)) STORED,
    version text,
    owner_id text,
    user_metadata jsonb,
    level integer
);


ALTER TABLE storage.objects OWNER TO supabase_storage_admin;

--
-- Name: COLUMN objects.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.objects.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: prefixes; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.prefixes (
    bucket_id text NOT NULL,
    name text NOT NULL COLLATE pg_catalog."C",
    level integer GENERATED ALWAYS AS (storage.get_level(name)) STORED NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE storage.prefixes OWNER TO supabase_storage_admin;

--
-- Name: s3_multipart_uploads; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads (
    id text NOT NULL,
    in_progress_size bigint DEFAULT 0 NOT NULL,
    upload_signature text NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    version text NOT NULL,
    owner_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_metadata jsonb
);


ALTER TABLE storage.s3_multipart_uploads OWNER TO supabase_storage_admin;

--
-- Name: s3_multipart_uploads_parts; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads_parts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    upload_id text NOT NULL,
    size bigint DEFAULT 0 NOT NULL,
    part_number integer NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    etag text NOT NULL,
    owner_id text,
    version text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.s3_multipart_uploads_parts OWNER TO supabase_storage_admin;

--
-- Name: vector_indexes; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.vector_indexes (
    id text DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL COLLATE pg_catalog."C",
    bucket_id text NOT NULL,
    data_type text NOT NULL,
    dimension integer NOT NULL,
    distance_metric text NOT NULL,
    metadata_configuration jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.vector_indexes OWNER TO supabase_storage_admin;

--
-- Name: hooks; Type: TABLE; Schema: supabase_functions; Owner: supabase_functions_admin
--

CREATE TABLE supabase_functions.hooks (
    id bigint NOT NULL,
    hook_table_id integer NOT NULL,
    hook_name text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    request_id bigint
);


ALTER TABLE supabase_functions.hooks OWNER TO supabase_functions_admin;

--
-- Name: TABLE hooks; Type: COMMENT; Schema: supabase_functions; Owner: supabase_functions_admin
--

COMMENT ON TABLE supabase_functions.hooks IS 'Supabase Functions Hooks: Audit trail for triggered hooks.';


--
-- Name: hooks_id_seq; Type: SEQUENCE; Schema: supabase_functions; Owner: supabase_functions_admin
--

CREATE SEQUENCE supabase_functions.hooks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE supabase_functions.hooks_id_seq OWNER TO supabase_functions_admin;

--
-- Name: hooks_id_seq; Type: SEQUENCE OWNED BY; Schema: supabase_functions; Owner: supabase_functions_admin
--

ALTER SEQUENCE supabase_functions.hooks_id_seq OWNED BY supabase_functions.hooks.id;


--
-- Name: migrations; Type: TABLE; Schema: supabase_functions; Owner: supabase_functions_admin
--

CREATE TABLE supabase_functions.migrations (
    version text NOT NULL,
    inserted_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE supabase_functions.migrations OWNER TO supabase_functions_admin;

--
-- Name: messages_2026_01_16; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2026_01_16 FOR VALUES FROM ('2026-01-16 00:00:00') TO ('2026-01-17 00:00:00');


--
-- Name: messages_2026_01_17; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2026_01_17 FOR VALUES FROM ('2026-01-17 00:00:00') TO ('2026-01-18 00:00:00');


--
-- Name: messages_2026_01_18; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2026_01_18 FOR VALUES FROM ('2026-01-18 00:00:00') TO ('2026-01-19 00:00:00');


--
-- Name: messages_2026_01_19; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2026_01_19 FOR VALUES FROM ('2026-01-19 00:00:00') TO ('2026-01-20 00:00:00');


--
-- Name: messages_2026_01_20; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2026_01_20 FOR VALUES FROM ('2026-01-20 00:00:00') TO ('2026-01-21 00:00:00');


--
-- Name: messages_2026_01_21; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2026_01_21 FOR VALUES FROM ('2026-01-21 00:00:00') TO ('2026-01-22 00:00:00');


--
-- Name: messages_2026_01_22; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2026_01_22 FOR VALUES FROM ('2026-01-22 00:00:00') TO ('2026-01-23 00:00:00');


--
-- Name: refresh_tokens id; Type: DEFAULT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens ALTER COLUMN id SET DEFAULT nextval('auth.refresh_tokens_id_seq'::regclass);


--
-- Name: hooks id; Type: DEFAULT; Schema: supabase_functions; Owner: supabase_functions_admin
--

ALTER TABLE ONLY supabase_functions.hooks ALTER COLUMN id SET DEFAULT nextval('supabase_functions.hooks_id_seq'::regclass);


--
-- Data for Name: extensions; Type: TABLE DATA; Schema: _realtime; Owner: supabase_admin
--

COPY _realtime.extensions (id, type, settings, tenant_external_id, inserted_at, updated_at) FROM stdin;
d699447d-714b-4406-bd8a-c95b9160e409	postgres_cdc_rls	{"region": "us-east-1", "db_host": "+5JkR7EPoJsAtjz+cdk/ZJtUrgrah4VsLZMr21I8doI=", "db_name": "sWBpZNdjggEPTQVlI52Zfw==", "db_port": "+enMDFi1J/3IrrquHHwUmA==", "db_user": "uxbEq/zz8DXVD53TOI1zmw==", "slot_name": "supabase_realtime_replication_slot", "db_password": "sWBpZNdjggEPTQVlI52Zfw==", "publication": "supabase_realtime", "ssl_enforced": false, "poll_interval_ms": 100, "poll_max_changes": 100, "poll_max_record_bytes": 1048576}	realtime-dev	2026-01-19 00:17:54	2026-01-19 00:17:54
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: _realtime; Owner: supabase_admin
--

COPY _realtime.schema_migrations (version, inserted_at) FROM stdin;
20210706140551	2025-12-22 18:26:06
20220329161857	2025-12-22 18:26:06
20220410212326	2025-12-22 18:26:06
20220506102948	2025-12-22 18:26:06
20220527210857	2025-12-22 18:26:06
20220815211129	2025-12-22 18:26:06
20220815215024	2025-12-22 18:26:06
20220818141501	2025-12-22 18:26:06
20221018173709	2025-12-22 18:26:06
20221102172703	2025-12-22 18:26:06
20221223010058	2025-12-22 18:26:06
20230110180046	2025-12-22 18:26:06
20230810220907	2025-12-22 18:26:06
20230810220924	2025-12-22 18:26:06
20231024094642	2025-12-22 18:26:06
20240306114423	2025-12-22 18:26:06
20240418082835	2025-12-22 18:26:06
20240625211759	2025-12-22 18:26:06
20240704172020	2025-12-22 18:26:06
20240902173232	2025-12-22 18:26:06
20241106103258	2025-12-22 18:26:06
20250424203323	2025-12-22 18:26:06
20250613072131	2025-12-22 18:26:06
20250711044927	2025-12-22 18:26:06
20250811121559	2025-12-22 18:26:06
20250926223044	2025-12-22 18:26:06
20251204170944	2025-12-22 18:26:06
20251218000543	2025-12-22 18:26:06
\.


--
-- Data for Name: tenants; Type: TABLE DATA; Schema: _realtime; Owner: supabase_admin
--

COPY _realtime.tenants (id, name, external_id, jwt_secret, max_concurrent_users, inserted_at, updated_at, max_events_per_second, postgres_cdc_default, max_bytes_per_second, max_channels_per_client, max_joins_per_second, suspend, jwt_jwks, notify_private_alpha, private_only, migrations_ran, broadcast_adapter, max_presence_events_per_second, max_payload_size_in_kb) FROM stdin;
b461904c-b2f3-4f6e-beab-abccbb7eac85	realtime-dev	realtime-dev	iNjicxc4+llvc9wovDvqymwfnj9teWMlyOIbJ8Fh6j2WNU8CIJ2ZgjR6MUIKqSmeDmvpsKLsZ9jgXJmQPpwL8w==	200	2026-01-19 00:17:54	2026-01-19 00:17:55	100	postgres_cdc_rls	100000	100	100	f	{"keys": [{"x": "M5Sjqn5zwC9Kl1zVfUUGvv9boQjCGd45G8sdopBExB4", "y": "P6IXMvA2WYXSHSOMTBH2jsw_9rrzGy89FjPf6oOsIxQ", "alg": "ES256", "crv": "P-256", "ext": true, "kid": "b81269f1-21d8-4f2e-b719-c2240a840d90", "kty": "EC", "use": "sig", "key_ops": ["verify"]}, {"k": "c3VwZXItc2VjcmV0LWp3dC10b2tlbi13aXRoLWF0LWxlYXN0LTMyLWNoYXJhY3RlcnMtbG9uZw", "kty": "oct"}]}	f	f	65	gen_rpc	1000	3000
\.


--
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.audit_log_entries (instance_id, id, payload, created_at, ip_address) FROM stdin;
00000000-0000-0000-0000-000000000000	30578442-821a-4291-b722-f5b0da2f7662	{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"provider":"email","user_email":"admin@p2p.com","user_id":"ee5eb52d-f8e4-4d9b-ab4c-af61556223b1","user_phone":""}}	2025-12-30 19:13:36.222476+00	
00000000-0000-0000-0000-000000000000	ac945fe6-2de9-4f06-ae5d-34486e157838	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"admin@p2p.com","user_id":"ee5eb52d-f8e4-4d9b-ab4c-af61556223b1","user_phone":""}}	2025-12-30 19:15:45.000387+00	
00000000-0000-0000-0000-000000000000	6cf15391-8d15-43e8-8c29-22f3601b258e	{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"provider":"email","user_email":"admin@p2p.com","user_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","user_phone":""}}	2025-12-30 19:16:08.883622+00	
00000000-0000-0000-0000-000000000000	43860bdf-71c5-41a7-8d9b-930cc6e748a9	{"action":"user_signedup","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-12-30 19:23:51.776479+00	
00000000-0000-0000-0000-000000000000	372d1508-138b-4153-9de3-522c9d22cd59	{"action":"login","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-12-30 19:23:51.823655+00	
00000000-0000-0000-0000-000000000000	0e7928e7-b72c-4687-8fe0-44aba7760e53	{"action":"user_recovery_requested","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"user"}	2025-12-30 19:23:51.977271+00	
00000000-0000-0000-0000-000000000000	0df56911-c1b9-4172-81f2-0cfb49d9b605	{"action":"login","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-12-30 19:23:56.683092+00	
00000000-0000-0000-0000-000000000000	dd12ffff-6437-41e4-880b-1eacc9a4217a	{"action":"login","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-12-30 19:24:54.087444+00	
00000000-0000-0000-0000-000000000000	09d26314-910d-4417-89d2-efa4dbfbdc18	{"action":"login","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-12-30 19:53:40.241807+00	
00000000-0000-0000-0000-000000000000	2e14baa5-d911-4f06-97b8-f200a4055696	{"action":"login","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-12-30 20:00:20.120485+00	
00000000-0000-0000-0000-000000000000	487e66dd-a85a-4d26-8c86-56ff8709ffa4	{"action":"logout","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"account"}	2025-12-30 20:00:40.789555+00	
00000000-0000-0000-0000-000000000000	1531084c-1963-47ab-8d0e-650acb6e5899	{"action":"login","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-12-30 20:00:44.384657+00	
00000000-0000-0000-0000-000000000000	b0c6fc6f-f918-45ad-baab-112861455093	{"action":"logout","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"account"}	2025-12-30 20:01:00.956553+00	
00000000-0000-0000-0000-000000000000	4805ff67-8018-428a-8bc1-2d08eca520fe	{"action":"login","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-12-30 20:01:20.379914+00	
00000000-0000-0000-0000-000000000000	70466356-ce8d-4b8e-8598-5286329b0d83	{"action":"logout","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"account"}	2025-12-30 20:04:21.351962+00	
00000000-0000-0000-0000-000000000000	6cb1328f-9ca6-48fd-908f-3947c0720c12	{"action":"login","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-12-30 20:04:23.000957+00	
00000000-0000-0000-0000-000000000000	39926b62-63ab-4d52-a8d4-924a1c11b77c	{"action":"logout","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"account"}	2025-12-30 20:04:34.60226+00	
00000000-0000-0000-0000-000000000000	ef1efdc8-13f5-48b4-9aaf-77c7b69787f4	{"action":"login","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-12-30 20:04:37.078568+00	
00000000-0000-0000-0000-000000000000	2f651c08-cc59-4a76-bed5-585f0b5eaad5	{"action":"login","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-12-30 20:05:02.24156+00	
00000000-0000-0000-0000-000000000000	63d24e5d-8f4f-4a6f-8b8b-b20ca083a914	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2025-12-31 00:37:42.738823+00	
00000000-0000-0000-0000-000000000000	f3593e4a-7514-4d08-b884-befc2f66473e	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2025-12-31 00:37:42.775901+00	
00000000-0000-0000-0000-000000000000	b465118e-eb4d-4bd7-8f04-4e86857f5f28	{"action":"login","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-12-31 00:54:31.616112+00	
00000000-0000-0000-0000-000000000000	cdf7f19c-7d69-43e0-9dff-7bfc69540eb6	{"action":"logout","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"account"}	2025-12-31 00:55:11.711107+00	
00000000-0000-0000-0000-000000000000	8f486631-8fef-4fe2-a7ca-ea7947e0ce3d	{"action":"login","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-12-31 00:56:36.027299+00	
00000000-0000-0000-0000-000000000000	2227fade-1c65-4d18-85e8-03e3d67b4bcd	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2025-12-31 11:27:40.586199+00	
00000000-0000-0000-0000-000000000000	9eba7a97-f843-442d-9c34-ac389cf4ee5d	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2025-12-31 11:27:40.883421+00	
00000000-0000-0000-0000-000000000000	4d1b2ca9-27f6-4bcb-aabd-7856bf2885cd	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2025-12-31 12:37:27.487402+00	
00000000-0000-0000-0000-000000000000	21f05232-f5c5-467a-a891-09cf050ffa74	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2025-12-31 12:37:27.525393+00	
00000000-0000-0000-0000-000000000000	7f2f65c6-6072-43ff-8d65-2d925be98fbb	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2025-12-31 17:48:35.227666+00	
00000000-0000-0000-0000-000000000000	31169810-7d6d-468e-b4e8-765ed788bc0e	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2025-12-31 17:48:35.292597+00	
00000000-0000-0000-0000-000000000000	85641d5b-dd83-4989-9f4c-67b17c2fc750	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2025-12-31 18:47:23.765215+00	
00000000-0000-0000-0000-000000000000	62c40f05-0b3b-4f34-a960-5c4d7f9c72b0	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2025-12-31 18:47:23.790013+00	
00000000-0000-0000-0000-000000000000	99306036-e97c-4ae7-af0b-d5ca82f2cb91	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2025-12-31 19:46:51.668983+00	
00000000-0000-0000-0000-000000000000	99d08fa0-6815-4aa1-8537-e4afb1fe2415	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2025-12-31 19:46:51.693092+00	
00000000-0000-0000-0000-000000000000	dc79ca23-5fec-4387-85a8-d15a9957651e	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2025-12-31 21:18:58.646601+00	
00000000-0000-0000-0000-000000000000	5ced2c25-f222-415d-8e3a-cb11af221081	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2025-12-31 21:18:58.669857+00	
00000000-0000-0000-0000-000000000000	0bcbf436-f0c1-482c-8f5f-660df822ccc9	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2025-12-31 22:24:30.003354+00	
00000000-0000-0000-0000-000000000000	905afd6c-03b7-46c4-a916-0b8c2611e7c0	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2025-12-31 22:24:30.049251+00	
00000000-0000-0000-0000-000000000000	ab5ae897-bead-484a-849b-e7af02cb6584	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-01 23:15:20.857494+00	
00000000-0000-0000-0000-000000000000	83b2727f-f202-4ed9-a286-169997b306cf	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-01 23:15:21.229984+00	
00000000-0000-0000-0000-000000000000	336348ca-bbfd-498a-a4ab-5af7519d6ffd	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-01 23:15:23.802782+00	
00000000-0000-0000-0000-000000000000	b7aee2e3-23ba-47ac-a07c-87984ef43df4	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-02 00:17:30.842842+00	
00000000-0000-0000-0000-000000000000	d18a1c6a-3e6c-4493-9b8e-bc55bb647da7	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-02 00:17:30.860563+00	
00000000-0000-0000-0000-000000000000	1b53b0c4-caac-48cf-b04b-351a03a98611	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-02 11:28:49.13733+00	
00000000-0000-0000-0000-000000000000	3da19867-0128-432d-9dfa-bbe152fefe9b	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-02 11:28:49.365853+00	
00000000-0000-0000-0000-000000000000	032f27da-9e83-4a46-ba57-880ac5a29413	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-02 12:27:20.205852+00	
00000000-0000-0000-0000-000000000000	a7bc8b52-2dbe-4c9f-b8e8-9d4fb80d9ca8	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-02 12:27:20.233451+00	
00000000-0000-0000-0000-000000000000	0f9d2723-f650-4134-a9ca-56c6c0c2e7dd	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-02 13:25:49.256633+00	
00000000-0000-0000-0000-000000000000	689e0239-3b86-4e2e-8c39-455c677bf93b	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-02 13:25:49.299747+00	
00000000-0000-0000-0000-000000000000	5facd5f4-6d43-40cc-ad73-e1650dc11523	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-02 14:24:40.190317+00	
00000000-0000-0000-0000-000000000000	6d3caef1-0fbf-445b-89d6-4c7fb906a715	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-02 14:24:40.292651+00	
00000000-0000-0000-0000-000000000000	645c4e87-6491-4c3b-a208-8c878e163788	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-02 15:25:33.2434+00	
00000000-0000-0000-0000-000000000000	fb0f7116-7498-40ff-8c00-01a377edb264	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-02 15:25:33.271504+00	
00000000-0000-0000-0000-000000000000	ca599046-568f-4bc1-8a03-b6f8be661475	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-02 16:24:19.294423+00	
00000000-0000-0000-0000-000000000000	03a05837-b8ed-43e7-a61d-d9b6e6e5c6c8	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-02 16:24:19.318236+00	
00000000-0000-0000-0000-000000000000	14a75a5a-cf84-4760-a006-e6e45a140d68	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-02 17:55:09.14394+00	
00000000-0000-0000-0000-000000000000	77ac0375-62a7-48a7-aae5-4290de81c864	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-02 17:55:09.293319+00	
00000000-0000-0000-0000-000000000000	9c8b8d12-f6c0-40c5-9fe0-d374acd7a239	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-02 20:45:06.905787+00	
00000000-0000-0000-0000-000000000000	f9ffe303-df5f-4c09-8c72-36099fa56b06	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-02 20:45:06.983827+00	
00000000-0000-0000-0000-000000000000	086d33c0-75ce-4e7c-8bdc-ae000d8b9229	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-02 22:05:21.05249+00	
00000000-0000-0000-0000-000000000000	fb1cebe6-ea01-41f5-8dee-acf307fd256f	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-02 22:05:21.100687+00	
00000000-0000-0000-0000-000000000000	f6c0d0b4-6998-4be1-b12e-fc2b9a80efde	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-02 22:05:21.318082+00	
00000000-0000-0000-0000-000000000000	d7545219-632a-4c4d-a0ec-38ef6b8363f7	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-02 23:03:44.116373+00	
00000000-0000-0000-0000-000000000000	597d9b85-7636-4ad2-aa73-972e7dc2328f	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-02 23:03:44.143399+00	
00000000-0000-0000-0000-000000000000	a60fa610-c1f3-40e7-89b1-eed68b9c4ead	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-03 00:11:32.310165+00	
00000000-0000-0000-0000-000000000000	637bbc11-99e0-4d44-bd49-f00336f4463a	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-03 00:11:32.354067+00	
00000000-0000-0000-0000-000000000000	8a995b7b-8611-4e7e-92b1-5d90f38fbc3a	{"action":"logout","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"account"}	2026-01-03 00:23:43.449494+00	
00000000-0000-0000-0000-000000000000	b1a893e8-9bf7-42b7-8c92-37b92d788255	{"action":"login","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-03 00:23:59.459458+00	
00000000-0000-0000-0000-000000000000	2aaf75bd-a27f-4faf-9da3-2a175a39b3c3	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-03 03:22:01.596613+00	
00000000-0000-0000-0000-000000000000	4c849818-d73f-40d2-af34-b9a05dd21cd1	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-03 03:22:01.61725+00	
00000000-0000-0000-0000-000000000000	32124813-7b67-419b-b1be-7f218b6a6070	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-03 11:34:27.41906+00	
00000000-0000-0000-0000-000000000000	f3c94b6c-bb11-42d8-ae61-28e0a5018b71	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-03 11:34:27.908382+00	
00000000-0000-0000-0000-000000000000	8fe25dfd-dc10-41a3-a69b-d86ca22c390d	{"action":"login","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-03 11:34:28.429568+00	
00000000-0000-0000-0000-000000000000	a8be84d3-14e1-4815-9eee-7386d9527390	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-03 13:07:58.582742+00	
00000000-0000-0000-0000-000000000000	ab5ce9f1-6c98-4914-97ff-bd0f10b01fd9	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-03 13:07:58.604051+00	
00000000-0000-0000-0000-000000000000	16bb11d8-0c19-4fa3-a2d3-1776861002ba	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-03 14:28:54.621856+00	
00000000-0000-0000-0000-000000000000	d7023c04-b3bd-4bb1-9325-d1b25b09c11b	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-03 14:28:54.639613+00	
00000000-0000-0000-0000-000000000000	1f20aea2-21e7-4c1d-b8a7-257f10317a11	{"action":"logout","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"account"}	2026-01-03 15:06:41.903435+00	
00000000-0000-0000-0000-000000000000	0e6c8322-c8a3-431c-b23d-9b85891d0631	{"action":"login","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-03 15:11:02.269602+00	
00000000-0000-0000-0000-000000000000	5feb90f3-08c7-496c-932b-59884beec47a	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-03 16:19:05.726705+00	
00000000-0000-0000-0000-000000000000	17d9a99d-0583-4258-8eb6-42436a35a60f	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-03 16:19:05.91871+00	
00000000-0000-0000-0000-000000000000	6df06dad-69b4-4572-a291-fafea373ab99	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-03 17:20:45.468817+00	
00000000-0000-0000-0000-000000000000	afee4374-6767-4624-b0cd-1715af159379	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-03 17:20:45.600404+00	
00000000-0000-0000-0000-000000000000	34bc8306-dc65-4b74-8b2a-ed3f92823413	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-03 18:18:46.118377+00	
00000000-0000-0000-0000-000000000000	3e86f561-bf0d-48c5-b388-8479fcdeb8f9	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-03 18:18:46.135188+00	
00000000-0000-0000-0000-000000000000	536c00c0-1cc2-420a-b748-5292eda683c8	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-03 19:54:08.983902+00	
00000000-0000-0000-0000-000000000000	fc6b9f47-17c5-4d12-8d98-8966c28bd00b	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-03 19:54:09.012375+00	
00000000-0000-0000-0000-000000000000	c409c882-7149-4b6d-a7b1-9d212b29edab	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-03 23:36:28.866719+00	
00000000-0000-0000-0000-000000000000	bae3581c-f9ad-4b53-8c48-f933b4b9ad48	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-03 23:36:28.93655+00	
00000000-0000-0000-0000-000000000000	d63231f7-cd5b-4131-8f0c-6cecf6440aa8	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-04 12:38:54.572798+00	
00000000-0000-0000-0000-000000000000	857e73b4-c03e-4609-b3d0-3ad83c85bee0	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-04 12:38:54.642195+00	
00000000-0000-0000-0000-000000000000	64ff14fa-334d-4ae4-9c1f-05433354ef0c	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-04 13:44:12.24507+00	
00000000-0000-0000-0000-000000000000	e5017bd1-c517-44fe-98a9-fa40e669918d	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-04 13:44:12.286017+00	
00000000-0000-0000-0000-000000000000	1ad8a67d-a079-498e-982d-3caac0e95ba1	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-04 14:45:05.069783+00	
00000000-0000-0000-0000-000000000000	307e6029-139c-4103-8834-256fadf1483c	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-04 14:45:05.093734+00	
00000000-0000-0000-0000-000000000000	a1316b9e-558e-407a-a3d2-0910cafe1f33	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-04 15:45:55.829915+00	
00000000-0000-0000-0000-000000000000	e7ff85e8-4ebb-459e-b22c-9ef7aa86eeca	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-04 15:45:55.859452+00	
00000000-0000-0000-0000-000000000000	01b256b0-f603-4ecf-b121-638a11965581	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-04 16:45:42.141071+00	
00000000-0000-0000-0000-000000000000	10d41016-4bf2-4581-8462-ab7b864702c7	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-04 16:45:42.165105+00	
00000000-0000-0000-0000-000000000000	d6cf8f62-62fa-42dc-94dd-ee561a9872dc	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-04 17:46:39.815306+00	
00000000-0000-0000-0000-000000000000	b6ebadf4-fe1e-44f4-992b-b11d4b0d1b80	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-04 17:46:39.897148+00	
00000000-0000-0000-0000-000000000000	8263bb2d-c032-4d4c-8be1-2eb62476746a	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-04 18:44:49.838077+00	
00000000-0000-0000-0000-000000000000	8a974e99-034f-4805-a8c7-b83b2d8b8cc7	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-04 18:44:49.917399+00	
00000000-0000-0000-0000-000000000000	c81a097a-571a-4de9-9a69-b3522f59de15	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-04 19:44:32.751133+00	
00000000-0000-0000-0000-000000000000	3e18f160-46b6-4a8e-958b-ff8349630974	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-04 19:44:32.773874+00	
00000000-0000-0000-0000-000000000000	13ab6fe7-2f41-4e7f-b0be-187851a1d53a	{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"provider":"email","user_email":"spylma@gmail.com","user_id":"b01000df-8b43-447f-9006-1ae031e07398","user_phone":""}}	2026-01-04 19:53:18.363798+00	
00000000-0000-0000-0000-000000000000	d6852d36-6720-42c3-bb9c-7af94651896d	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-04 20:52:56.443642+00	
00000000-0000-0000-0000-000000000000	6341d165-a548-4521-bfb2-c45372e1ad48	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-04 20:52:56.459812+00	
00000000-0000-0000-0000-000000000000	48bb581f-085f-43ac-81e0-7b5c68ba3cdd	{"action":"user_signedup","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2026-01-04 21:00:33.827389+00	
00000000-0000-0000-0000-000000000000	01ef06fa-ad06-4bf6-8e74-83759fbf8337	{"action":"login","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-04 21:00:33.879743+00	
00000000-0000-0000-0000-000000000000	7d083eb2-8d61-4ca9-8f1f-e39dae9b1fd5	{"action":"user_recovery_requested","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"user"}	2026-01-04 21:00:34.009574+00	
00000000-0000-0000-0000-000000000000	85866666-c5e2-438e-8db9-66bd4778efaa	{"action":"login","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-04 21:03:10.315821+00	
00000000-0000-0000-0000-000000000000	c22eee22-1dba-475b-adb2-6102f91f02cc	{"action":"login","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-04 21:08:47.96365+00	
00000000-0000-0000-0000-000000000000	2d280c00-e092-445a-bc51-3f0d7657b9ec	{"action":"login","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-04 21:09:07.933589+00	
00000000-0000-0000-0000-000000000000	499fcddf-6707-4be5-806d-5b1b6fbc5fac	{"action":"logout","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"account"}	2026-01-04 21:09:31.374707+00	
00000000-0000-0000-0000-000000000000	69330d22-6d71-439d-bbac-1b223845243d	{"action":"login","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-04 21:09:56.758931+00	
00000000-0000-0000-0000-000000000000	6f6669f3-57e7-4a8e-9b8c-f597713f52ce	{"action":"login","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-04 21:14:16.059457+00	
00000000-0000-0000-0000-000000000000	5d684d2a-b3bd-429d-9d69-fb12b3cb79c7	{"action":"logout","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"account"}	2026-01-04 21:21:40.635215+00	
00000000-0000-0000-0000-000000000000	2045b455-4770-4731-95db-d3b7afe9f0a9	{"action":"login","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-04 21:21:43.296217+00	
00000000-0000-0000-0000-000000000000	84cd0ed7-b3f5-450b-bbc3-68f87c5c4dc4	{"action":"logout","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"account"}	2026-01-04 21:25:39.626948+00	
00000000-0000-0000-0000-000000000000	85557ae4-c028-4d41-b281-55f404a15e67	{"action":"login","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-04 21:25:54.810445+00	
00000000-0000-0000-0000-000000000000	5e30a845-f7f4-4462-8546-038f7f663e34	{"action":"logout","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"account"}	2026-01-04 21:40:11.928669+00	
00000000-0000-0000-0000-000000000000	1ab7e9c4-019f-464d-b2c8-7764f46cb641	{"action":"login","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-04 21:40:16.613985+00	
00000000-0000-0000-0000-000000000000	ec199a5b-ae6b-4e53-8a67-6e49c8477b17	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-04 22:38:40.406279+00	
00000000-0000-0000-0000-000000000000	8d58b930-2f29-4edb-8cbb-2419c647e7f2	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-04 22:38:40.454885+00	
00000000-0000-0000-0000-000000000000	6aa8bf48-ad3c-4c90-8b48-418fad6bfdda	{"action":"logout","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"account"}	2026-01-04 22:46:50.495548+00	
00000000-0000-0000-0000-000000000000	f86f3d21-b7f9-4553-a89b-c73e12e3b5fa	{"action":"login","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-04 22:47:13.438786+00	
00000000-0000-0000-0000-000000000000	92024075-17c9-4aee-aa20-4c4d4ad7723b	{"action":"logout","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"account"}	2026-01-04 23:37:32.200819+00	
00000000-0000-0000-0000-000000000000	f0069775-baea-46c3-ad63-84b8afb89ebf	{"action":"login","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-04 23:37:39.989573+00	
00000000-0000-0000-0000-000000000000	67bfbb49-56d5-4509-87ba-6cbff94df905	{"action":"logout","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"account"}	2026-01-04 23:38:08.921697+00	
00000000-0000-0000-0000-000000000000	cd690631-0bd4-4c0a-a730-b3a86249b115	{"action":"login","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-04 23:38:19.720688+00	
00000000-0000-0000-0000-000000000000	383a429d-d53d-4b30-a739-99298f84ee50	{"action":"logout","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"account"}	2026-01-04 23:38:52.278485+00	
00000000-0000-0000-0000-000000000000	04eaff62-07b4-4560-9940-5f09f82416bc	{"action":"login","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-04 23:40:33.995442+00	
00000000-0000-0000-0000-000000000000	9a86fe84-c0e7-4daf-b953-b5257992e93e	{"action":"login","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-04 23:58:59.921033+00	
00000000-0000-0000-0000-000000000000	63143cdb-90e3-4d2b-8d4e-64caa49e6322	{"action":"logout","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"account"}	2026-01-05 00:05:58.076649+00	
00000000-0000-0000-0000-000000000000	552e8b62-7acc-48eb-9911-ef2a5d07ad8e	{"action":"login","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-05 00:06:00.580599+00	
00000000-0000-0000-0000-000000000000	acc320a4-b99d-4e26-9100-9150578302f6	{"action":"logout","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"account"}	2026-01-05 00:13:42.132039+00	
00000000-0000-0000-0000-000000000000	b1813ef6-7df9-492c-843d-ba6a1e6e176f	{"action":"login","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-05 00:14:24.067688+00	
00000000-0000-0000-0000-000000000000	400a0caa-acbc-498f-b1cd-4efb367a7f11	{"action":"logout","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"account"}	2026-01-05 00:14:51.469176+00	
00000000-0000-0000-0000-000000000000	18522b54-561a-4f3d-9114-8ed3bd0614f7	{"action":"login","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-05 00:14:53.714087+00	
00000000-0000-0000-0000-000000000000	da57e67e-002b-4e83-9493-24dd55274b13	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-05 10:59:43.730792+00	
00000000-0000-0000-0000-000000000000	5d4dc6b0-e9ac-4a3d-8d38-e928138116ae	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-05 10:59:44.083656+00	
00000000-0000-0000-0000-000000000000	19be9a47-344e-4311-b7bb-31f120e1d947	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-05 18:00:43.047907+00	
00000000-0000-0000-0000-000000000000	e25606ef-a7e7-4bd8-aa63-656d5b87b0b1	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-05 18:00:43.088303+00	
00000000-0000-0000-0000-000000000000	3c9c4df2-72d3-4636-ae42-4ca3f6fff338	{"action":"logout","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"account"}	2026-01-05 18:19:57.733399+00	
00000000-0000-0000-0000-000000000000	c8b4fb03-94f3-4526-a6ad-01594790b026	{"action":"login","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-05 18:20:20.444008+00	
00000000-0000-0000-0000-000000000000	4706a0a3-c935-4f5f-91a8-c056d481b206	{"action":"logout","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"account"}	2026-01-05 18:20:40.016973+00	
00000000-0000-0000-0000-000000000000	6c8bc771-f439-4dbe-ab44-2b8d45a7a0ea	{"action":"login","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-05 18:20:42.495466+00	
00000000-0000-0000-0000-000000000000	2755f995-bc92-426e-a26e-8d9f563d6286	{"action":"logout","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"account"}	2026-01-05 18:29:23.400696+00	
00000000-0000-0000-0000-000000000000	99594d01-5158-4bae-bc01-bba66bea8a32	{"action":"login","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-05 18:29:39.571041+00	
00000000-0000-0000-0000-000000000000	823e8ff8-fea7-4f87-8fa4-d4333681cee8	{"action":"logout","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"account"}	2026-01-05 18:31:12.592195+00	
00000000-0000-0000-0000-000000000000	2de94a41-34e5-496e-9e37-09e2e0552d9f	{"action":"login","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-05 18:31:31.769339+00	
00000000-0000-0000-0000-000000000000	be8493dc-6c3f-4612-a668-41e142fc705c	{"action":"login","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-05 18:33:21.552164+00	
00000000-0000-0000-0000-000000000000	bd3c7c49-bbd4-4861-8a88-caa92eeafb51	{"action":"login","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-05 18:35:50.854337+00	
00000000-0000-0000-0000-000000000000	67014af2-2c36-4192-8877-300f60fbeea0	{"action":"token_refreshed","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-05 19:41:43.452371+00	
00000000-0000-0000-0000-000000000000	37725cf0-122f-4a70-a803-6c3b0864535e	{"action":"token_revoked","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-05 19:41:43.477833+00	
00000000-0000-0000-0000-000000000000	5e381870-a738-4933-80e3-bd4faa060118	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-05 19:45:32.955004+00	
00000000-0000-0000-0000-000000000000	0c1f6564-1457-4e64-83a4-91ee47e281fe	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-05 19:45:32.961581+00	
00000000-0000-0000-0000-000000000000	8b849c72-1eec-444e-a1de-be5315ba4c6f	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-05 20:44:00.325467+00	
00000000-0000-0000-0000-000000000000	d4aa316d-c1c8-4b2f-9bfc-4298d6a846a4	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-05 20:44:00.337141+00	
00000000-0000-0000-0000-000000000000	74352e54-d25f-4117-90f2-bfba8f76cb66	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-06 01:07:48.567459+00	
00000000-0000-0000-0000-000000000000	795c9888-5b6d-4b82-975c-384d8fa246cc	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-06 01:07:48.577585+00	
00000000-0000-0000-0000-000000000000	33e8eddc-2aa2-4044-9c3e-848a6335ea86	{"action":"token_refreshed","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-06 01:12:28.898466+00	
00000000-0000-0000-0000-000000000000	8b76521b-e1ce-490e-9d0b-c4c202dc35cd	{"action":"token_revoked","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-06 01:12:28.90259+00	
00000000-0000-0000-0000-000000000000	74a72ebf-aa66-457c-956e-e6d80293d843	{"action":"logout","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"account"}	2026-01-06 01:35:44.422858+00	
00000000-0000-0000-0000-000000000000	95eb6578-f57d-4dc5-bf00-a548c60d549a	{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"provider":"email","user_email":"bizuforte@gmail.com","user_id":"33328bdf-9283-4c5f-807b-5799c651d910","user_phone":""}}	2026-01-06 01:40:00.927433+00	
00000000-0000-0000-0000-000000000000	fa37267e-8b1c-45a6-9d42-52cc9e93c38a	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"bizuforte@gmail.com","user_id":"33328bdf-9283-4c5f-807b-5799c651d910","user_phone":""}}	2026-01-06 01:41:31.749922+00	
00000000-0000-0000-0000-000000000000	e0bbba39-0543-48fa-9e5f-0de81db9c8e0	{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"provider":"email","user_email":"bizuforte@gmail.com","user_id":"f3ad00ec-9dc1-477a-a4ac-f996122cf76e","user_phone":""}}	2026-01-06 01:42:11.539849+00	
00000000-0000-0000-0000-000000000000	42458b5e-c917-48eb-aedc-95b4344a6fc4	{"action":"login","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-06 01:46:37.705266+00	
00000000-0000-0000-0000-000000000000	6fe07276-3e46-43ff-a2b8-16216e5c3612	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-06 02:05:55.929577+00	
00000000-0000-0000-0000-000000000000	e1e275ac-99b8-40c0-9738-39132683c9ba	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-06 02:05:55.941148+00	
00000000-0000-0000-0000-000000000000	414f263a-86b5-4a7c-b6c2-d664a0b3ecc3	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-06 10:05:37.606788+00	
00000000-0000-0000-0000-000000000000	076eda47-02d4-410b-b669-1de673982e91	{"action":"token_refreshed","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-06 10:05:37.987706+00	
00000000-0000-0000-0000-000000000000	e4cd3962-0d2b-4b96-8a97-641374fc01c3	{"action":"token_revoked","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-06 10:05:38.052906+00	
00000000-0000-0000-0000-000000000000	6a0700a7-09f3-4991-9c22-3fc8a51ca9d2	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-06 10:05:38.083584+00	
00000000-0000-0000-0000-000000000000	039452e3-e606-4932-9b40-1ac435372475	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-06 15:47:15.005597+00	
00000000-0000-0000-0000-000000000000	d50fd9ba-7247-400c-909b-6e7d6aa865c1	{"action":"token_refreshed","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-06 15:47:15.24071+00	
00000000-0000-0000-0000-000000000000	948970a6-59f3-464e-a702-3fa59bb6f0a7	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-06 15:47:15.257073+00	
00000000-0000-0000-0000-000000000000	744aa97b-9390-4e0d-ae4f-50207b8e3bf0	{"action":"token_revoked","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-06 15:47:15.256608+00	
00000000-0000-0000-0000-000000000000	a1a276d2-3002-4aad-bdc9-6169042c1c20	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-06 16:46:37.63007+00	
00000000-0000-0000-0000-000000000000	6e6c5f6d-25a6-4310-988a-482a5c7eee77	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-06 16:46:37.714017+00	
00000000-0000-0000-0000-000000000000	460a11c1-d2d3-415f-a495-141412dcbe97	{"action":"token_refreshed","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-06 17:07:34.990573+00	
00000000-0000-0000-0000-000000000000	2ceb8862-e94e-4d50-8768-04ba4bb2573f	{"action":"token_revoked","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-06 17:07:34.999345+00	
00000000-0000-0000-0000-000000000000	1d3ae3c7-0d08-4e55-a3da-fc10748c1691	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-06 17:45:18.743951+00	
00000000-0000-0000-0000-000000000000	466305da-91fa-4832-badd-a44923edfaaf	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-06 17:45:18.759576+00	
00000000-0000-0000-0000-000000000000	f3d7ab5c-f243-494e-a913-907e21dbe58f	{"action":"token_refreshed","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-06 18:35:44.740985+00	
00000000-0000-0000-0000-000000000000	7d3d24ce-4b41-420a-b28a-8ada1498337d	{"action":"token_revoked","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-06 18:35:44.762681+00	
00000000-0000-0000-0000-000000000000	292558f2-aa21-49a0-bf4c-55571352deea	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-06 18:45:15.758622+00	
00000000-0000-0000-0000-000000000000	c7c9cb15-d848-4ead-a8bd-806eacf8782a	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-06 18:45:15.763453+00	
00000000-0000-0000-0000-000000000000	37f0cc61-1c05-49e9-b738-61605f99f65c	{"action":"token_refreshed","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-06 19:34:06.089584+00	
00000000-0000-0000-0000-000000000000	700ab05a-5522-4805-aaae-51d03fc62f52	{"action":"token_revoked","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-06 19:34:06.134494+00	
00000000-0000-0000-0000-000000000000	ea48fead-72f6-40f7-8d65-7973b6d7f25a	{"action":"token_refreshed","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-06 21:52:03.52366+00	
00000000-0000-0000-0000-000000000000	2d29bf8f-8fc1-46b3-a12d-9e0ae8ee7bf4	{"action":"token_revoked","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-06 21:52:03.594355+00	
00000000-0000-0000-0000-000000000000	db5f7ab2-04dc-40e6-8b8d-00780c2c15d5	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-06 21:52:19.418684+00	
00000000-0000-0000-0000-000000000000	f485548d-668f-475f-9aab-46830515725d	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-06 21:52:19.425848+00	
00000000-0000-0000-0000-000000000000	96c756eb-4891-4156-a7cb-b46e780cc121	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-07 00:30:37.712085+00	
00000000-0000-0000-0000-000000000000	322dff94-d8da-4ca5-9407-225edf831302	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-07 00:30:37.722794+00	
00000000-0000-0000-0000-000000000000	69bab89a-e69f-433e-ae57-b36d65b80808	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-07 01:29:26.823212+00	
00000000-0000-0000-0000-000000000000	655d7da6-9072-490a-8ac5-643980a2e0ab	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-07 01:29:26.851622+00	
00000000-0000-0000-0000-000000000000	bfc4b348-4933-409e-84d7-47308f60bf34	{"action":"token_refreshed","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-07 01:35:12.335525+00	
00000000-0000-0000-0000-000000000000	97e56e1f-6bcd-4065-8149-34fb0a248979	{"action":"token_revoked","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-07 01:35:12.339146+00	
00000000-0000-0000-0000-000000000000	0b55fe5c-1301-4169-abc7-b3bd8aa75f97	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-07 16:05:10.626658+00	
00000000-0000-0000-0000-000000000000	047f692f-e8db-439f-8985-c5d591db5b89	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-07 16:05:10.718453+00	
00000000-0000-0000-0000-000000000000	31ba8c21-af35-4742-9839-b3be6d112b5a	{"action":"token_refreshed","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-07 16:55:04.540258+00	
00000000-0000-0000-0000-000000000000	c9ef135c-cdb6-4683-b15a-c8d22e7fe7e1	{"action":"token_revoked","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-07 16:55:04.739542+00	
00000000-0000-0000-0000-000000000000	aec4132a-7d2b-4076-9d04-ca666884c250	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-07 17:08:41.798963+00	
00000000-0000-0000-0000-000000000000	119779ff-1f79-4476-a1f8-70e5eb03d3d6	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-07 17:08:41.897929+00	
00000000-0000-0000-0000-000000000000	97b09b49-c31b-4f4e-88d5-ef9ca37a99b2	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-07 18:12:37.561634+00	
00000000-0000-0000-0000-000000000000	5af3c9d4-886c-4de7-a8ae-3927bd87c281	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-07 18:12:37.583139+00	
00000000-0000-0000-0000-000000000000	42293de5-1c73-4c4a-be70-230c137751a1	{"action":"token_refreshed","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-07 18:27:43.490268+00	
00000000-0000-0000-0000-000000000000	2a9676d9-7d5f-48d8-905d-77d17cb43476	{"action":"token_revoked","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-07 18:27:43.539889+00	
00000000-0000-0000-0000-000000000000	b849fd3d-7dce-4048-b5bd-75ea17d612dc	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-07 19:13:15.064591+00	
00000000-0000-0000-0000-000000000000	a2f17911-7a00-4da4-a790-7ab0fe04abfb	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-07 19:13:15.09042+00	
00000000-0000-0000-0000-000000000000	28de7d93-5e16-4f7d-b270-8df7907e0660	{"action":"token_refreshed","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-07 19:32:11.368503+00	
00000000-0000-0000-0000-000000000000	f46bb359-f97a-4f84-8120-9d9a56897a9a	{"action":"token_revoked","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-07 19:32:11.407914+00	
00000000-0000-0000-0000-000000000000	8d70de72-f97c-4129-9a44-48f5a37b5ad5	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-07 20:12:01.459984+00	
00000000-0000-0000-0000-000000000000	053bdcc4-57a5-40f6-8c6d-1328c3caae0f	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-07 20:12:01.493004+00	
00000000-0000-0000-0000-000000000000	821b5743-7dd9-4565-8e09-b92722672d70	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-07 22:59:17.617835+00	
00000000-0000-0000-0000-000000000000	5040ed2c-91c1-44a7-9ab6-511d818c7289	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-07 22:59:17.634295+00	
00000000-0000-0000-0000-000000000000	ad32112d-5548-4102-9812-404ec0562061	{"action":"token_refreshed","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-07 23:06:54.111436+00	
00000000-0000-0000-0000-000000000000	a5878cb3-3898-4d57-8f03-d95e75b8f5f7	{"action":"token_revoked","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-07 23:06:54.133645+00	
00000000-0000-0000-0000-000000000000	256bd9f1-fbab-4096-9d30-5dbf19cb8581	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-07 23:57:58.954865+00	
00000000-0000-0000-0000-000000000000	f8782c32-9cee-49d9-a2e1-83625802558d	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-07 23:57:58.993004+00	
00000000-0000-0000-0000-000000000000	5b13af5b-b699-4628-a434-d8f6d05f78b4	{"action":"token_refreshed","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-08 00:08:14.055245+00	
00000000-0000-0000-0000-000000000000	7eb15e2e-89b1-4456-be76-6eb3b0329931	{"action":"token_revoked","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-08 00:08:14.355993+00	
00000000-0000-0000-0000-000000000000	b2ff7fb5-1acd-4802-b285-7a50ed13df4a	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-08 00:56:04.090868+00	
00000000-0000-0000-0000-000000000000	30cd8b80-06ed-4598-ac20-c70709196adb	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-08 00:56:04.165428+00	
00000000-0000-0000-0000-000000000000	fc4dd1a0-5e96-4563-b625-55918798739b	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-08 16:10:17.515662+00	
00000000-0000-0000-0000-000000000000	a677f062-6981-455a-b2de-14d4fa77efab	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-08 16:10:17.911826+00	
00000000-0000-0000-0000-000000000000	f5ea16f3-205b-4e15-8bcd-7145cc3192b7	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-08 21:47:18.451621+00	
00000000-0000-0000-0000-000000000000	d6b7c39b-2ac2-4518-99c4-a4cc08cbc35a	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-08 21:47:18.557687+00	
00000000-0000-0000-0000-000000000000	42804c0d-fbf4-4318-8707-9f83da45bad4	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-08 23:09:26.792522+00	
00000000-0000-0000-0000-000000000000	d2f84557-2e78-4431-8d3c-6f39eb87abb9	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-08 23:09:27.020595+00	
00000000-0000-0000-0000-000000000000	fce3b5b6-3c68-4a45-a4a0-8beaaf2ff0e7	{"action":"login","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-08 23:10:13.298597+00	
00000000-0000-0000-0000-000000000000	50286564-b28d-4ef4-bd7c-7577e3d53b59	{"action":"token_refreshed","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-08 23:15:57.005901+00	
00000000-0000-0000-0000-000000000000	c79d36f5-aca9-4b97-a4b1-6537d343ec68	{"action":"token_revoked","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-08 23:15:57.228027+00	
00000000-0000-0000-0000-000000000000	e02c4ac9-73fb-4e8b-b591-70cdaed3bd2a	{"action":"token_refreshed","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-08 23:15:58.488926+00	
00000000-0000-0000-0000-000000000000	47c68431-ee1e-485d-b0a7-7e7ba6fcd0f6	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-09 01:36:41.585598+00	
00000000-0000-0000-0000-000000000000	9918cf4b-38ee-499e-8616-3db4ba2048ae	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-09 01:36:41.74876+00	
00000000-0000-0000-0000-000000000000	45d8320d-76e7-4785-884f-3fc7501473d9	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-09 01:36:41.953713+00	
00000000-0000-0000-0000-000000000000	3f2ebffb-8969-43fb-9f85-c922b9cf77a2	{"action":"token_refreshed","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-09 01:37:00.504644+00	
00000000-0000-0000-0000-000000000000	c3982517-d72a-4c9e-a793-adc64c9db60c	{"action":"token_revoked","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-09 01:37:00.513726+00	
00000000-0000-0000-0000-000000000000	5ec2d5ac-d3b1-4a55-ab4c-c7aff5832b60	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-09 16:03:51.040701+00	
00000000-0000-0000-0000-000000000000	b1f615e9-bc91-4724-921e-e841044acfd7	{"action":"token_refreshed","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-09 16:03:51.040693+00	
00000000-0000-0000-0000-000000000000	180b6548-1020-4b7b-8837-e02c22991fe8	{"action":"token_revoked","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-09 16:03:51.351803+00	
00000000-0000-0000-0000-000000000000	72b2f079-0b51-4bc8-9b08-521c181f0250	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-09 16:03:51.351882+00	
00000000-0000-0000-0000-000000000000	48125548-ca2f-4b6c-b92e-72e13e301438	{"action":"login","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-09 16:09:27.933884+00	
00000000-0000-0000-0000-000000000000	3db0c900-af23-434b-8271-d62e8df252ac	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-09 17:35:04.08906+00	
00000000-0000-0000-0000-000000000000	ce8a2d31-22de-466f-8222-9ee671fb799f	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-09 17:35:04.107106+00	
00000000-0000-0000-0000-000000000000	29ff2f6d-7070-4b46-9590-17e23ec71979	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-09 19:13:07.327982+00	
00000000-0000-0000-0000-000000000000	61dc842e-8453-446d-ba67-76a08f317335	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-09 19:13:07.334874+00	
00000000-0000-0000-0000-000000000000	c25bb705-d28a-4496-a6e0-14268a7f029f	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-09 20:18:29.359429+00	
00000000-0000-0000-0000-000000000000	740e6e91-60aa-4099-95a5-4b9a721508b6	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-09 20:18:29.367822+00	
00000000-0000-0000-0000-000000000000	8cb5eb50-312c-4a42-bf44-22cfb8e3228b	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-09 21:16:57.755009+00	
00000000-0000-0000-0000-000000000000	4df6d185-6171-49c1-a0cf-9d745e33ad6f	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-09 21:16:57.761286+00	
00000000-0000-0000-0000-000000000000	2607220f-4ff8-4c85-bf29-f2fb08913996	{"action":"logout","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"account"}	2026-01-09 21:42:00.645049+00	
00000000-0000-0000-0000-000000000000	50e39dff-4cf1-456f-a68a-81cc4be2b38a	{"action":"login","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-09 21:42:13.787926+00	
00000000-0000-0000-0000-000000000000	293a99f1-ef2a-495a-b5f7-dbb0114a2be1	{"action":"token_refreshed","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-09 21:42:40.948647+00	
00000000-0000-0000-0000-000000000000	b51d5dea-1a92-4ae8-93ef-d4e4a2bac6bf	{"action":"token_revoked","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-09 21:42:40.961029+00	
00000000-0000-0000-0000-000000000000	2c72887c-e59e-4bda-95e1-833c58309686	{"action":"logout","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"account"}	2026-01-09 21:42:52.190539+00	
00000000-0000-0000-0000-000000000000	2471e379-ae1e-469e-99b0-2b995b64dca9	{"action":"login","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-09 21:43:33.346133+00	
00000000-0000-0000-0000-000000000000	6ea650e4-38d7-41f2-ae7c-d7637311c95e	{"action":"token_refreshed","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-09 23:37:30.519566+00	
00000000-0000-0000-0000-000000000000	6b1dcf2f-7a46-4fc7-90bb-93e2c5a16847	{"action":"token_revoked","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-09 23:37:30.523102+00	
00000000-0000-0000-0000-000000000000	c7e1615e-e7b7-44fc-a16f-654f47b7dc41	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-09 23:37:38.243545+00	
00000000-0000-0000-0000-000000000000	747194cf-daee-4906-99d9-a9a584c40dc7	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-09 23:37:38.24695+00	
00000000-0000-0000-0000-000000000000	1fada2cf-5b68-4899-a85c-12856e60c161	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-10 10:24:27.001448+00	
00000000-0000-0000-0000-000000000000	9aa2ad7f-a43f-49f8-9388-eb4077caf8b2	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-10 10:24:27.007869+00	
00000000-0000-0000-0000-000000000000	eda876c3-3a99-460d-91bc-31007d79ff07	{"action":"token_refreshed","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-10 10:25:53.575556+00	
00000000-0000-0000-0000-000000000000	a10bdee2-ef92-4822-8de0-16f8bbfe02e3	{"action":"token_revoked","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-10 10:25:53.580011+00	
00000000-0000-0000-0000-000000000000	1f2289f2-87b4-4df8-bd05-b78ed2087252	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-10 11:23:23.213394+00	
00000000-0000-0000-0000-000000000000	a8ea2f98-99de-4dff-b669-22c41cb47c45	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-10 11:23:23.218446+00	
00000000-0000-0000-0000-000000000000	02b239a5-ac98-4854-a9bb-a7055df39a22	{"action":"token_refreshed","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-10 11:28:23.403735+00	
00000000-0000-0000-0000-000000000000	eeade0e5-77cd-4164-a053-53d643f747f3	{"action":"token_revoked","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-10 11:28:23.406602+00	
00000000-0000-0000-0000-000000000000	913d88c7-ad07-4028-86cd-6815cf9e919f	{"action":"token_refreshed","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-10 12:27:03.47154+00	
00000000-0000-0000-0000-000000000000	d33cf625-471b-4e29-a232-17d6c83b1562	{"action":"token_revoked","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-10 12:27:03.474531+00	
00000000-0000-0000-0000-000000000000	b5782c01-0fce-4c85-8a12-87f671ffb547	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-10 13:07:38.159518+00	
00000000-0000-0000-0000-000000000000	12098a01-f019-41a6-832e-93fc6c7923d2	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-10 13:07:38.166593+00	
00000000-0000-0000-0000-000000000000	23c38cb6-9d94-49ab-adc9-1739c8711211	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-10 13:08:12.842954+00	
00000000-0000-0000-0000-000000000000	a64af51a-b652-4ada-aa33-8a57b33f094e	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-10 13:10:06.260387+00	
00000000-0000-0000-0000-000000000000	abbfc6c0-db2e-4a96-bcf4-6415d90ed7e8	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-10 13:57:17.419206+00	
00000000-0000-0000-0000-000000000000	88c27294-6c32-4631-b404-ffc2f2593393	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-10 13:59:26.115024+00	
00000000-0000-0000-0000-000000000000	55492a68-26e8-40d7-8c10-462b4da3d55f	{"action":"token_refreshed","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-10 14:12:22.307106+00	
00000000-0000-0000-0000-000000000000	22ecfdc0-c728-495b-abdd-c579405ac152	{"action":"token_revoked","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-10 14:12:22.310449+00	
00000000-0000-0000-0000-000000000000	08914127-f921-46ad-b15e-af873bd73488	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-10 14:58:21.592177+00	
00000000-0000-0000-0000-000000000000	b91e547f-f61a-4001-b35c-238684b4b6f8	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-10 14:58:21.611353+00	
00000000-0000-0000-0000-000000000000	23fdecab-e6c8-4293-a1f3-c26417821307	{"action":"login","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-10 14:58:27.481506+00	
00000000-0000-0000-0000-000000000000	b3260a0e-1e16-43e7-b299-8118dafee354	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-10 15:56:31.895756+00	
00000000-0000-0000-0000-000000000000	20077f84-1ac8-487b-a4dc-0abcee29205c	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-10 15:56:31.90082+00	
00000000-0000-0000-0000-000000000000	d546eb76-fe13-464b-8d61-defeb08d955d	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-10 16:54:50.411968+00	
00000000-0000-0000-0000-000000000000	db0c61b4-fedc-4d77-a807-081845840dda	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-10 16:54:50.414133+00	
00000000-0000-0000-0000-000000000000	450c30e2-68ca-4ce9-b64e-0cfa8b7ae483	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-10 18:35:41.207822+00	
00000000-0000-0000-0000-000000000000	ea1cdb6a-04af-4267-99c3-fab54ba8e66f	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-10 18:35:41.214368+00	
00000000-0000-0000-0000-000000000000	2c1b7cfe-a13c-42fa-8460-d88eaa6501f0	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-10 19:34:04.097405+00	
00000000-0000-0000-0000-000000000000	6ccd516b-b378-4807-858a-1de3ccfa46e1	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-10 19:34:04.103351+00	
00000000-0000-0000-0000-000000000000	c20adf2a-4130-48a1-856c-9a428a0e1f20	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-10 20:45:37.089847+00	
00000000-0000-0000-0000-000000000000	0e62e7c9-6964-4622-989e-96edc0f5422b	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-10 20:45:37.096022+00	
00000000-0000-0000-0000-000000000000	1ae595ae-79a0-418d-995d-2ca317dfed46	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-17 20:14:49.063675+00	
00000000-0000-0000-0000-000000000000	3d32099f-139b-4dfb-a938-916ef149d50f	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-17 20:14:49.12428+00	
00000000-0000-0000-0000-000000000000	adfcc02d-39f6-4c49-a6b6-d78ecabb0668	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-17 20:14:50.230556+00	
00000000-0000-0000-0000-000000000000	483c8254-e63b-4be7-bfd0-7ba0513c4eec	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-17 20:15:12.728025+00	
00000000-0000-0000-0000-000000000000	6547028f-5087-4fa2-9fe6-48152c71e89c	{"action":"token_refreshed","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-17 20:21:08.574989+00	
00000000-0000-0000-0000-000000000000	0cc519f1-15c8-4e2d-9e24-c5e043b5ad6e	{"action":"token_revoked","actor_id":"b01000df-8b43-447f-9006-1ae031e07398","actor_username":"spylma@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-17 20:21:08.647317+00	
00000000-0000-0000-0000-000000000000	5ceb2d65-e060-4441-9bd5-8f2117219f20	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-18 11:37:28.536731+00	
00000000-0000-0000-0000-000000000000	3f90f2b7-9bbc-4866-bd1c-46d69e7f7133	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-18 11:37:28.565124+00	
00000000-0000-0000-0000-000000000000	1ae7a74d-a9a7-4fc3-bfd9-c87bf0a63136	{"action":"login","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-19 00:18:20.962248+00	
00000000-0000-0000-0000-000000000000	b765cbe7-a5c6-405c-826a-0d129c429893	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-19 01:17:08.113479+00	
00000000-0000-0000-0000-000000000000	c4272464-151a-4ed8-94ed-4192cfa19b77	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-19 01:17:08.139781+00	
00000000-0000-0000-0000-000000000000	627f18c7-6903-443d-b526-d026c959be0d	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-19 16:48:50.39195+00	
00000000-0000-0000-0000-000000000000	50380551-9484-402a-91a0-959d06bd0cef	{"action":"token_revoked","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-19 16:48:50.45568+00	
00000000-0000-0000-0000-000000000000	cf33b16c-afc4-4281-b276-b1d1b5b2e6c1	{"action":"token_refreshed","actor_id":"353dc6dd-22af-4527-b9a5-71ce76e909a8","actor_username":"admin@p2p.com","actor_via_sso":false,"log_type":"token"}	2026-01-19 16:48:51.628699+00	
\.


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.flow_state (id, user_id, auth_code, code_challenge_method, code_challenge, provider_type, provider_access_token, provider_refresh_token, created_at, updated_at, authentication_method, auth_code_issued_at) FROM stdin;
\.


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id) FROM stdin;
353dc6dd-22af-4527-b9a5-71ce76e909a8	353dc6dd-22af-4527-b9a5-71ce76e909a8	{"sub": "353dc6dd-22af-4527-b9a5-71ce76e909a8", "email": "admin@p2p.com", "email_verified": false, "phone_verified": false}	email	2025-12-30 19:16:08.878112+00	2025-12-30 19:16:08.879147+00	2025-12-30 19:16:08.879147+00	bd1c91f7-6090-4eda-8fbb-af0dc3a10ef1
b01000df-8b43-447f-9006-1ae031e07398	b01000df-8b43-447f-9006-1ae031e07398	{"sub": "b01000df-8b43-447f-9006-1ae031e07398", "email": "spylma@gmail.com", "email_verified": false, "phone_verified": false}	email	2026-01-04 19:53:18.349367+00	2026-01-04 19:53:18.349596+00	2026-01-04 19:53:18.349596+00	cabf1ee9-c011-448c-bbfa-f87c570ec4d3
f3ad00ec-9dc1-477a-a4ac-f996122cf76e	f3ad00ec-9dc1-477a-a4ac-f996122cf76e	{"sub": "f3ad00ec-9dc1-477a-a4ac-f996122cf76e", "email": "bizuforte@gmail.com", "email_verified": false, "phone_verified": false}	email	2026-01-06 01:42:11.536457+00	2026-01-06 01:42:11.536533+00	2026-01-06 01:42:11.536533+00	e0641faa-d0dd-47b9-af92-bf9fcf827d8f
\.


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.instances (id, uuid, raw_base_config, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_amr_claims (session_id, created_at, updated_at, authentication_method, id) FROM stdin;
843b3431-4e43-4bf7-af75-f2f00c790a3a	2026-01-09 21:42:13.820239+00	2026-01-09 21:42:13.820239+00	password	18262356-b615-4430-8401-e3967e89e939
5d16fb80-7500-4093-b060-e1adb3772570	2026-01-09 21:43:33.357258+00	2026-01-09 21:43:33.357258+00	password	29c364f3-f223-4750-8d94-232779cf687b
aa1ca14f-be0c-423a-b6e8-e9e4a09e1303	2026-01-10 14:58:27.591366+00	2026-01-10 14:58:27.591366+00	password	cac09bb7-3cfa-4112-9311-b9fbf227dd4b
1e355e88-a0b0-48d7-9c32-dd6c4c5b97e7	2026-01-19 00:18:21.119784+00	2026-01-19 00:18:21.119784+00	password	901a2624-9457-4442-92bb-9b0b2744cef9
\.


--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_challenges (id, factor_id, created_at, verified_at, ip_address, otp_code, web_authn_session_data) FROM stdin;
\.


--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_factors (id, user_id, friendly_name, factor_type, status, created_at, updated_at, secret, phone, last_challenged_at, web_authn_credential, web_authn_aaguid, last_webauthn_challenge_data) FROM stdin;
\.


--
-- Data for Name: oauth_authorizations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_authorizations (id, authorization_id, client_id, user_id, redirect_uri, scope, state, resource, code_challenge, code_challenge_method, response_type, status, authorization_code, created_at, expires_at, approved_at, nonce) FROM stdin;
\.


--
-- Data for Name: oauth_client_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_client_states (id, provider_type, code_verifier, created_at) FROM stdin;
\.


--
-- Data for Name: oauth_clients; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_clients (id, client_secret_hash, registration_type, redirect_uris, grant_types, client_name, client_uri, logo_uri, created_at, updated_at, deleted_at, client_type) FROM stdin;
\.


--
-- Data for Name: oauth_consents; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_consents (id, user_id, client_id, scopes, granted_at, revoked_at) FROM stdin;
\.


--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.one_time_tokens (id, user_id, token_type, token_hash, relates_to, created_at, updated_at) FROM stdin;
e9855074-49aa-4103-811b-8baf2161c920	353dc6dd-22af-4527-b9a5-71ce76e909a8	recovery_token	e69bf8fab9dd61cfb247264b85d576e86704198c4722ac27e6334603	admin@p2p.com	2025-12-30 19:23:52.207746	2025-12-30 19:23:52.207746
e90632d5-0db4-4a66-a2b6-a46351d6309f	b01000df-8b43-447f-9006-1ae031e07398	recovery_token	55dcfaf0fe22f698368dd0455edefe3d8eb6b41f5d3a727fe29c7eb5	spylma@gmail.com	2026-01-04 21:00:34.28084	2026-01-04 21:00:34.28084
\.


--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.refresh_tokens (instance_id, id, token, user_id, revoked, created_at, updated_at, parent, session_id) FROM stdin;
00000000-0000-0000-0000-000000000000	225	lqdqslbvlnpr	353dc6dd-22af-4527-b9a5-71ce76e909a8	t	2026-01-09 21:42:13.815836+00	2026-01-09 23:37:38.24932+00	\N	843b3431-4e43-4bf7-af75-f2f00c790a3a
00000000-0000-0000-0000-000000000000	229	ywiwxjxlchlr	353dc6dd-22af-4527-b9a5-71ce76e909a8	t	2026-01-09 23:37:38.251331+00	2026-01-10 10:24:27.010324+00	lqdqslbvlnpr	843b3431-4e43-4bf7-af75-f2f00c790a3a
00000000-0000-0000-0000-000000000000	228	wc5hzt7ngosz	b01000df-8b43-447f-9006-1ae031e07398	t	2026-01-09 23:37:30.534548+00	2026-01-10 10:25:53.581997+00	j5ehtbvlnddp	5d16fb80-7500-4093-b060-e1adb3772570
00000000-0000-0000-0000-000000000000	230	lid27buqutdc	353dc6dd-22af-4527-b9a5-71ce76e909a8	t	2026-01-10 10:24:27.012666+00	2026-01-10 11:23:23.220659+00	ywiwxjxlchlr	843b3431-4e43-4bf7-af75-f2f00c790a3a
00000000-0000-0000-0000-000000000000	231	nm3xk7shns4y	b01000df-8b43-447f-9006-1ae031e07398	t	2026-01-10 10:25:53.58402+00	2026-01-10 11:28:23.408414+00	wc5hzt7ngosz	5d16fb80-7500-4093-b060-e1adb3772570
00000000-0000-0000-0000-000000000000	233	vic4abhox2fl	b01000df-8b43-447f-9006-1ae031e07398	t	2026-01-10 11:28:23.410295+00	2026-01-10 12:27:03.477106+00	nm3xk7shns4y	5d16fb80-7500-4093-b060-e1adb3772570
00000000-0000-0000-0000-000000000000	232	nov6je47dzjn	353dc6dd-22af-4527-b9a5-71ce76e909a8	t	2026-01-10 11:23:23.224523+00	2026-01-10 13:07:38.16951+00	lid27buqutdc	843b3431-4e43-4bf7-af75-f2f00c790a3a
00000000-0000-0000-0000-000000000000	234	bbzk4vnjmaga	b01000df-8b43-447f-9006-1ae031e07398	t	2026-01-10 12:27:03.479108+00	2026-01-10 14:12:22.312028+00	vic4abhox2fl	5d16fb80-7500-4093-b060-e1adb3772570
00000000-0000-0000-0000-000000000000	235	g65pn2jx7ioe	353dc6dd-22af-4527-b9a5-71ce76e909a8	t	2026-01-10 13:07:38.172226+00	2026-01-10 14:58:21.612779+00	nov6je47dzjn	843b3431-4e43-4bf7-af75-f2f00c790a3a
00000000-0000-0000-0000-000000000000	237	4v2w3czi36j7	353dc6dd-22af-4527-b9a5-71ce76e909a8	f	2026-01-10 14:58:21.615976+00	2026-01-10 14:58:21.615976+00	g65pn2jx7ioe	843b3431-4e43-4bf7-af75-f2f00c790a3a
00000000-0000-0000-0000-000000000000	238	viwkaw7sccve	353dc6dd-22af-4527-b9a5-71ce76e909a8	t	2026-01-10 14:58:27.570894+00	2026-01-10 15:56:31.902936+00	\N	aa1ca14f-be0c-423a-b6e8-e9e4a09e1303
00000000-0000-0000-0000-000000000000	239	j67h7d5r45my	353dc6dd-22af-4527-b9a5-71ce76e909a8	t	2026-01-10 15:56:31.906436+00	2026-01-10 16:54:50.415697+00	viwkaw7sccve	aa1ca14f-be0c-423a-b6e8-e9e4a09e1303
00000000-0000-0000-0000-000000000000	240	3oon6yk7gqs4	353dc6dd-22af-4527-b9a5-71ce76e909a8	t	2026-01-10 16:54:50.417207+00	2026-01-10 18:35:41.217389+00	j67h7d5r45my	aa1ca14f-be0c-423a-b6e8-e9e4a09e1303
00000000-0000-0000-0000-000000000000	241	bmgdwesyufe7	353dc6dd-22af-4527-b9a5-71ce76e909a8	t	2026-01-10 18:35:41.221655+00	2026-01-10 19:34:04.105465+00	3oon6yk7gqs4	aa1ca14f-be0c-423a-b6e8-e9e4a09e1303
00000000-0000-0000-0000-000000000000	242	f6qptwnmwg6u	353dc6dd-22af-4527-b9a5-71ce76e909a8	t	2026-01-10 19:34:04.10978+00	2026-01-10 20:45:37.098656+00	bmgdwesyufe7	aa1ca14f-be0c-423a-b6e8-e9e4a09e1303
00000000-0000-0000-0000-000000000000	243	owd4bvypumin	353dc6dd-22af-4527-b9a5-71ce76e909a8	t	2026-01-10 20:45:37.104447+00	2026-01-17 20:14:49.134294+00	f6qptwnmwg6u	aa1ca14f-be0c-423a-b6e8-e9e4a09e1303
00000000-0000-0000-0000-000000000000	236	tag7djohl5df	b01000df-8b43-447f-9006-1ae031e07398	t	2026-01-10 14:12:22.318486+00	2026-01-17 20:21:08.668446+00	bbzk4vnjmaga	5d16fb80-7500-4093-b060-e1adb3772570
00000000-0000-0000-0000-000000000000	245	tmv6uwbdf7uv	b01000df-8b43-447f-9006-1ae031e07398	f	2026-01-17 20:21:08.780047+00	2026-01-17 20:21:08.780047+00	tag7djohl5df	5d16fb80-7500-4093-b060-e1adb3772570
00000000-0000-0000-0000-000000000000	244	j4oc5si2c454	353dc6dd-22af-4527-b9a5-71ce76e909a8	t	2026-01-17 20:14:49.173116+00	2026-01-18 11:37:28.569182+00	owd4bvypumin	aa1ca14f-be0c-423a-b6e8-e9e4a09e1303
00000000-0000-0000-0000-000000000000	246	cqotvucwmver	353dc6dd-22af-4527-b9a5-71ce76e909a8	f	2026-01-18 11:37:28.57424+00	2026-01-18 11:37:28.57424+00	j4oc5si2c454	aa1ca14f-be0c-423a-b6e8-e9e4a09e1303
00000000-0000-0000-0000-000000000000	247	pdt5ycwfzwgh	353dc6dd-22af-4527-b9a5-71ce76e909a8	t	2026-01-19 00:18:21.086534+00	2026-01-19 01:17:08.142634+00	\N	1e355e88-a0b0-48d7-9c32-dd6c4c5b97e7
00000000-0000-0000-0000-000000000000	248	mlhy6edc2c5x	353dc6dd-22af-4527-b9a5-71ce76e909a8	t	2026-01-19 01:17:08.163906+00	2026-01-19 16:48:50.46291+00	pdt5ycwfzwgh	1e355e88-a0b0-48d7-9c32-dd6c4c5b97e7
00000000-0000-0000-0000-000000000000	249	dxxzgtcboscl	353dc6dd-22af-4527-b9a5-71ce76e909a8	f	2026-01-19 16:48:50.514665+00	2026-01-19 16:48:50.514665+00	mlhy6edc2c5x	1e355e88-a0b0-48d7-9c32-dd6c4c5b97e7
00000000-0000-0000-0000-000000000000	227	j5ehtbvlnddp	b01000df-8b43-447f-9006-1ae031e07398	t	2026-01-09 21:43:33.353133+00	2026-01-09 23:37:30.532047+00	\N	5d16fb80-7500-4093-b060-e1adb3772570
\.


--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_providers (id, sso_provider_id, entity_id, metadata_xml, metadata_url, attribute_mapping, created_at, updated_at, name_id_format) FROM stdin;
\.


--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_relay_states (id, sso_provider_id, request_id, for_email, redirect_to, created_at, updated_at, flow_state_id) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.schema_migrations (version) FROM stdin;
20171026211738
20171026211808
20171026211834
20180103212743
20180108183307
20180119214651
20180125194653
00
20210710035447
20210722035447
20210730183235
20210909172000
20210927181326
20211122151130
20211124214934
20211202183645
20220114185221
20220114185340
20220224000811
20220323170000
20220429102000
20220531120530
20220614074223
20220811173540
20221003041349
20221003041400
20221011041400
20221020193600
20221021073300
20221021082433
20221027105023
20221114143122
20221114143410
20221125140132
20221208132122
20221215195500
20221215195800
20221215195900
20230116124310
20230116124412
20230131181311
20230322519590
20230402418590
20230411005111
20230508135423
20230523124323
20230818113222
20230914180801
20231027141322
20231114161723
20231117164230
20240115144230
20240214120130
20240306115329
20240314092811
20240427152123
20240612123726
20240729123726
20240802193726
20240806073726
20241009103726
20250717082212
20250731150234
20250804100000
20250901200500
20250903112500
20250904133000
20250925093508
20251007112900
20251104100000
20251111201300
20251201000000
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sessions (id, user_id, created_at, updated_at, factor_id, aal, not_after, refreshed_at, user_agent, ip, tag, oauth_client_id, refresh_token_hmac_key, refresh_token_counter, scopes) FROM stdin;
843b3431-4e43-4bf7-af75-f2f00c790a3a	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 21:42:13.793945+00	2026-01-10 14:58:21.646149+00	\N	aal1	\N	2026-01-10 14:58:21.645916	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:146.0) Gecko/20100101 Firefox/146.0	172.18.0.1	\N	\N	\N	\N	\N
5d16fb80-7500-4093-b060-e1adb3772570	b01000df-8b43-447f-9006-1ae031e07398	2026-01-09 21:43:33.349095+00	2026-01-17 20:21:08.893146+00	\N	aal1	\N	2026-01-17 20:21:08.889823	Next.js Middleware	172.18.0.1	\N	\N	\N	\N	\N
aa1ca14f-be0c-423a-b6e8-e9e4a09e1303	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 14:58:27.501124+00	2026-01-18 11:37:28.610991+00	\N	aal1	\N	2026-01-18 11:37:28.610819	Next.js Middleware	172.18.0.1	\N	\N	\N	\N	\N
1e355e88-a0b0-48d7-9c32-dd6c4c5b97e7	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-19 00:18:20.993642+00	2026-01-19 16:48:51.642822+00	\N	aal1	\N	2026-01-19 16:48:51.641771	node	172.18.0.1	\N	\N	\N	\N	\N
\.


--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_domains (id, sso_provider_id, domain, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_providers (id, resource_id, created_at, updated_at, disabled) FROM stdin;
\.


--
-- Data for Name: sso_sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_admin
--

COPY auth.sso_sessions (id, session_id, sso_provider_id, not_before, not_after, idp_initiated, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, invited_at, confirmation_token, confirmation_sent_at, recovery_token, recovery_sent_at, email_change_token_new, email_change, email_change_sent_at, last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at, phone, phone_confirmed_at, phone_change, phone_change_token, phone_change_sent_at, email_change_token_current, email_change_confirm_status, banned_until, reauthentication_token, reauthentication_sent_at, is_sso_user, deleted_at, is_anonymous) FROM stdin;
00000000-0000-0000-0000-000000000000	f3ad00ec-9dc1-477a-a4ac-f996122cf76e	authenticated	authenticated	bizuforte@gmail.com	$2a$10$nkY4YtbV5ob0AABTK4AnGu5LGlBIi98.m2oHQlwqduaH9FWwHByMa	\N	\N		\N		\N			\N	\N	{"provider": "email", "providers": ["email"]}	{}	\N	2026-01-06 01:42:11.532077+00	2026-01-06 01:42:11.542477+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	b01000df-8b43-447f-9006-1ae031e07398	authenticated	authenticated	spylma@gmail.com	$2a$10$3hbR2zwwrkOjG3g.bialL.ZaqbYCch1/x92.OJtfsFsyJ85yRcmBi	2026-01-04 21:00:33.834373+00	\N		\N	55dcfaf0fe22f698368dd0455edefe3d8eb6b41f5d3a727fe29c7eb5	2026-01-04 21:00:34.013761+00			\N	2026-01-09 21:43:33.348973+00	{"provider": "email", "providers": ["email"]}	{"email_verified": true}	\N	2026-01-04 19:53:18.291328+00	2026-01-17 20:21:08.833971+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	353dc6dd-22af-4527-b9a5-71ce76e909a8	authenticated	authenticated	admin@p2p.com	$2a$10$PYCcp.K6X5tROKzrpqlSnep4C70MykVZBTgigDeuP71SGrp3a2y52	2025-12-30 19:23:51.782086+00	\N		\N	e69bf8fab9dd61cfb247264b85d576e86704198c4722ac27e6334603	2025-12-30 19:23:51.980371+00			\N	2026-01-19 00:18:20.992808+00	{"provider": "email", "providers": ["email"]}	{"email_verified": true}	\N	2025-12-30 19:16:08.867678+00	2026-01-19 16:48:50.550232+00	\N	\N			\N		0	\N		\N	f	\N	f
\.


--
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: supabase_admin
--

COPY public.clientes (id, nome_completo, cpf_cnpj, email, fone, data_nascimento, codigo_cliente, numero_medidor, unidade_consumidora, desconto_percentual, nr_contrato, link_contrato, endereco_jsonb, created_at, updated_at) FROM stdin;
1152784f-3f14-4ad1-b0e4-3eeccfbdd248	Leandro Ricardo Landoski	99576716004	landoski@gmail.com		2026-01-01	63877276	1814204-FAE-006	8255918	20.00		\N	{"CEP": "60410335", "rua": "Av Borges de Melo", "bairro": "Parre├úo", "cidade": "Fortaleza", "numero": "1885", "complemento": "Rua C, 45"}	2025-12-24 23:47:14.583414+00	2025-12-24 23:47:14.583414+00
917b2c14-7745-4579-b763-a8786a288a8e	Bizu Forte	19670675000176	bizuforte@gmail.com	85987857282	2026-01-14	63881287	3768566-NAN-280	10260061	20.00		\N	{"CEP": "60410335", "rua": "Av Borges de Melo", "bairro": "Parre├úo", "cidade": "Fortaleza", "numero": "1881", "complemento": ""}	2025-12-25 12:19:23.85775+00	2025-12-25 12:19:23.85775+00
f5063ac8-3231-49a5-8630-538f0afc930b	Luis Carlos Kipper Spielmann	00394706013	spylma@gmail.com	85982041860	1984-12-13	63880846	5797929-ELE-647	7831448	20.00		\N	{"CEP": "60410335", "rua": "Av Borges de Melo", "bairro": "Parre├úo", "cidade": "Fortaleza", "numero": "1885", "complemento": "Bloco1, 503"}	2025-12-23 15:39:14.491626+00	2025-12-23 15:39:14.491626+00
8cf59079-0292-45f9-b275-f1519e5d245c	Francisco das Chagas de Morais	45419639300	francisco_pf@gmail.com	61996436596	\N	63880223	11540894-NAN-737	3498597	20.00	\N	\N	{"cep": null, "rua": "PV Pau Pombo", "bairro": null, "cidade": "Aquiraz", "numero": "000"}	2025-12-25 12:41:13.293616+00	2025-12-25 12:41:13.293616+00
9056dcff-706e-407c-bda6-f1ab85391f87	Jos├® Francisco Firmino Miranda	37845608300	miranda@gmail.com	85998341247	\N	63892615	2552613-NAN-270	2431190	20.00		\N	{"cep": null, "rua": "Rua Jos├® Buson", "bairro": "Alto da Balan├ºa", "cidade": "Fortaleza", "numero": "687"}	2025-12-25 12:27:15.722458+00	2025-12-25 12:27:15.722458+00
abdb6b31-bdc3-4d1b-a294-fb58c417f4f3	Francisco das Chagas de Morais	45419639300	francisco_pj@gmail.com	61996436596	\N	63884737	3849399-NAN-629	5631291	20.00		\N	{"cep": null, "rua": "Rua Andr├® Chaves", "bairro": "Jardim Am├®rica", "cidade": "Fortaleza", "numero": "67"}	2025-12-25 12:55:19.229578+00	2025-12-25 12:55:19.229578+00
c0de8768-720b-4738-91d6-ba78cc71e6b0	Ricardino Antonio de Oliveira Melo	22837973300	melo@gmail.com	85984258960	\N	64208273	1759589-ABB-011	4243391	20.00		\N	{"cep": null, "rua": "Rua J├║lio C├®sar", "bairro": "Jardim Am├®rica", "cidade": "Fortaleza", "numero": "1620"}	2025-12-25 12:30:52.549722+00	2025-12-25 12:30:52.549722+00
c3872d35-8f78-4937-b9d2-d60697668222	CRESSE	05269303000128	cresseclube@yahoo.com.br	8533931000	\N	63500976	11961822-NAN-730	214453	20.00		\N	{"cep": null, "rua": "Av Borges de Melo", "bairro": "Parre├úo", "cidade": "Fortaleza", "numero": "1881"}	2025-12-25 12:23:24.877249+00	2025-12-25 12:23:24.877249+00
e99f764f-b522-48e4-b2eb-9fd1d2896073	Rafael Herbert de Menezes Paix├úo	01179997336	menezes@gmail.com	85997794916	\N	64755218	4868648-ELO-446	6001150	20.00		\N	{"cep": null, "rua": "Rua 04 ", "bairro": "Curicaca - Conjunto Habitacional", "cidade": "Caucaia", "numero": "349"}	2025-12-25 12:36:05.387438+00	2025-12-25 12:36:05.387438+00
\.


--
-- Data for Name: cobrancas; Type: TABLE DATA; Schema: public; Owner: supabase_admin
--

COPY public.cobrancas (id, fatura_id, cliente_id, valor_p2p, data_emissao, data_vencimento, status_pagamento, data_pagamento, link_boleto_pdf, linha_digitavel_p2p, id_externo_asaas, created_at, qr_code_pix, payload_pix) FROM stdin;
4501137b-f0e3-493b-9582-b42dd11d0846	5e59f3c1-e201-4b31-b24d-e8baf0392799	917b2c14-7745-4579-b763-a8786a288a8e	921.00	2026-01-10 15:55:59.829017+00	2025-09-15	pendente	\N	\N	\N	\N	2026-01-10 15:55:59.829017+00	\N	\N
efea6214-b1e2-4f1c-bd31-09f8a24b0bbe	05c30f15-9acd-4047-b9d4-e913c57798f6	c3872d35-8f78-4937-b9d2-d60697668222	3315.15	2026-01-10 15:56:04.261167+00	2025-05-19	pendente	\N	\N	\N	\N	2026-01-10 15:56:04.261167+00	\N	\N
9ef8d7c1-5aac-4cb5-80fb-066dcf321178	a435615e-f9c5-4ff6-a2f0-c015266965c3	c3872d35-8f78-4937-b9d2-d60697668222	4554.27	2026-01-10 15:56:04.257864+00	2025-09-15	pendente	\N	\N	\N	\N	2026-01-10 15:56:04.257864+00	\N	\N
695eab1b-5672-487e-8df0-71f8cf93aa32	fbb6d2b3-5bfc-414c-921d-a02a0182d780	c3872d35-8f78-4937-b9d2-d60697668222	3878.13	2026-01-10 15:56:40.327272+00	2025-08-20	pendente	\N	\N	\N	\N	2026-01-10 15:56:40.327272+00	\N	\N
6cda5701-42dc-4add-8392-e5bd7651a035	915bb828-eb63-4643-98c4-3fe673ca3372	1152784f-3f14-4ad1-b0e4-3eeccfbdd248	664.28	2026-01-10 15:56:50.361074+00	2025-09-15	pendente	\N	\N	\N	\N	2026-01-10 15:56:50.361074+00	\N	\N
b9549a72-bc2b-481b-8ca8-476a0a79b684	4fef6fb6-99b1-4649-a2bd-627271d7df41	9056dcff-706e-407c-bda6-f1ab85391f87	336.81	2026-01-10 15:56:53.449567+00	2025-08-27	pendente	\N	\N	\N	\N	2026-01-10 15:56:53.449567+00	\N	\N
69bfdd24-d3f0-4fc5-8c2c-7376f9afe42c	a66d8ee0-3708-4717-8c29-54ccdbd4fbef	8cf59079-0292-45f9-b275-f1519e5d245c	274.97	2026-01-10 15:56:54.865961+00	2025-09-19	pendente	\N	\N	\N	\N	2026-01-10 15:56:54.865961+00	\N	\N
37c8e624-2406-4924-b97d-8743c87321bb	dbaf5cf1-dd48-4512-9b88-78545dcd4047	8cf59079-0292-45f9-b275-f1519e5d245c	183.60	2026-01-10 15:56:59.725522+00	2025-08-20	pendente	\N	\N	\N	\N	2026-01-10 15:56:59.725522+00	\N	\N
5dd39289-fca8-4f17-83d0-941c382ef8e2	afc4b820-e3fc-41cd-8720-465f7769f728	abdb6b31-bdc3-4d1b-a294-fb58c417f4f3	75.80	2026-01-10 15:57:13.172414+00	2025-09-05	pendente	\N	\N	\N	\N	2026-01-10 15:57:13.172414+00	\N	\N
00297c62-0860-4b51-826c-315f566e62e6	c39af3d7-7dca-428d-b230-41068981c239	917b2c14-7745-4579-b763-a8786a288a8e	896.43	2026-01-10 15:57:13.624594+00	2025-08-20	pendente	\N	\N	\N	\N	2026-01-10 15:57:13.624594+00	\N	\N
03d59738-d634-48d5-87ac-8772a0e17d18	1a785583-53ae-41a8-950c-d8507dab8569	c0de8768-720b-4738-91d6-ba78cc71e6b0	139.76	2026-01-10 15:57:17.991774+00	2025-09-05	pendente	\N	\N	\N	\N	2026-01-10 15:57:17.991774+00	\N	\N
41a4a108-5d46-4832-8e7d-fe25ce886df2	49072862-980b-4c60-afdf-db2e365601c8	abdb6b31-bdc3-4d1b-a294-fb58c417f4f3	136.62	2026-01-10 15:57:18.116518+00	2025-08-06	pendente	\N	\N	\N	\N	2026-01-10 15:57:18.116518+00	\N	\N
0c9ef7b0-b609-458b-a9e1-2a3a9d5c3e0d	6acc1a46-4c39-42bb-8751-73bf6a9128d0	8cf59079-0292-45f9-b275-f1519e5d245c	163.78	2026-01-10 15:57:18.728453+00	2025-07-23	pendente	\N	\N	\N	\N	2026-01-10 15:57:18.728453+00	\N	\N
cb3ee288-ee08-4e80-83ae-3f645122ef04	48c5b991-802c-4dbb-afdc-576218ae1383	917b2c14-7745-4579-b763-a8786a288a8e	1228.87	2026-01-10 15:57:19.409429+00	2025-06-17	pendente	\N	\N	\N	\N	2026-01-10 15:57:19.409429+00	\N	\N
51ba94db-1d0e-4c84-be4c-a52ca5339017	881383be-58f5-4146-8734-cd2094e6778f	8cf59079-0292-45f9-b275-f1519e5d245c	359.09	2026-01-10 15:57:20.311657+00	2025-11-14	pendente	\N	\N	\N	\N	2026-01-10 15:57:20.311657+00	\N	\N
08f27988-24c5-4db8-8f81-7ee49217c772	f2204ab3-744e-4b8f-8ff9-a7abf81ddc18	f5063ac8-3231-49a5-8630-538f0afc930b	254.28	2026-01-10 15:57:20.837005+00	2025-08-20	pendente	\N	\N	\N	\N	2026-01-10 15:57:20.837005+00	\N	\N
f2135883-a343-4eff-8f1d-cf85d5844f8c	51876541-ab60-46fd-ba71-0eb3d8552d54	c3872d35-8f78-4937-b9d2-d60697668222	3802.43	2026-01-10 15:57:21.143939+00	2025-07-15	pendente	\N	\N	\N	\N	2026-01-10 15:57:21.143939+00	\N	\N
43ecea49-79a9-4656-8a20-01e127a2233b	9e4e5f9d-7c57-4498-a41e-479b2268d6dd	9056dcff-706e-407c-bda6-f1ab85391f87	359.11	2026-01-10 15:57:21.390271+00	2025-07-01	pendente	\N	\N	\N	\N	2026-01-10 15:57:21.390271+00	\N	\N
42880ce6-d190-47e3-a8b7-8dad6484090d	7105e882-a141-45c2-8402-a3e073cc3c7d	1152784f-3f14-4ad1-b0e4-3eeccfbdd248	547.27	2026-01-10 15:57:21.759164+00	2025-08-20	pendente	\N	\N	\N	\N	2026-01-10 15:57:21.759164+00	\N	\N
5ebd3841-5eeb-4a5f-b92a-12eb4de6a154	65dc9a2f-a816-4e91-b89d-1ead2b9a5973	9056dcff-706e-407c-bda6-f1ab85391f87	355.85	2026-01-10 15:57:22.075202+00	2025-07-29	pendente	\N	\N	\N	\N	2026-01-10 15:57:22.075202+00	\N	\N
e7d942d4-e91f-47ab-bbaf-d519d6738063	27a897fc-c8e5-4e63-8f6e-cf2ada18206e	917b2c14-7745-4579-b763-a8786a288a8e	845.06	2026-01-10 15:57:22.80107+00	2025-07-15	pendente	\N	\N	\N	\N	2026-01-10 15:57:22.80107+00	\N	\N
b19f9887-c9c7-4feb-97be-999a4e1bd39f	317d94da-5bca-4673-8185-d6b94c58193e	f5063ac8-3231-49a5-8630-538f0afc930b	252.43	2026-01-10 15:57:23.026647+00	2025-09-15	pendente	\N	\N	\N	\N	2026-01-10 15:57:23.026647+00	\N	\N
c6a12713-2319-4287-96ca-f0de7ee05a61	5185ae2a-28a9-460e-8a84-2587ba0df970	9056dcff-706e-407c-bda6-f1ab85391f87	383.06	2026-01-10 15:57:23.050536+00	2025-12-22	pendente	\N	\N	\N	\N	2026-01-10 15:57:23.050536+00	\N	\N
febe7458-de07-4800-98d5-647d05bf5a36	e8e83deb-d7a7-41ec-807c-3334ca414eef	917b2c14-7745-4579-b763-a8786a288a8e	1107.96	2026-01-10 15:57:23.160988+00	2025-12-05	pendente	\N	\N	\N	\N	2026-01-10 15:57:23.160988+00	\N	\N
1e5810b3-a858-4927-8b6b-b0da4babafe7	97413059-0944-45ae-a26f-b855ecbc42b3	f5063ac8-3231-49a5-8630-538f0afc930b	283.62	2026-01-10 15:57:23.248942+00	2025-07-15	pendente	\N	\N	\N	\N	2026-01-10 15:57:23.248942+00	\N	\N
b2f9efe0-1caa-4c3e-ba83-5cbe735245d7	39e216b6-a84b-4349-aa65-c131cfb573c8	c3872d35-8f78-4937-b9d2-d60697668222	4125.36	2026-01-10 15:57:24.947845+00	2025-12-05	pendente	\N	\N	\N	\N	2026-01-10 15:57:24.947845+00	\N	\N
7353136f-717f-43e6-9cb8-d1b91ce49721	60b14078-f9b0-4539-9a31-59784e769dc7	abdb6b31-bdc3-4d1b-a294-fb58c417f4f3	117.76	2026-01-10 15:57:25.092119+00	2025-07-08	pendente	\N	\N	\N	\N	2026-01-10 15:57:25.092119+00	\N	\N
acd2ce67-ca09-4ae6-845c-a9be36ea43b4	ad816e90-a9d3-4bea-bacc-eecf81e5b029	c3872d35-8f78-4937-b9d2-d60697668222	5158.26	2026-01-10 15:57:25.118296+00	2025-04-24	pendente	\N	\N	\N	\N	2026-01-10 15:57:25.118296+00	\N	\N
9c6f9407-6be2-4986-a2e8-94f7aba376a0	ed46a9b3-f122-4954-a792-4f5a0f352c16	1152784f-3f14-4ad1-b0e4-3eeccfbdd248	560.08	2026-01-10 15:57:26.249157+00	2025-07-15	pendente	\N	\N	\N	\N	2026-01-10 15:57:26.249157+00	\N	\N
1d1851fb-e366-4842-859f-4949b3f5818e	1c628668-5bec-4816-b4eb-a5cc1bda24eb	abdb6b31-bdc3-4d1b-a294-fb58c417f4f3	113.92	2026-01-10 15:57:26.97624+00	2025-12-02	pendente	\N	\N	\N	\N	2026-01-10 15:57:26.97624+00	\N	\N
afd30864-9cd7-42bf-9aa5-c6024192d983	fd695d6a-2f34-4f73-8dcb-84ada2ce79a2	1152784f-3f14-4ad1-b0e4-3eeccfbdd248	714.72	2026-01-10 15:57:27.741683+00	2025-12-05	pendente	\N	\N	\N	\N	2026-01-10 15:57:27.741683+00	\N	\N
c66742d2-ba5e-4fcd-8399-396423aded8b	defe17c4-7e56-4576-a4fc-499e4a3cdb60	f5063ac8-3231-49a5-8630-538f0afc930b	416.77	2026-01-10 15:57:28.300758+00	2025-06-17	pendente	\N	\N	\N	\N	2026-01-10 15:57:28.300758+00	\N	\N
2c623a22-21d2-4e07-b1aa-168bc7ba4f46	2963ea13-c8ab-4bb2-9434-da24797250a0	1152784f-3f14-4ad1-b0e4-3eeccfbdd248	893.07	2026-01-10 15:57:28.862978+00	2025-06-17	pendente	\N	\N	\N	\N	2026-01-10 15:57:28.862978+00	\N	\N
13512f65-bfa9-4855-9b2a-2903f093fa72	94ad28cc-1f97-4b25-8578-434af15221ef	1152784f-3f14-4ad1-b0e4-3eeccfbdd248	688.13	2026-01-10 15:57:31.698849+00	2025-11-06	pendente	\N	\N	\N	\N	2026-01-10 15:57:31.698849+00	\N	\N
5ca38821-af0d-4de8-896d-55e7627d074c	c040215d-58dd-4b66-b19f-884e1f7d3c5d	c3872d35-8f78-4937-b9d2-d60697668222	3586.70	2026-01-10 15:57:31.73273+00	2025-06-17	pendente	\N	\N	\N	\N	2026-01-10 15:57:31.73273+00	\N	\N
34c0dfa7-f40d-47ad-af24-25a41ca5f747	0c59aca1-3a47-4b89-8aeb-56422813a40f	c0de8768-720b-4738-91d6-ba78cc71e6b0	122.75	2026-01-10 15:57:31.791655+00	2025-11-05	pendente	\N	\N	\N	\N	2026-01-10 15:57:31.791655+00	\N	\N
6b8c6974-c145-4e94-bd08-b182ef0d45b9	f7a8559a-4cb4-4f3c-89e4-58d4f406f024	abdb6b31-bdc3-4d1b-a294-fb58c417f4f3	134.89	2026-01-10 15:57:31.959314+00	2025-09-30	pendente	\N	\N	\N	\N	2026-01-10 15:57:31.959314+00	\N	\N
eaf41047-ff0e-43dd-9e8a-3eb309dd408f	1cd2f21b-f887-4c0d-a7bd-aed26e1f60f1	c0de8768-720b-4738-91d6-ba78cc71e6b0	131.18	2026-01-10 15:57:32.149462+00	2025-12-05	pendente	\N	\N	\N	\N	2026-01-10 15:57:32.149462+00	\N	\N
9ade2849-90b5-4a3f-bae1-3d889f885f53	12df84cd-92f6-4ad0-97ea-81763f4ec168	c3872d35-8f78-4937-b9d2-d60697668222	3920.63	2026-01-10 15:57:32.214854+00	2025-10-03	pendente	\N	\N	\N	\N	2026-01-10 15:57:32.214854+00	\N	\N
e1b24942-a7c7-40a0-ade0-6fdb8e779436	f956c8ce-b99d-43f3-9e8f-6b9dc40f0675	8cf59079-0292-45f9-b275-f1519e5d245c	335.31	2026-01-10 15:57:32.242319+00	2025-09-15	pendente	\N	\N	\N	\N	2026-01-10 15:57:32.242319+00	\N	\N
56945af5-df14-4877-9bb0-57eda206c14a	e3b0f455-7aea-48a9-be37-1da287c9f298	f5063ac8-3231-49a5-8630-538f0afc930b	275.04	2026-01-10 15:57:32.302385+00	2025-10-03	pendente	\N	\N	\N	\N	2026-01-10 15:57:32.302385+00	\N	\N
49755032-f9d8-4b0f-8d56-b2a0ea9cd4d0	195e6548-4488-47e2-99ee-d52eb6c687f1	f5063ac8-3231-49a5-8630-538f0afc930b	302.66	2026-01-10 15:57:32.333223+00	2025-12-05	pendente	\N	\N	\N	\N	2026-01-10 15:57:32.333223+00	\N	\N
c89c6953-8cf2-4ccd-87e8-e95ffc2d4374	227dbdd1-850c-455a-be7a-5f7036e7e559	917b2c14-7745-4579-b763-a8786a288a8e	885.61	2026-01-10 15:57:32.366245+00	2025-10-03	pendente	\N	\N	\N	\N	2026-01-10 15:57:32.366245+00	\N	\N
7855119f-30ac-47f3-bc80-e87e2740cb4f	1f4860a9-1d89-447f-b95b-fc0d6e70e7c2	e99f764f-b522-48e4-b2eb-9fd1d2896073	213.39	2026-01-10 15:57:32.378971+00	2025-10-05	pendente	\N	\N	\N	\N	2026-01-10 15:57:32.378971+00	\N	\N
61273422-d771-4e6f-9b52-d999def9a36d	22faf8cb-db7a-4874-9415-b6818c51a0e1	9056dcff-706e-407c-bda6-f1ab85391f87	367.10	2026-01-10 15:57:32.41135+00	2025-11-24	pendente	\N	\N	\N	\N	2026-01-10 15:57:32.41135+00	\N	\N
613312d4-d7b4-4e33-af22-62292e882d0e	ca72314c-b674-4940-9247-711b1fab8510	9056dcff-706e-407c-bda6-f1ab85391f87	360.26	2026-01-10 15:57:32.425491+00	2025-10-22	pendente	\N	\N	\N	\N	2026-01-10 15:57:32.425491+00	\N	\N
8236aa40-01f3-4f0d-88a7-37a023d0970e	aad8f9c4-4aa7-4bfe-b29c-4f032ef55d57	f5063ac8-3231-49a5-8630-538f0afc930b	300.16	2026-01-10 15:57:32.479379+00	2025-11-06	pendente	\N	\N	\N	\N	2026-01-10 15:57:32.479379+00	\N	\N
4b569449-b137-49f2-bf6a-1dcd63d6bbfc	d48ed6fc-be35-4c51-a3a1-c3bb68ec1236	1152784f-3f14-4ad1-b0e4-3eeccfbdd248	592.95	2026-01-10 15:57:32.481436+00	2025-10-03	pendente	\N	\N	\N	\N	2026-01-10 15:57:32.481436+00	\N	\N
30553776-aee2-457a-9bbe-07ceaeaed418	befe29d1-c2dc-4136-accf-ac105aab38e9	e99f764f-b522-48e4-b2eb-9fd1d2896073	305.77	2026-01-10 15:57:32.512275+00	2025-12-05	pendente	\N	\N	\N	\N	2026-01-10 15:57:32.512275+00	\N	\N
acf99290-e548-45a9-a4a8-b472824b311c	5f7ecf77-8e50-4fbe-9c4c-d0f17339d9a5	917b2c14-7745-4579-b763-a8786a288a8e	1058.09	2026-01-10 15:57:32.532108+00	2025-11-06	pendente	\N	\N	\N	\N	2026-01-10 15:57:32.532108+00	\N	\N
de58cabe-c317-42ec-921d-b8ff40068784	cdd9395c-f10b-446f-a342-eca9a43fe2ef	8cf59079-0292-45f9-b275-f1519e5d245c	324.04	2026-01-10 15:57:32.54987+00	2025-10-14	pendente	\N	\N	\N	\N	2026-01-10 15:57:32.54987+00	\N	\N
8bde5fcf-5c20-4ac2-833e-7a66a15df36e	d01c5cab-5efb-419d-a854-42e703b9a75f	abdb6b31-bdc3-4d1b-a294-fb58c417f4f3	86.09	2026-01-10 15:57:33.104927+00	2025-10-29	pendente	\N	\N	\N	\N	2026-01-10 15:57:33.104927+00	\N	\N
e12af9e5-1c20-4b46-8787-47142de2ba5d	cbc548b7-ea22-4a21-8410-7b16adacaeb1	c3872d35-8f78-4937-b9d2-d60697668222	4082.78	2026-01-10 15:57:35.450271+00	2025-11-06	pendente	\N	\N	\N	\N	2026-01-10 15:57:35.450271+00	\N	\N
dc94060b-5dde-465b-86ad-59466f830162	fd05e518-4716-4b62-8157-9f965a9a5ac3	e99f764f-b522-48e4-b2eb-9fd1d2896073	296.05	2026-01-10 15:57:35.791964+00	2025-12-05	pendente	\N	\N	\N	\N	2026-01-10 15:57:35.791964+00	\N	\N
4d52b300-021d-41b1-8a2b-ae59ab541bc9	0fb79693-5afc-4b2d-9f5e-01a69db2f3dc	c0de8768-720b-4738-91d6-ba78cc71e6b0	129.40	2026-01-10 15:57:35.797851+00	2025-10-05	pendente	\N	\N	\N	\N	2026-01-10 15:57:35.797851+00	\N	\N
1d0d95b2-bb70-4fb1-ba96-4ec7104a8254	54f7b46d-8420-4aa9-a11b-8d99da0e66a4	9056dcff-706e-407c-bda6-f1ab85391f87	340.27	2026-01-10 15:57:37.245603+00	2025-09-23	pendente	\N	\N	\N	\N	2026-01-10 15:57:37.245603+00	\N	\N
38fee5d1-7319-4320-894b-22ecf91aea2e	3c3d8169-7957-4590-a291-5c66bdf745dd	917b2c14-7745-4579-b763-a8786a288a8e	1115.00	2026-01-10 16:15:15.999579+00	2026-01-07	pendente	\N	\N	\N	\N	2026-01-10 16:15:15.999579+00	\N	\N
4a6bc35a-240a-421f-8ce1-eac7d213e435	3508b040-a857-420e-8e14-1a2c4e43748e	c3872d35-8f78-4937-b9d2-d60697668222	4033.34	2026-01-10 16:15:18.660626+00	2026-01-07	pendente	\N	\N	\N	\N	2026-01-10 16:15:18.660626+00	\N	\N
8e21740b-9770-484a-846b-d291bce63f6f	f73ca487-8c35-4069-aab4-5e702687b373	8cf59079-0292-45f9-b275-f1519e5d245c	125.57	2026-01-10 16:15:23.288008+00	2025-12-16	pendente	\N	\N	\N	\N	2026-01-10 16:15:23.288008+00	\N	\N
63724d17-4bf7-4720-8aff-46c3f38089e2	5b12d0bb-97a9-4061-88cc-971f8c1aa2df	c0de8768-720b-4738-91d6-ba78cc71e6b0	125.40	2026-01-10 16:15:27.581084+00	2026-01-05	pendente	\N	\N	\N	\N	2026-01-10 16:15:27.581084+00	\N	\N
59f790d4-8f8c-447a-8c3c-61c0dd93de2d	56b4b151-1ec6-42e8-a2a8-431848eb992d	e99f764f-b522-48e4-b2eb-9fd1d2896073	280.61	2026-01-10 16:15:28.035611+00	2026-02-05	pendente	\N	\N	\N	\N	2026-01-10 16:15:28.035611+00	\N	\N
c32e3738-e323-4e1e-9cf0-e50d6bca32dc	0fa2e8ae-05c5-4f4a-9f34-36b6b534e2cd	f5063ac8-3231-49a5-8630-538f0afc930b	297.28	2026-01-10 16:15:28.15478+00	2026-01-07	pendente	\N	\N	\N	\N	2026-01-10 16:15:28.15478+00	\N	\N
9be719fe-194d-4d02-b26d-85da1a5f48cb	7c2b3737-c6cb-42d4-a548-0a229aa053a5	abdb6b31-bdc3-4d1b-a294-fb58c417f4f3	117.78	2026-01-10 16:15:28.173388+00	2025-12-31	pendente	\N	\N	\N	\N	2026-01-10 16:15:28.173388+00	\N	\N
30e0f065-67b4-4770-8f51-5af51dfd397e	52498e18-ba38-472f-ba49-0eecb59ad745	1152784f-3f14-4ad1-b0e4-3eeccfbdd248	865.36	2026-01-10 16:15:28.233059+00	2026-01-07	pendente	\N	\N	\N	\N	2026-01-10 16:15:28.233059+00	\N	\N
\.


--
-- Data for Name: economia_gerada; Type: TABLE DATA; Schema: public; Owner: supabase_admin
--

COPY public.economia_gerada (id, fatura_id, cliente_id, ft_enel_sem_gd, total_itens_compensados, lc_p2p, nova_fatura_p2p, economia_reais, economia_percentual, created_at) FROM stdin;
e9deb438-eabc-40c8-8ec5-20b455d6e703	5e59f3c1-e201-4b31-b24d-e8baf0392799	917b2c14-7745-4579-b763-a8786a288a8e	1067.05	-730.25	584.20	921.00	146.05	13.69	2026-01-10 18:55:57.079253+00
e9b3a4b7-151c-449d-b7ca-98a22322ba9c	05c30f15-9acd-4047-b9d4-e913c57798f6	c3872d35-8f78-4937-b9d2-d60697668222	3941.21	-3130.29	2504.23	3315.15	626.06	15.88	2026-01-10 18:56:00.506788+00
5f803a89-f730-40e9-ac05-7998ec1787f6	a435615e-f9c5-4ff6-a2f0-c015266965c3	c3872d35-8f78-4937-b9d2-d60697668222	5283.65	-3646.92	2917.54	4554.27	729.38	13.80	2026-01-10 18:56:02.022921+00
b990ff12-441b-4fbf-b608-6f86d5ba5fbb	fbb6d2b3-5bfc-414c-921d-a02a0182d780	c3872d35-8f78-4937-b9d2-d60697668222	4484.89	-3033.82	2427.06	3878.13	606.76	13.53	2026-01-10 18:56:32.828687+00
6deae12c-4b9e-4284-b833-06a8115a6eb4	915bb828-eb63-4643-98c4-3fe673ca3372	1152784f-3f14-4ad1-b0e4-3eeccfbdd248	769.54	-526.18	420.94	664.28	105.26	13.68	2026-01-10 18:56:37.467773+00
adb70f6d-e644-422b-936e-efaa6b4b1915	a66d8ee0-3708-4717-8c29-54ccdbd4fbef	8cf59079-0292-45f9-b275-f1519e5d245c	338.90	-228.41	182.73	274.97	63.93	18.86	2026-01-10 18:56:40.532855+00
b9357e95-0007-4e30-a1e8-cbc6a15aa0c5	4fef6fb6-99b1-4649-a2bd-627271d7df41	9056dcff-706e-407c-bda6-f1ab85391f87	421.94	-286.18	228.94	336.81	85.13	20.18	2026-01-10 18:56:44.147615+00
c7b106a6-6444-40d3-bf78-2706653132d6	dbaf5cf1-dd48-4512-9b88-78545dcd4047	8cf59079-0292-45f9-b275-f1519e5d245c	211.62	-140.12	112.10	183.60	28.02	13.24	2026-01-10 18:56:47.432618+00
59abec79-6ad9-43df-b5ae-e89f900a319f	c39af3d7-7dca-428d-b230-41068981c239	917b2c14-7745-4579-b763-a8786a288a8e	1037.22	-703.95	563.16	896.43	140.79	13.57	2026-01-10 18:56:55.777246+00
289eb3aa-22ce-4bec-b419-8b2c3ce31d9b	1a785583-53ae-41a8-950c-d8507dab8569	c0de8768-720b-4738-91d6-ba78cc71e6b0	161.05	-106.43	85.14	139.76	21.29	13.22	2026-01-10 18:56:58.606156+00
af15eeea-cc9b-45a8-beee-a12c8dca57c1	afc4b820-e3fc-41cd-8720-465f7769f728	abdb6b31-bdc3-4d1b-a294-fb58c417f4f3	84.39	-42.96	34.37	75.80	8.59	10.18	2026-01-10 18:57:02.941032+00
3ac1713d-7ac1-49e0-aa21-e63689372bcc	48c5b991-802c-4dbb-afdc-576218ae1383	917b2c14-7745-4579-b763-a8786a288a8e	1383.83	-774.78	619.82	1228.87	154.96	11.20	2026-01-10 18:57:12.554635+00
31a2892c-0571-4381-be4f-6a3d8071b28b	6acc1a46-4c39-42bb-8751-73bf6a9128d0	8cf59079-0292-45f9-b275-f1519e5d245c	187.50	-118.60	94.88	163.78	23.72	12.65	2026-01-10 18:57:12.582315+00
5a166de2-af2b-4a91-9922-011ecc83597b	49072862-980b-4c60-afdf-db2e365601c8	abdb6b31-bdc3-4d1b-a294-fb58c417f4f3	157.12	-102.51	82.01	136.62	20.50	13.05	2026-01-10 18:57:12.684714+00
ab550b2b-8d0d-4429-92ea-f8c48bdd6115	7105e882-a141-45c2-8402-a3e073cc3c7d	1152784f-3f14-4ad1-b0e4-3eeccfbdd248	631.54	-421.33	337.06	547.27	84.27	13.34	2026-01-10 18:57:14.089993+00
3d785c42-0737-4590-b135-fb97ee99e907	9e4e5f9d-7c57-4498-a41e-479b2268d6dd	9056dcff-706e-407c-bda6-f1ab85391f87	413.74	-310.51	248.41	359.11	54.63	13.20	2026-01-10 18:57:14.413553+00
ac5c84e0-e3f1-42cf-9807-d2fab741e512	51876541-ab60-46fd-ba71-0eb3d8552d54	c3872d35-8f78-4937-b9d2-d60697668222	4525.00	-3612.83	2890.26	3802.43	722.57	15.97	2026-01-10 18:57:14.699832+00
fcc9e3f9-7971-4c52-8b57-42863e02c703	317d94da-5bca-4673-8185-d6b94c58193e	f5063ac8-3231-49a5-8630-538f0afc930b	318.87	-214.73	171.78	252.43	66.44	20.84	2026-01-10 18:57:15.085551+00
efd42631-b504-4319-aaab-a8f7da2681b1	27a897fc-c8e5-4e63-8f6e-cf2ada18206e	917b2c14-7745-4579-b763-a8786a288a8e	1000.68	-778.08	622.46	845.06	155.62	15.55	2026-01-10 18:57:15.866013+00
09614f86-6f12-4df1-a3ce-8679a0e8bbd3	5185ae2a-28a9-460e-8a84-2587ba0df970	9056dcff-706e-407c-bda6-f1ab85391f87	444.18	-305.61	244.49	383.06	61.12	13.76	2026-01-10 18:57:16.61061+00
ef567220-24d5-4013-b1c5-5ae058d579f7	881383be-58f5-4146-8734-cd2094e6778f	8cf59079-0292-45f9-b275-f1519e5d245c	386.36	-136.36	109.09	359.09	27.27	7.06	2026-01-10 18:57:16.664273+00
26d2086a-2c23-43db-8d08-2dac6caefa8b	f2204ab3-744e-4b8f-8ff9-a7abf81ddc18	f5063ac8-3231-49a5-8630-538f0afc930b	293.25	-194.83	155.86	254.28	38.97	13.29	2026-01-10 18:57:17.083008+00
24f7a9ef-a6db-42b6-b2e4-9a7fe712f345	65dc9a2f-a816-4e91-b89d-1ead2b9a5973	9056dcff-706e-407c-bda6-f1ab85391f87	419.08	-316.17	252.94	355.85	63.23	15.09	2026-01-10 18:57:17.945731+00
55f05b52-b4e6-4e12-832d-c5f817789cd4	e8e83deb-d7a7-41ec-807c-3334ca414eef	917b2c14-7745-4579-b763-a8786a288a8e	1273.60	-828.20	662.56	1107.96	165.64	13.01	2026-01-10 18:57:18.744543+00
cc9f6b39-9454-40e2-a274-bd4bf7bb945c	97413059-0944-45ae-a26f-b855ecbc42b3	f5063ac8-3231-49a5-8630-538f0afc930b	331.34	-238.62	190.90	283.62	47.72	14.40	2026-01-10 18:57:19.083507+00
f9572d80-b2bf-4c3d-b7f9-0e818f20f9a6	defe17c4-7e56-4576-a4fc-499e4a3cdb60	f5063ac8-3231-49a5-8630-538f0afc930b	470.11	-266.70	213.36	416.77	53.34	11.35	2026-01-10 18:57:19.729193+00
d5d6c9f5-0f3b-4e4d-9ae6-3db1f17ee524	2963ea13-c8ab-4bb2-9434-da24797250a0	1152784f-3f14-4ad1-b0e4-3eeccfbdd248	1011.15	-590.40	472.32	893.07	118.08	11.68	2026-01-10 18:57:19.767798+00
b6f213f0-63df-4720-af09-cb46dd45d811	39e216b6-a84b-4349-aa65-c131cfb573c8	c3872d35-8f78-4937-b9d2-d60697668222	4774.91	-3247.75	2598.20	4125.36	649.55	13.60	2026-01-10 18:57:19.816883+00
2d1b540c-c9b9-4cb1-97d8-2389a0ec9189	60b14078-f9b0-4539-9a31-59784e769dc7	abdb6b31-bdc3-4d1b-a294-fb58c417f4f3	134.14	-81.91	65.53	117.76	16.38	12.21	2026-01-10 18:57:19.87+00
fa56a34b-85a8-4862-876e-e476c0c2d7be	fd695d6a-2f34-4f73-8dcb-84ada2ce79a2	1152784f-3f14-4ad1-b0e4-3eeccfbdd248	827.96	-566.21	452.97	714.72	113.24	13.68	2026-01-10 18:57:19.953151+00
e234e7a1-29d4-4f50-ad94-fbd226ac34bd	ad816e90-a9d3-4bea-bacc-eecf81e5b029	c3872d35-8f78-4937-b9d2-d60697668222	6175.36	-5085.48	4068.38	5158.26	1017.10	16.47	2026-01-10 18:57:20.11643+00
1681ad95-21f8-47e3-be62-181953e94df9	ed46a9b3-f122-4954-a792-4f5a0f352c16	1152784f-3f14-4ad1-b0e4-3eeccfbdd248	659.92	-499.20	399.36	560.08	99.84	15.13	2026-01-10 18:57:20.494383+00
57747500-a2be-406a-a45d-26c0091825bc	1c628668-5bec-4816-b4eb-a5cc1bda24eb	abdb6b31-bdc3-4d1b-a294-fb58c417f4f3	129.62	-78.50	62.80	113.92	15.70	12.11	2026-01-10 18:57:20.741919+00
4c51aea3-e8d9-4ffa-a9bc-65e26b882c15	f7a8559a-4cb4-4f3c-89e4-58d4f406f024	abdb6b31-bdc3-4d1b-a294-fb58c417f4f3	154.59	-98.49	78.79	134.89	19.70	12.74	2026-01-10 18:57:24.821053+00
5fe067fc-7f89-465c-9ac4-419df0aaa937	1cd2f21b-f887-4c0d-a7bd-aed26e1f60f1	c0de8768-720b-4738-91d6-ba78cc71e6b0	150.75	-97.84	78.27	131.18	19.57	12.98	2026-01-10 18:57:24.946877+00
2cfe90e0-ebbe-4a6f-a7a6-20c84f58ea42	0c59aca1-3a47-4b89-8aeb-56422813a40f	c0de8768-720b-4738-91d6-ba78cc71e6b0	140.60	-89.27	71.42	122.75	17.85	12.70	2026-01-10 18:57:25.202545+00
fbebf241-8208-472c-bdad-ff33f6049aab	c040215d-58dd-4b66-b19f-884e1f7d3c5d	c3872d35-8f78-4937-b9d2-d60697668222	4264.26	-3387.78	2710.22	3586.70	677.56	15.89	2026-01-10 18:57:25.440968+00
47e890e5-cff6-4cfe-9b44-41962c1ffba6	94ad28cc-1f97-4b25-8578-434af15221ef	1152784f-3f14-4ad1-b0e4-3eeccfbdd248	797.14	-545.07	436.06	688.13	109.01	13.68	2026-01-10 18:57:25.617746+00
f985d680-bc8f-4020-befe-4132faed7d91	12df84cd-92f6-4ad0-97ea-81763f4ec168	c3872d35-8f78-4937-b9d2-d60697668222	4540.73	-3100.49	2480.39	3920.63	620.10	13.66	2026-01-10 18:57:26.872358+00
8bafb2b4-5425-4180-9bdb-c0627bb94b9a	f956c8ce-b99d-43f3-9e8f-6b9dc40f0675	8cf59079-0292-45f9-b275-f1519e5d245c	387.81	-262.48	209.98	335.31	52.50	13.54	2026-01-10 18:57:29.903473+00
516d0b64-8e7c-4828-9be4-9b5a5e4e42f0	e3b0f455-7aea-48a9-be37-1da287c9f298	f5063ac8-3231-49a5-8630-538f0afc930b	317.97	-214.64	171.71	275.04	42.93	13.50	2026-01-10 18:57:30.898404+00
c8e5b726-e480-426a-8f7f-02ad183e85bf	227dbdd1-850c-455a-be7a-5f7036e7e559	917b2c14-7745-4579-b763-a8786a288a8e	1025.90	-701.43	561.14	885.61	140.29	13.67	2026-01-10 18:57:31.765082+00
cd7bf4bd-b4d3-437f-b1d2-4e280fe1aacd	1f4860a9-1d89-447f-b95b-fc0d6e70e7c2	e99f764f-b522-48e4-b2eb-9fd1d2896073	243.61	-151.11	120.89	213.39	30.22	12.41	2026-01-10 18:57:32.001395+00
4b6bd626-3cb4-48d1-87b5-4f50ab3ea95e	195e6548-4488-47e2-99ee-d52eb6c687f1	f5063ac8-3231-49a5-8630-538f0afc930b	350.00	-236.70	189.36	302.66	47.34	13.53	2026-01-10 18:57:32.1874+00
535456c3-2048-41d3-bcb3-2a8246329262	ca72314c-b674-4940-9247-711b1fab8510	9056dcff-706e-407c-bda6-f1ab85391f87	418.16	-289.51	231.61	360.26	57.90	13.85	2026-01-10 18:57:32.284182+00
a8fe2052-af0d-434f-89a9-1139c3f52dc0	22faf8cb-db7a-4874-9415-b6818c51a0e1	9056dcff-706e-407c-bda6-f1ab85391f87	425.56	-292.31	233.85	367.10	58.46	13.74	2026-01-10 18:57:32.30616+00
059b8d6a-9885-4f12-a1ea-6ed1b4f80254	aad8f9c4-4aa7-4bfe-b29c-4f032ef55d57	f5063ac8-3231-49a5-8630-538f0afc930b	347.23	-235.33	188.26	300.16	47.07	13.56	2026-01-10 18:57:32.36382+00
481d26f1-3fd8-4620-979b-c0102b7e415b	d48ed6fc-be35-4c51-a3a1-c3bb68ec1236	1152784f-3f14-4ad1-b0e4-3eeccfbdd248	685.95	-465.01	372.01	592.95	93.00	13.56	2026-01-10 18:57:32.371106+00
8df82091-6338-47b1-873a-4a1822608998	befe29d1-c2dc-4136-accf-ac105aab38e9	e99f764f-b522-48e4-b2eb-9fd1d2896073	350.28	-222.57	178.06	305.77	44.51	12.71	2026-01-10 18:57:32.389106+00
95642523-41db-4e5b-94f6-cc7f636a0207	5f7ecf77-8e50-4fbe-9c4c-d0f17339d9a5	917b2c14-7745-4579-b763-a8786a288a8e	1215.64	-787.74	630.19	1058.09	157.55	12.96	2026-01-10 18:57:32.433959+00
ee0c5753-8880-4355-be7b-f1522249d829	cdd9395c-f10b-446f-a342-eca9a43fe2ef	8cf59079-0292-45f9-b275-f1519e5d245c	371.08	-235.21	188.17	324.04	47.04	12.68	2026-01-10 18:57:32.460943+00
194a3bdd-c004-48f7-84d5-280fba47a384	d01c5cab-5efb-419d-a854-42e703b9a75f	abdb6b31-bdc3-4d1b-a294-fb58c417f4f3	96.00	-54.07	43.26	86.09	9.91	10.32	2026-01-10 18:57:33.081371+00
38fe5a84-da6c-47c9-95bf-a62ccd57d4fc	cbc548b7-ea22-4a21-8410-7b16adacaeb1	c3872d35-8f78-4937-b9d2-d60697668222	4727.15	-3221.85	2577.48	4082.78	644.37	13.63	2026-01-10 18:57:35.425782+00
d600eb94-fd65-48cb-a18a-0ff49c17fe4b	fd05e518-4716-4b62-8157-9f965a9a5ac3	e99f764f-b522-48e4-b2eb-9fd1d2896073	339.03	-214.92	171.94	296.05	42.98	12.68	2026-01-10 18:57:35.760915+00
55ffccf0-700d-4cb9-a662-1adf3719d9f0	0fb79693-5afc-4b2d-9f5e-01a69db2f3dc	c0de8768-720b-4738-91d6-ba78cc71e6b0	148.35	-94.74	75.79	129.40	18.95	12.77	2026-01-10 18:57:35.762778+00
91c65e6e-ccf1-47e3-8d5a-4a46cd28d868	54f7b46d-8420-4aa9-a11b-8d99da0e66a4	9056dcff-706e-407c-bda6-f1ab85391f87	394.67	-272.01	217.61	340.27	54.40	13.78	2026-01-10 18:57:37.221496+00
3a9c4efc-92ea-49e2-93ba-1c551eddcfa6	3c3d8169-7957-4590-a291-5c66bdf745dd	917b2c14-7745-4579-b763-a8786a288a8e	1289.47	-872.35	697.88	1115.00	174.47	13.53	2026-01-10 19:15:15.170628+00
a7d55796-a2fd-4777-86bd-7e4ad93bd8e3	3508b040-a857-420e-8e14-1a2c4e43748e	c3872d35-8f78-4937-b9d2-d60697668222	4662.68	-3146.68	2517.34	4033.34	629.34	13.50	2026-01-10 19:15:18.124083+00
34e45cdc-0f38-416f-bfbd-e8221a59564c	f73ca487-8c35-4069-aab4-5e702687b373	8cf59079-0292-45f9-b275-f1519e5d245c	143.66	-90.44	72.35	125.57	18.09	12.59	2026-01-10 19:15:23.267077+00
c1426e2a-3da1-4e1f-9dc9-fd657512a8fd	5b12d0bb-97a9-4061-88cc-971f8c1aa2df	c0de8768-720b-4738-91d6-ba78cc71e6b0	143.89	-92.46	73.97	125.40	18.49	12.85	2026-01-10 19:15:27.55812+00
e21a4436-5755-4f8b-9b2c-b136f67cd6a0	56b4b151-1ec6-42e8-a2a8-431848eb992d	e99f764f-b522-48e4-b2eb-9fd1d2896073	320.75	-200.71	160.57	280.61	40.14	12.51	2026-01-10 19:15:28.010923+00
f53f22c4-29c4-4b99-bb34-d2245f990deb	0fa2e8ae-05c5-4f4a-9f34-36b6b534e2cd	f5063ac8-3231-49a5-8630-538f0afc930b	344.56	-236.41	189.13	297.28	47.28	13.72	2026-01-10 19:15:28.124379+00
90eb3d5a-0e46-4fbb-aac5-cb0fb9ce2ae8	7c2b3737-c6cb-42d4-a548-0a229aa053a5	abdb6b31-bdc3-4d1b-a294-fb58c417f4f3	134.64	-84.29	67.43	117.78	16.86	12.52	2026-01-10 19:15:28.133502+00
0aced7ac-31a3-4f3f-9e6c-b1f4eb8b30db	52498e18-ba38-472f-ba49-0eecb59ad745	1152784f-3f14-4ad1-b0e4-3eeccfbdd248	1005.26	-699.52	559.62	865.36	139.90	13.92	2026-01-10 19:15:28.211232+00
\.


--
-- Data for Name: faturas; Type: TABLE DATA; Schema: public; Owner: supabase_admin
--

COPY public.faturas (id, cliente_id, codigo_cliente, numero_medidor, mes_referencia, data_vencimento, ft_enel_com_gd, media_consumo, saldo_utilizado_mes, saldo_total_atualizado, reserva_creditos, link_pdf_original, status_processamento, created_at, consumo_kwh, bandeira_tarifaria, linha_digitavel_enel, nr_dias, proxima_leitura, tributos) FROM stdin;
5e59f3c1-e201-4b31-b24d-e8baf0392799	917b2c14-7745-4579-b763-a8786a288a8e	63881287	3768566-NAN-280	08/2025	2025-09-15	336.80	957.00	952.00	1325.63	1.39	http://host.docker.internal:54321/storage/v1/object/public/faturas/triagem/1768071337081_AGO_bizu_forte.pdf	concluido	2026-01-10 18:55:37.14941+00	952	Vermelha	23793.45602 90000.332800 12004.480302 4 12050000033680	32	2025-09-24	79.35
fbb6d2b3-5bfc-414c-921d-a02a0182d780	c3872d35-8f78-4937-b9d2-d60697668222	63500976	11961822-NAN-730	07/2025	2025-08-20	1451.07	4105.00	7589.00	6148.00	1.50	http://host.docker.internal:54321/storage/v1/object/public/faturas/triagem/1768071338147_JUL_cresse.pdf	concluido	2026-01-10 18:55:38.221401+00	4219	Vermelha	838600000140510700313000470503144076000635009765	30	2025-08-26	526.69
915bb828-eb63-4643-98c4-3fe673ca3372	1152784f-3f14-4ad1-b0e4-3eeccfbdd248	63877276	1814204-FAE-006	08/2025	2025-09-15	243.34	625.00	686.00	597.75	0.96	http://host.docker.internal:54321/storage/v1/object/public/faturas/triagem/1768071337682_AGO_landoski.pdf	concluido	2026-01-10 18:55:37.763625+00	686	Vermelha	838000000025433400313008140175523075000638772761	32	2025-09-24	98.43
4fef6fb6-99b1-4649-a2bd-627271d7df41	9056dcff-706e-407c-bda6-f1ab85391f87	63892615	2552613-NAN-270	08/2025	2025-08-27	107.87	342.00	380.89	0.00	0.00	http://host.docker.internal:54321/storage/v1/object/public/faturas/triagem/1768071337853_AGO_miranda.pdf	concluido	2026-01-10 18:55:37.928626+00	387	Vermelha	23793.45602 90130.025308 71004.480308 111860000010787	29	2025-09-12	75.31
c39af3d7-7dca-428d-b230-41068981c239	917b2c14-7745-4579-b763-a8786a288a8e	63881287	3768566-NAN-280	07/2025	2025-08-20	333.27	976.00	979.00	619.08	0.63	http://host.docker.internal:54321/storage/v1/object/public/faturas/triagem/1768071338038_JUL_bizu_forte.pdf	concluido	2026-01-10 18:55:38.134064+00	979	Vermelha	23793.45602 90910.03104745004.4803021 11790000033327	30	2025-08-26	136.1
1a785583-53ae-41a8-950c-d8507dab8569	c0de8768-720b-4738-91d6-ba78cc71e6b0	64208273	1759589-ABB-011	08/2025	2025-09-05	54.62	142.00	140.89	34.69	0.24	http://host.docker.internal:54321/storage/v1/object/public/faturas/triagem/1768071337775_AGO_melo.pdf	concluido	2026-01-10 18:55:37.841869+00	147	Vermelha	838000000009546200313002420572858078000642082731	32	2025-09-16	23.48
afc4b820-e3fc-41cd-8720-465f7769f728	abdb6b31-bdc3-4d1b-a294-fb58c417f4f3	63884737	3849399-NAN-629	08/2025	2025-09-05	41.43	133.00	48.00	432.61	3.25	http://host.docker.internal:54321/storage/v1/object/public/faturas/triagem/1768071337448_AGO_francisco_pj.pdf	concluido	2026-01-10 18:55:37.570766+00	78	Vermelha	838300000004414300313000419578481070000638847370	32	2025-09-18	13.13
7105e882-a141-45c2-8402-a3e073cc3c7d	1152784f-3f14-4ad1-b0e4-3eeccfbdd248	63877276	1814204-FAE-006	07/2025	2025-08-20	210.21	646.00	586.00	303.46	0.47	http://host.docker.internal:54321/storage/v1/object/public/faturas/triagem/1768071338554_JUL_landoski.pdf	concluido	2026-01-10 18:55:38.636018+00	586	Vermelha	838600000026102100313003452516443079000638772761	30	2025-08-26	89.49
48c5b991-802c-4dbb-afdc-576218ae1383	917b2c14-7745-4579-b763-a8786a288a8e	63881287	3768566-NAN-280	05/2025	2025-06-17	609.05	996.00	912.00	546.41	0.55	http://host.docker.internal:54321/storage/v1/object/public/faturas/triagem/1768071339389_MAIO_bizu_forte.pdf	concluido	2026-01-10 18:55:39.512431+00	1275	Amarela	838900000064090500313003385102473070000638812879	42	2025-06-25	204.39
49072862-980b-4c60-afdf-db2e365601c8	abdb6b31-bdc3-4d1b-a294-fb58c417f4f3	63884737	3849399-NAN-629	07/2025	2025-08-06	54.61	135.00	120.00	246.74	1.83	http://host.docker.internal:54321/storage/v1/object/public/faturas/triagem/1768071338325_JUL_francisco_pj.pdf	concluido	2026-01-10 18:55:38.4331+00	150	Vermelha	23793.45602 90360.00833944004.480305911650000005461	31	2025-08-20	20.88
e8e83deb-d7a7-41ec-807c-3334ca414eef	917b2c14-7745-4579-b763-a8786a288a8e	63881287	3768566-NAN-280	11/2025	2025-12-05	445.40	958.00	1116.00	2412.05	2.52	http://host.docker.internal:54321/storage/v1/object/public/faturas/triagem/1768071340033_NOV_Bizu_forte.pdf	concluido	2026-01-10 18:55:40.126422+00	1116	vermelha	838000000041454000313003174137597070000638812879	30	2025-12-26	156.32
9e4e5f9d-7c57-4498-a41e-479b2268d6dd	9056dcff-706e-407c-bda6-f1ab85391f87	63892615	2552613-NAN-270	06/2025	2025-07-01	110.70	335.00	363.00	128.62	0.38	http://host.docker.internal:54321/storage/v1/object/public/faturas/triagem/1768071339306_JUN_miranda.pdf	concluido	2026-01-10 18:55:39.379571+00	393	vermelha patamar 1	838000000017107000313002390104425070000638926157	30	2025-07-14	98.92
2963ea13-c8ab-4bb2-9434-da24797250a0	1152784f-3f14-4ad1-b0e4-3eeccfbdd248	63877276	1814204-FAE-006	05/2025	2025-06-17	420.75	629.00	695.00	256.57	0.41	http://host.docker.internal:54321/storage/v1/object/public/faturas/triagem/1768071339842_MAIO_landoski.pdf	concluido	2026-01-10 18:55:39.941783+00	958	vermelha patamar 1	838500000040207500313008385102445077000638772761	41	2025-06-25	219.91
27a897fc-c8e5-4e63-8f6e-cf2ada18206e	917b2c14-7745-4579-b763-a8786a288a8e	63881287	3768566-NAN-280	06/2025	2025-07-15	222.60	972.00	893.00	428.02	0.44	http://host.docker.internal:54321/storage/v1/object/public/faturas/triagem/1768071338728_JUN_bizu_forte.pdf	concluido	2026-01-10 18:55:38.809311+00	923	Amarela	838000000025 226200313009 393099452072 000638812879	29	2025-07-25	117.21
881383be-58f5-4146-8734-cd2094e6778f	8cf59079-0292-45f9-b275-f1519e5d245c	63880223	11540894-NAN-737	11/2025	2025-11-14	250.00	269.00	183.94	0.00	0.00	http://host.docker.internal:54321/storage/v1/object/public/faturas/triagem/1768071340240_NOV_Francisco_PF.pdf	concluido	2026-01-10 18:55:40.330555+00	328	Vermelha	838200000029500000313000422631284075000638802237	32	2025-12-04	60.7
ad816e90-a9d3-4bea-bacc-eecf81e5b029	c3872d35-8f78-4937-b9d2-d60697668222	63500976	1833158-030-300	03/2025	2025-04-24	1089.88	4059.00	6302.00	2750.00	0.68	http://host.docker.internal:54321/storage/v1/object/public/faturas/triagem/1768071339952_MAR_cresse.pdf	concluido	2026-01-10 18:55:40.023783+00	6332	Verde	838800000100898800313005427012730073000635009765	43	2025-04-26	728.64
97413059-0944-45ae-a26f-b855ecbc42b3	f5063ac8-3231-49a5-8630-538f0afc930b	63880846	5797929-ELE-647	06/2025	2025-07-15	92.72	291.00	274.00	81.80	0.28	http://host.docker.internal:54321/storage/v1/object/public/faturas/triagem/1768071339127_JUN_kipper.pdf	concluido	2026-01-10 18:55:39.20441+00	304	Amarela/Vermelha	838700000001927200313001393099451076000638808464	29	2025-07-25	39.71
39e216b6-a84b-4349-aa65-c131cfb573c8	c3872d35-8f78-4937-b9d2-d60697668222	63500976	11961822-NAN-730	11/2025	2025-12-05	1527.16	4195.00	8451.00	6148.00	1.47	http://host.docker.internal:54321/storage/v1/object/public/faturas/triagem/1768071340136_NOV_Cresse.pdf	concluido	2026-01-10 18:55:40.230447+00	4376	Vermelha	838300000152271600313001419855005072000635009765	30	2025-12-26	580.66
1c628668-5bec-4816-b4eb-a5cc1bda24eb	abdb6b31-bdc3-4d1b-a294-fb58c417f4f3	63884737	3849399-NAN-629	11/2025	2025-12-02	51.12	133.00	100.48	493.10	3.71	http://host.docker.internal:54321/storage/v1/object/public/faturas/triagem/1768071340341_NOV_Francisco_PJ.pdf	concluido	2026-01-10 18:55:40.41739+00	118	vermelha	838300000004511200313000430615005079000638847370	30	2025-12-18	17.51
ed46a9b3-f122-4954-a792-4f5a0f352c16	1152784f-3f14-4ad1-b0e4-3eeccfbdd248	63877276	1814204-FAE-006	06/2025	2025-07-15	160.72	629.00	573.00	163.90	0.26	http://host.docker.internal:54321/storage/v1/object/public/faturas/triagem/1768071339217_JUN_landoski.pdf	concluido	2026-01-10 18:55:39.296677+00	603	vermelha patamar 1	838000000017607200313008393099396075000638772761	29	2025-07-25	77.84
c040215d-58dd-4b66-b19f-884e1f7d3c5d	c3872d35-8f78-4937-b9d2-d60697668222	63500976	11961822-NAN-730	05/2025	2025-06-17	876.48	4057.00	8088.00	6148.00	1.52	http://host.docker.internal:54321/storage/v1/object/public/faturas/triagem/1768071339525_MAIO_cresse.pdf	concluido	2026-01-10 18:55:39.623281+00	4004	Amarela	838400000081764800313004379623644073000635009765	31	2025-06-25	767.27
195e6548-4488-47e2-99ee-d52eb6c687f1	f5063ac8-3231-49a5-8630-538f0afc930b	63880846	5797929-ELE-647	11/2025	2025-12-05	113.30	307.00	319.00	580.41	1.89	http://host.docker.internal:54321/storage/v1/object/public/faturas/triagem/1768071340425_NOV_kipper.pdf	concluido	2026-01-10 18:55:40.509518+00	319	vermelha patamar 1	23793.45602 90380.02291465004.4803001 12860000011330	30	2025-12-26	44.66
05c30f15-9acd-4047-b9d4-e913c57798f6	c3872d35-8f78-4937-b9d2-d60697668222	63500976	11961822-NAN-730	04/2025	2025-05-19	810.92	4053.00	3855.00	6148.00	1.52	http://host.docker.internal:54321/storage/v1/object/public/faturas/triagem/1768071336870_ABR_cresse.pdf	concluido	2026-01-10 18:55:37.054743+00	3885	Verde	838300000080109200313002366646559070000635009765	30	2025-05-27	455.45
a435615e-f9c5-4ff6-a2f0-c015266965c3	c3872d35-8f78-4937-b9d2-d60697668222	63500976	11961822-NAN-730	08/2025	2025-09-15	1636.73	4210.00	8765.00	6148.00	1.46	http://host.docker.internal:54321/storage/v1/object/public/faturas/triagem/1768071337162_AGO_cresse8.pdf	concluido	2026-01-10 18:55:37.232307+00	4754	Vermelha	838200000169367300313004387232768077000635009765	32	2025-09-24	611.43
a66d8ee0-3708-4717-8c29-54ccdbd4fbef	8cf59079-0292-45f9-b275-f1519e5d245c	63880223	11540894-NAN-737	08/2025	2025-09-19	92.24	245.00	261.00	478.99	1.96	http://host.docker.internal:54321/storage/v1/object/public/faturas/triagem/1768071337250_AGO_francisco_pf.pdf	concluido	2026-01-10 18:55:37.431948+00	291	Vermelha	23793.45602 90000.306994 06004.480304 7 12090000009224	32	2025-09-04	41.65
dbaf5cf1-dd48-4512-9b88-78545dcd4047	8cf59079-0292-45f9-b275-f1519e5d245c	63880223	11540894-NAN-737	07/2025	2025-08-20	71.50	237.00	164.00	388.83	1.64	http://host.docker.internal:54321/storage/v1/object/public/faturas/triagem/1768071338236_JUL_francisco_pf.pdf	concluido	2026-01-10 18:55:38.312382+00	194	Vermelha	23793.45602 90340.004424 74004.480302 8 11790000007151	29	2025-08-05	25.54
317d94da-5bca-4673-8185-d6b94c58193e	f5063ac8-3231-49a5-8630-538f0afc930b	63880846	5797929-ELE-647	08/2025	2025-09-15	80.65	300.00	280.00	247.19	0.82	http://host.docker.internal:54321/storage/v1/object/public/faturas/triagem/1768071337592_AGO_kipper.pdf	concluido	2026-01-10 18:55:37.669517+00	280	Vermelha	23793.45602 90000.332800 11004.480304 9 12050000008065	32	2025-09-24	35.87
5185ae2a-28a9-460e-8a84-2587ba0df970	9056dcff-706e-407c-bda6-f1ab85391f87	63892615	2552613-NAN-270	12/2025	2025-12-22	138.57	377.00	418.00	935.66	2.48	http://host.docker.internal:54321/storage/v1/object/public/faturas/triagem/1768071337943_DEZ_miranda.pdf	concluido	2026-01-10 18:55:38.024661+00	418	Amarela	838700000010385700313000457075129077000638926157	29	2026-01-13	55.79
6acc1a46-4c39-42bb-8751-73bf6a9128d0	8cf59079-0292-45f9-b275-f1519e5d245c	63880223	11540894-NAN-737	06/2025	2025-07-23	68.90	223.00	140.00	320.36	1.44	http://host.docker.internal:54321/storage/v1/object/public/faturas/triagem/1768071338902_JUN_francisco_pf.pdf	concluido	2026-01-10 18:55:38.971431+00	170	Amarela	838800000003689000313009 369177703071 000638802237	30	2025-07-04	24.34
f2204ab3-744e-4b8f-8ff9-a7abf81ddc18	f5063ac8-3231-49a5-8630-538f0afc930b	63880846	5797929-ELE-647	07/2025	2025-08-20	98.42	297.00	271.00	150.16	0.51	http://host.docker.internal:54321/storage/v1/object/public/faturas/triagem/1768071338450_JUL_kipper.pdf	concluido	2026-01-10 18:55:38.538903+00	271	Vermelha	23793.45602 90910.031047 44004.4803051 11790000009842	30	2025-08-26	33.73
defe17c4-7e56-4576-a4fc-499e4a3cdb60	f5063ac8-3231-49a5-8630-538f0afc930b	63880846	5797929-ELE-647	05/2025	2025-06-17	203.41	277.00	314.00	131.13	0.47	http://host.docker.internal:54321/storage/v1/object/public/faturas/triagem/1768071339754_MAIO_kipper.pdf	concluido	2026-01-10 18:55:39.830824+00	454	Amarela	838700000028034100313005385102472074000638808464	41	2025-06-25	74.16
65dc9a2f-a816-4e91-b89d-1ead2b9a5973	9056dcff-706e-407c-bda6-f1ab85391f87	63892615	2552613-NAN-270	07/2025	2025-07-29	102.91	331.00	370.00	6.49	0.02	http://host.docker.internal:54321/storage/v1/object/public/faturas/triagem/1768071338647_JUL_miranda.pdf	concluido	2026-01-10 18:55:38.713714+00	400	Vermelha	34191.09198 16985.96293185587.940009211570000010291	32	2025-08-12	51.07
94ad28cc-1f97-4b25-8578-434af15221ef	1152784f-3f14-4ad1-b0e4-3eeccfbdd248	63877276	1814204-FAE-006	10/2025	2025-11-06	252.07	645.00	748.00	1589.65	2.46	http://host.docker.internal:54321/storage/v1/object/public/faturas/triagem/1768071341415_OUT_landoski.pdf	concluido	2026-01-10 18:55:41.485698+00	748	vermelha	838600000026520700313008413732109075000638772761	33	2025-11-26	101.69
12df84cd-92f6-4ad0-97ea-81763f4ec168	c3872d35-8f78-4937-b9d2-d60697668222	63500976	11961822-NAN-730	09/2025	2025-10-03	1440.24	4139.00	7832.00	6148.00	1.49	http://host.docker.internal:54321/storage/v1/object/public/faturas/triagem/1768071341884_SET_cresse.pdf	concluido	2026-01-10 18:55:41.988722+00	4000	Vermelha	838900000145402400313008406133979070000635009765	29	2025-10-27	509.93
e3b0f455-7aea-48a9-be37-1da287c9f298	f5063ac8-3231-49a5-8630-538f0afc930b	63880846	5797929-ELE-647	09/2025	2025-10-03	103.33	293.00	277.00	326.18	1.11	http://host.docker.internal:54321/storage/v1/object/public/faturas/triagem/1768071342199_SET_kipper.pdf	concluido	2026-01-10 18:55:42.293215+00	277	Vermelha	23793.45602 90280.038127 94004.4803003 12230000010333	29	2025-10-27	51.59
227dbdd1-850c-455a-be7a-5f7036e7e559	917b2c14-7745-4579-b763-a8786a288a8e	63881287	3768566-NAN-280	09/2025	2025-10-03	324.47	958.00	905.00	1631.54	1.70	http://host.docker.internal:54321/storage/v1/object/public/faturas/triagem/1768071341800_SET_bizu_forte.pdf	concluido	2026-01-10 18:55:41.871937+00	905	Vermelha	23793.45602 90280.038127 95004.480307912230000032447	29	2025-10-27	116.26
ca72314c-b674-4940-9247-711b1fab8510	9056dcff-706e-407c-bda6-f1ab85391f87	63892615	2552613-NAN-270	10/2025	2025-10-22	128.65	346.00	388.00	313.34	0.91	http://host.docker.internal:54321/storage/v1/object/public/faturas/triagem/1768071341706_OUT_miranda.pdf	concluido	2026-01-10 18:55:41.789772+00	388	Vermelha	23793.45602 90280.041964 44004.4803051 12420000012865	31	2025-11-12	53.31
22faf8cb-db7a-4874-9415-b6818c51a0e1	9056dcff-706e-407c-bda6-f1ab85391f87	63892615	2552613-NAN-270	11/2025	2025-11-24	133.25	368.00	394.00	789.68	2.15	http://host.docker.internal:54321/storage/v1/object/public/faturas/triagem/1768071340826_NOV_Miranda.pdf	concluido	2026-01-10 18:55:40.931701+00	394	vermelha	838100000019332500313005453054131070000638926157	30	2025-12-11	52.32
befe29d1-c2dc-4136-accf-ac105aab38e9	e99f764f-b522-48e4-b2eb-9fd1d2896073	64755218	4868648-ELO-446	11/2025	2025-12-05	127.71	302.00	300.00	714.24	2.37	http://host.docker.internal:54321/storage/v1/object/public/faturas/triagem/1768071340719_NOV_Menezes.pdf	concluido	2026-01-10 18:55:40.812379+00	300	Vermelha	838500000016277100313001192066660074000647552183	30	2025-12-26	59.38
cdd9395c-f10b-446f-a342-eca9a43fe2ef	8cf59079-0292-45f9-b275-f1519e5d245c	63880223	11540894-NAN-737	10/2025	2025-10-14	135.87	250.00	310.00	75.07	0.30	http://host.docker.internal:54321/storage/v1/object/public/faturas/triagem/1768071341126_OUT_francisco_pf.pdf	concluido	2026-01-10 18:55:41.211328+00	310	Vermelha	23793.45602 90930.036406 13004.480300 7 12340000013587	30	2025-12-03	42.47
d01c5cab-5efb-419d-a854-42e703b9a75f	abdb6b31-bdc3-4d1b-a294-fb58c417f4f3	63884737	3849399-NAN-629	10/2025	2025-10-29	42.83	127.00	61.99	484.71	3.82	http://host.docker.internal:54321/storage/v1/object/public/faturas/triagem/1768071341223_OUT_francisco_pj.pdf	concluido	2026-01-10 18:55:41.304656+00	92	Vermelha	838700000001428300313000430090737072000638847370	32	2025-11-19	20.17
fd05e518-4716-4b62-8157-9f965a9a5ac3	e99f764f-b522-48e4-b2eb-9fd1d2896073	64755218	4868648-ELO-446	10/2025	2025-12-05	124.11	329.00	295.00	590.85	1.80	http://host.docker.internal:54321/storage/v1/object/public/faturas/triagem/1768071341602_OUT_menezes.pdf	concluido	2026-01-10 18:55:41.693268+00	295	Vermelha	838000000017241100313000168103461073000647552183	33	2025-11-26	35.5
54f7b46d-8420-4aa9-a11b-8d99da0e66a4	9056dcff-706e-407c-bda6-f1ab85391f87	63892615	2552613-NAN-270	09/2025	2025-09-23	122.66	345.00	351.00	131.52	0.38	http://host.docker.internal:54321/storage/v1/object/public/faturas/triagem/1768071342564_SET_miranda.pdf	concluido	2026-01-10 18:55:42.639934+00	351	Vermelha	23793.45602 90270.04312969004.480302 5 12130000012266	31	2025-10-13	50.06
51876541-ab60-46fd-ba71-0eb3d8552d54	c3872d35-8f78-4937-b9d2-d60697668222	63500976	11961822-NAN-730	06/2025	2025-07-15	912.17	4103.00	6377.00	6148.00	1.50	http://host.docker.internal:54321/storage/v1/object/public/faturas/triagem/1768071338819_JUN_cresse.pdf	concluido	2026-01-10 18:55:38.886402+00	4176	Amarela	838000000092121800313002404571814075000635009765	29	2025-07-25	517.65
fd695d6a-2f34-4f73-8dcb-84ada2ce79a2	1152784f-3f14-4ad1-b0e4-3eeccfbdd248	63877276	1814204-FAE-006	11/2025	2025-12-05	261.75	653.00	763.00	1743.12	2.67	http://host.docker.internal:54321/storage/v1/object/public/faturas/triagem/1768071340527_NOV_Landoski.pdf	concluido	2026-01-10 18:55:40.604292+00	763	Vermelha	838600000026617500313000174137509073000638772761	30	2025-12-26	16.85
60b14078-f9b0-4539-9a31-59784e769dc7	abdb6b31-bdc3-4d1b-a294-fb58c417f4f3	63884737	3849399-NAN-629	06/2025	2025-07-08	52.23	136.00	95.00	211.90	1.56	http://host.docker.internal:54321/storage/v1/object/public/faturas/triagem/1768071338984_JUN_francisco_pj.pdf	concluido	2026-01-10 18:55:39.114143+00	125	Amarela	838700000001522300313007379640536070000638847370	29	2025-07-19	18.93
1cd2f21b-f887-4c0d-a7bd-aed26e1f60f1	c0de8768-720b-4738-91d6-ba78cc71e6b0	64208273	1759589-ABB-011	11/2025	2025-12-05	52.91	140.00	131.95	374.45	2.67	http://host.docker.internal:54321/storage/v1/object/public/faturas/triagem/1768071340614_NOV_Melo.pdf	concluido	2026-01-10 18:55:40.706591+00	139	Vermelha	838000000009529100313000193060378073000642082731	32	2025-12-16	19.3
0c59aca1-3a47-4b89-8aeb-56422813a40f	c0de8768-720b-4738-91d6-ba78cc71e6b0	64208273	1759589-ABB-011	10/2025	2025-11-05	51.33	140.00	120.53	202.04	1.44	http://host.docker.internal:54321/storage/v1/object/public/faturas/triagem/1768071341495_OUT_melo.pdf	concluido	2026-01-10 18:55:41.59034+00	130	vermelha	838100000000513300313008442055787070000642082731	30	2025-11-17	17.25
aad8f9c4-4aa7-4bfe-b29c-4f032ef55d57	f5063ac8-3231-49a5-8630-538f0afc930b	63880846	5797929-ELE-647	10/2025	2025-11-06	111.90	309.00	323.00	546.93	1.77	http://host.docker.internal:54321/storage/v1/object/public/faturas/triagem/1768071341315_OUT_kipper.pdf	concluido	2026-01-10 18:55:41.406017+00	323	Vermelha	23793.45602 90300.028439 82004.480305 6 12570000011190	33	2025-11-26	43.11
f7a8559a-4cb4-4f3c-89e4-58d4f406f024	abdb6b31-bdc3-4d1b-a294-fb58c417f4f3	63884737	3849399-NAN-629	09/2025	2025-09-30	56.10	136.00	108.00	475.43	3.50	http://host.docker.internal:54321/storage/v1/object/public/faturas/triagem/1768071342100_SET_francisco_pj.pdf	concluido	2026-01-10 18:55:42.188235+00	138	vermelha	23793.45602 90930.03486497004.480303 8 12200000005610	29	2025-10-20	20.6
f956c8ce-b99d-43f3-9e8f-6b9dc40f0675	8cf59079-0292-45f9-b275-f1519e5d245c	63880223	11540894-NAN-737	09/2025	2025-09-15	125.33	244.00	316.00	313.80	1.29	http://host.docker.internal:54321/storage/v1/object/public/faturas/triagem/1768071341999_SET_francisco_pf.pdf	concluido	2026-01-10 18:55:42.088965+00	316	vermelha patamar 2	23793.45602 90100.08142252004.4803081 12050000012533	30	2025-10-04	46.37
1f4860a9-1d89-447f-b95b-fc0d6e70e7c2	e99f764f-b522-48e4-b2eb-9fd1d2896073	64755218	4868648-ELO-446	09/2025	2025-10-05	92.50	331.00	195.00	232.65	0.70	http://host.docker.internal:54321/storage/v1/object/public/faturas/triagem/1768071342478_SET_menezes.pdf	concluido	2026-01-10 18:55:42.554379+00	195	Vermelha	838000000009925000313001403635424070000647552183	23	2025-10-27	23.78
d48ed6fc-be35-4c51-a3a1-c3bb68ec1236	1152784f-3f14-4ad1-b0e4-3eeccfbdd248	63877276	1814204-FAE-006	09/2025	2025-10-03	220.94	637.00	600.00	923.56	1.45	http://host.docker.internal:54321/storage/v1/object/public/faturas/triagem/1768071342306_SET_landoski.pdf	concluido	2026-01-10 18:55:42.388663+00	600	Vermelha	838000000025209400313002152161538079000638772761	29	2025-10-27	82.67
5f7ecf77-8e50-4fbe-9c4c-d0f17339d9a5	917b2c14-7745-4579-b763-a8786a288a8e	63881287	3768566-NAN-280	10/2025	2025-11-06	427.90	968.00	1081.00	2400.09	2.48	http://host.docker.internal:54321/storage/v1/object/public/faturas/triagem/1768071340944_OUT_bizu_forte.pdf	concluido	2026-01-10 18:55:41.021036+00	1081	Vermelha	838200000045279000313006413732125070000638812879	33	2025-11-26	135.18
cbc548b7-ea22-4a21-8410-7b16adacaeb1	c3872d35-8f78-4937-b9d2-d60697668222	63500976	11961822-NAN-730	10/2025	2025-11-06	1505.30	4218.00	10274.00	6148.00	1.46	http://host.docker.internal:54321/storage/v1/object/public/faturas/triagem/1768071341033_OUT_cresse.pdf	concluido	2026-01-10 18:55:41.115456+00	4421	Vermelha	838000000157053000313000190048582079000635009765	33	2025-11-26	20.74
0fb79693-5afc-4b2d-9f5e-01a69db2f3dc	c0de8768-720b-4738-91d6-ba78cc71e6b0	64208273	1759589-ABB-011	09/2025	2025-10-05	53.61	140.00	122.36	123.31	0.88	http://host.docker.internal:54321/storage/v1/object/public/faturas/triagem/1768071342399_SET_melo.pdf	concluido	2026-01-10 18:55:42.468267+00	132	vermelha	838700000001536100313003403131507079000642082731	29	2025-10-16	17.13
3c3d8169-7957-4590-a291-5c66bdf745dd	917b2c14-7745-4579-b763-a8786a288a8e	63881287	3768566-NAN-280	12/2025	2026-01-07	417.12	986.00	1172.00	2162.35	2.19	http://host.docker.internal:54321/storage/v1/object/public/faturas/triagem/1768072498874_DEZ_bizuforte.pdf	concluido	2026-01-10 19:14:59.031677+00	1172	Amarela	838400000049171200313008441615013077000638812879	30	2026-03-27	166.61
3508b040-a857-420e-8e14-1a2c4e43748e	c3872d35-8f78-4937-b9d2-d60697668222	63500976	11961822-NAN-730	12/2025	2026-01-07	1516.00	4128.00	7736.00	6148.00	1.49	http://host.docker.internal:54321/storage/v1/object/public/faturas/triagem/1768072499051_DEZ_cresse.pdf	concluido	2026-01-10 19:14:59.144209+00	4404	Amarela	838200000150160000313009186122395070000635009765	30	2026-01-26	587.86
f73ca487-8c35-4069-aab4-5e702687b373	8cf59079-0292-45f9-b275-f1519e5d245c	63880223	11540894-NAN-737	12/2025	2025-12-16	53.22	255.00	122.40	300.59	1.18	http://host.docker.internal:54321/storage/v1/object/public/faturas/triagem/1768072499162_DEZ_francisco_pf.pdf	concluido	2026-01-10 19:14:59.259007+00	131	Amarela	838700000001532200313002449087693079000638802237	29	2026-01-06	18.51
5b12d0bb-97a9-4061-88cc-971f8c1aa2df	c0de8768-720b-4738-91d6-ba78cc71e6b0	64208273	1759589-ABB-011	12/2025	2026-01-05	51.43	140.00	127.62	444.05	3.17	http://host.docker.internal:54321/storage/v1/object/public/faturas/triagem/1768072499698_DEZ_melo.pdf	concluido	2026-01-10 19:14:59.787828+00	135	Amarela	838300000004514300313006200058413076000642082731	29	2026-01-16	18.9
56b4b151-1ec6-42e8-a2a8-431848eb992d	e99f764f-b522-48e4-b2eb-9fd1d2896073	64755218	4868648-ELO-446	12/2025	2026-02-05	120.04	284.00	281.00	779.43	2.74	http://host.docker.internal:54321/storage/v1/object/public/faturas/triagem/1768072499804_DEZ_menezes.pdf	concluido	2026-01-10 19:14:59.896737+00	281	Amarela	838000000017 200400313009469551625077000647552183	30	2026-01-26	53.35
0fa2e8ae-05c5-4f4a-9f34-36b6b534e2cd	f5063ac8-3231-49a5-8630-538f0afc930b	63880846	5797929-ELE-647	12/2025	2026-01-07	108.15	309.00	324.00	544.63	1.76	http://host.docker.internal:54321/storage/v1/object/public/faturas/triagem/1768072499442_DEZ_kipper.pdf	concluido	2026-01-10 19:14:59.584152+00	324	Amarela	23793.45602 90930.040630 77004.480305 5 13190000010815	30	2026-03-27	42.93
7c2b3737-c6cb-42d4-a548-0a229aa053a5	abdb6b31-bdc3-4d1b-a294-fb58c417f4f3	63884737	3849399-NAN-629	12/2025	2025-12-31	50.35	130.00	116.76	446.84	3.44	http://host.docker.internal:54321/storage/v1/object/public/faturas/triagem/1768072499285_DEZ_francisco_pj.pdf	concluido	2026-01-10 19:14:59.405739+00	126	Amarela	838000000009503500313004193096480072000638847370	29	2026-01-20	17.89
52498e18-ba38-472f-ba49-0eecb59ad745	1152784f-3f14-4ad1-b0e4-3eeccfbdd248	63877276	1814204-FAE-006	12/2025	2026-01-07	305.74	688.00	947.00	1545.48	2.25	http://host.docker.internal:54321/storage/v1/object/public/faturas/triagem/1768072499599_DEZ_landoski.pdf	concluido	2026-01-10 19:14:59.682376+00	947	Amarela	838900000030057400313000452098096077000638772761	30	2026-01-26	124.94
\.


--
-- Data for Name: itens_faturados; Type: TABLE DATA; Schema: public; Owner: supabase_admin
--

COPY public.itens_faturados (id, fatura_id, descricao, quantidade, unitario, valor, tipo_item, created_at) FROM stdin;
56f519c0-b014-4995-ba2a-acadb719564b	5e59f3c1-e201-4b31-b24d-e8baf0392799	Adicional Band. Vermelha	952.0000	0.094970	90.41	extraido	2026-01-10 18:56:04.18018+00
dff281ee-d0bc-4d8c-aa5f-3e9631b97c84	5e59f3c1-e201-4b31-b24d-e8baf0392799	Energia Ativa Fornecida TE	952.0000	0.321810	306.36	extraido	2026-01-10 18:56:04.18018+00
d6bcab06-90c9-40dc-a68f-0228acf9ce7c	5e59f3c1-e201-4b31-b24d-e8baf0392799	Adic. Band. Vermelha Comp.	952.0000	-0.094970	-90.41	extraido	2026-01-10 18:56:04.18018+00
ee2a1673-d4c6-4649-a4fc-2d55bb9befd6	5e59f3c1-e201-4b31-b24d-e8baf0392799	Energia Atv Inj TE oUC 08/2025 mPT GD2	952.0000	-0.321820	-306.37	extraido	2026-01-10 18:56:04.18018+00
e04e1fdc-563b-4759-ba12-94c301649dd6	5e59f3c1-e201-4b31-b24d-e8baf0392799	Energia Atv Inj TUSD oUC 08/2025 mPT GD2	952.0000	-0.350280	-333.47	extraido	2026-01-10 18:56:04.18018+00
5e844564-465a-4a83-94b4-998af04dd6a6	5e59f3c1-e201-4b31-b24d-e8baf0392799	Energia Ativa Fornecida TUSD	952.0000	0.610170	580.88	extraido	2026-01-10 18:56:04.18018+00
1a77cdd6-4f0e-40a3-9b71-502e1e00bc4e	5e59f3c1-e201-4b31-b24d-e8baf0392799	CIP ILUM PUB PREF MUNICIPAL	0.0000	0.000000	89.40	extraido	2026-01-10 18:56:04.18018+00
f8dd0837-ae7d-4a46-b99a-462a380ece3d	05c30f15-9acd-4047-b9d4-e913c57798f6	Energia Ativa Fornecida TE	3.0000	0.345910	1343.85	extraido	2026-01-10 18:56:06.219744+00
b86f7aa7-f1ce-4a6f-a10a-2cade11f3e16	05c30f15-9acd-4047-b9d4-e913c57798f6	Energia Ativa Fornecida TUSD	3.0000	0.582630	2263.50	extraido	2026-01-10 18:56:06.219744+00
963099ff-587c-4c54-8c77-731cc58d39f8	05c30f15-9acd-4047-b9d4-e913c57798f6	Energia Atv Inj TE mUC 04/2025 mPT	3.0000	-0.345910	-1333.47	extraido	2026-01-10 18:56:06.219744+00
7dad47f0-fac4-488f-aa9e-720d7886cb16	05c30f15-9acd-4047-b9d4-e913c57798f6	Energia Atv Inj TUSD mUC 04/2025 mPT	3.0000	-0.466100	-1796.82	extraido	2026-01-10 18:56:06.219744+00
6f6c0d02-abd3-4280-9490-3b20c81f0e13	05c30f15-9acd-4047-b9d4-e913c57798f6	CIP ILUM PUB PREF MUNICIPAL	0.0000	0.000000	333.86	extraido	2026-01-10 18:56:06.219744+00
d4f0f7f1-5718-427e-9fa4-38efcd8e82c4	a435615e-f9c5-4ff6-a2f0-c015266965c3	Adicional Band. Vermelha	4.0000	0.094990	451.57	extraido	2026-01-10 18:56:06.359778+00
57b3d5eb-fb6c-45d5-b57b-7f047f92ab07	a435615e-f9c5-4ff6-a2f0-c015266965c3	Energia Ativa Fornecida TE	4.0000	0.321830	1529.98	extraido	2026-01-10 18:56:06.359778+00
b0d52b7f-0264-4e82-986b-48c1f92b33c4	a435615e-f9c5-4ff6-a2f0-c015266965c3	Adic. Band. Vermelha Comp.	4.0000	-0.094990	-451.57	extraido	2026-01-10 18:56:06.359778+00
ec5a8a2d-fb2b-46b0-a8ab-7cbe6e1a352b	a435615e-f9c5-4ff6-a2f0-c015266965c3	Energia Atv Inj TE mUC 08/2025 mPT GD2	4.0000	-0.321830	-1530.00	extraido	2026-01-10 18:56:06.359778+00
158e08ae-bf67-4281-9657-28bc742c4037	a435615e-f9c5-4ff6-a2f0-c015266965c3	Energia Atv Inj TUSD mUC 08/2025 mPT GD2	4.0000	-0.350310	-1665.35	extraido	2026-01-10 18:56:06.359778+00
65957667-6ab7-4b1f-bca5-f11a2ea2b0f8	a435615e-f9c5-4ff6-a2f0-c015266965c3	Energia Ativa Fornecida TUSD	4.0000	0.610200	2900.90	extraido	2026-01-10 18:56:06.359778+00
bd16a82a-9e9f-46ba-9c4f-137343d76d98	a435615e-f9c5-4ff6-a2f0-c015266965c3	CIP ILUM PUB PREF MUNICIPAL	0.0000	0.000000	401.20	extraido	2026-01-10 18:56:06.359778+00
515dcdec-d0dd-42ab-9df2-a1f5a797e852	fbb6d2b3-5bfc-414c-921d-a02a0182d780	Adicional Band. Vermelha	4.0000	0.057640	243.20	extraido	2026-01-10 18:56:53.784401+00
939d4a0e-42ac-4a91-9329-6e99d0a83dde	fbb6d2b3-5bfc-414c-921d-a02a0182d780	Energia Ativa Fornecida TE	4.0000	0.316710	1336.21	extraido	2026-01-10 18:56:53.784401+00
5b30a085-ab4b-4329-87c9-e13534847648	fbb6d2b3-5bfc-414c-921d-a02a0182d780	Adic. Band. Vermelha Comp.	4.0000	-0.057640	-243.20	extraido	2026-01-10 18:56:53.784401+00
90ab9929-0fba-48b9-9fbc-28f9c54b090c	fbb6d2b3-5bfc-414c-921d-a02a0182d780	Energia Atv Inj TE mUC 07/2025 mPT GD2	4.0000	-0.316710	-1336.21	extraido	2026-01-10 18:56:53.784401+00
853c0e4a-fa09-4599-807e-b81cfa5f7767	fbb6d2b3-5bfc-414c-921d-a02a0182d780	Energia Atv Inj TUSD mUC 07/2025 mPT GD2	4.0000	-0.344730	-1454.41	extraido	2026-01-10 18:56:53.784401+00
8d2ab075-42f1-4f56-860a-f6f5f8825ec8	fbb6d2b3-5bfc-414c-921d-a02a0182d780	Energia Ativa Fornecida TUSD	4.0000	0.600490	2533.47	extraido	2026-01-10 18:56:53.784401+00
e97267e8-8cee-4571-ae86-c29f9da9ae35	fbb6d2b3-5bfc-414c-921d-a02a0182d780	CIP ILUM PUB PREF MUNICIPAL	0.0000	0.000000	372.01	extraido	2026-01-10 18:56:53.784401+00
d06f2ef8-1e77-4ed7-9292-ff7911d33950	915bb828-eb63-4643-98c4-3fe673ca3372	Adicional Band. Vermelha	686.0000	0.094940	65.13	extraido	2026-01-10 18:56:56.872138+00
830e9f1a-98df-4f9e-81e0-b0c14bda4c98	915bb828-eb63-4643-98c4-3fe673ca3372	Energia Ativa Fornecida TE	686.0000	0.321790	220.75	extraido	2026-01-10 18:56:56.872138+00
6461307c-7d2a-402a-ac4f-48cb39652d03	915bb828-eb63-4643-98c4-3fe673ca3372	Adic. Band. Vermelha Comp.	686.0000	-0.094940	-65.13	extraido	2026-01-10 18:56:56.872138+00
50689020-d83f-40c0-a509-4bb5747dd8aa	915bb828-eb63-4643-98c4-3fe673ca3372	Energia Atv Inj TE oUC 08/2025 mPT GD2	686.0000	-0.321810	-220.76	extraido	2026-01-10 18:56:56.872138+00
6b731829-1e33-40f3-a3b4-fc836ed3c10c	915bb828-eb63-4643-98c4-3fe673ca3372	Energia Atv Inj TUSD oUC 08/2025 mPT GD2	686.0000	-0.350280	-240.29	extraido	2026-01-10 18:56:56.872138+00
92b4c482-06f0-4979-8d5e-39a75876573d	915bb828-eb63-4643-98c4-3fe673ca3372	Energia Ativa Fornecida TUSD	686.0000	0.610160	418.57	extraido	2026-01-10 18:56:56.872138+00
d732e430-1b37-4cec-bcf4-362dc5ad118d	915bb828-eb63-4643-98c4-3fe673ca3372	CIP ILUM PUB PREF MUNICIPAL	0.0000	0.000000	65.09	extraido	2026-01-10 18:56:56.872138+00
f5497164-2d97-41b3-9e4a-ae938c7bc5e6	4fef6fb6-99b1-4649-a2bd-627271d7df41	Adicional Band. Vermelha	387.0000	0.077030	29.81	extraido	2026-01-10 18:57:10.180531+00
76fe674a-81d0-4e63-88bb-2cbc2bc302c0	4fef6fb6-99b1-4649-a2bd-627271d7df41	Energia Consumida Faturada TE	6.0000	0.325000	1.95	extraido	2026-01-10 18:57:10.180531+00
e81fbd7f-9dc9-44b1-b8ac-31c6b22c216b	4fef6fb6-99b1-4649-a2bd-627271d7df41	Energia Ativa Fornecida TE	380.0000	0.322550	122.57	extraido	2026-01-10 18:57:10.180531+00
f3f8b44c-9b2a-4580-a414-4ce29754071b	4fef6fb6-99b1-4649-a2bd-627271d7df41	Adic. Band. Vermelha Comp.	380.0000	-0.077240	-29.35	extraido	2026-01-10 18:57:10.180531+00
1008140e-5703-4350-8557-1379f30cb829	4fef6fb6-99b1-4649-a2bd-627271d7df41	Energia Atv Inj TE oUC 06/2025 mPT GD1	6.0000	-0.345000	-2.07	extraido	2026-01-10 18:57:10.180531+00
49a42536-71bd-45ed-8df4-72d463455550	4fef6fb6-99b1-4649-a2bd-627271d7df41	Energia Atv Inj TUSD oUC 06/2025 mPT GD1	6.0000	-0.525000	-3.15	extraido	2026-01-10 18:57:10.180531+00
120c07d8-0fe2-4c67-ad90-49e67e44ea2b	4fef6fb6-99b1-4649-a2bd-627271d7df41	Energia Atv Inj TE oUC 07/2025 mPT GD2	374.0000	-0.322110	-120.47	extraido	2026-01-10 18:57:10.180531+00
681b62a5-62f1-4dd0-a216-3e66bbc5b120	4fef6fb6-99b1-4649-a2bd-627271d7df41	Energia Atv Inj TUSD oUC 07/2025 mPT GD2	374.0000	-0.350640	-131.14	extraido	2026-01-10 18:57:10.180531+00
8a86d104-6a30-4089-953b-d41d299c3800	4fef6fb6-99b1-4649-a2bd-627271d7df41	Energia Ativa Fornecida TUSD	380.0000	0.611580	232.40	extraido	2026-01-10 18:57:10.180531+00
f365aedc-f074-4760-9d3b-5ddf1a4a01f3	4fef6fb6-99b1-4649-a2bd-627271d7df41	Energia Consumida Faturada TUSD	6.0000	0.620000	3.72	extraido	2026-01-10 18:57:10.180531+00
d4113051-d140-4400-8e55-c989ca87ec9d	4fef6fb6-99b1-4649-a2bd-627271d7df41	CIP ILUM PUB PREF MUNICIPAL	0.0000	0.000000	31.49	extraido	2026-01-10 18:57:10.180531+00
b6fa6288-22ab-427e-aec9-92e80b8b0649	a66d8ee0-3708-4717-8c29-54ccdbd4fbef	Adicional Band. Vermelha	291.0000	0.065500	19.06	extraido	2026-01-10 18:57:12.680471+00
f4e6ffb7-869c-438e-b79e-b0ea36c428a2	a66d8ee0-3708-4717-8c29-54ccdbd4fbef	Energia Consumida Faturada TE	30.0000	0.321000	9.63	extraido	2026-01-10 18:57:12.680471+00
a4443c57-011f-45fe-ba77-f0b3fd7c0c5d	a66d8ee0-3708-4717-8c29-54ccdbd4fbef	Energia Ativa Fornecida TE	260.0000	0.323040	83.99	extraido	2026-01-10 18:57:12.680471+00
69551563-e090-42ef-89d1-42ef5287d3f5	a66d8ee0-3708-4717-8c29-54ccdbd4fbef	Adic. Band. Vermelha Comp.	260.0000	-0.065690	-17.08	extraido	2026-01-10 18:57:12.680471+00
bdc96084-2270-4554-86ba-578835616f8c	a66d8ee0-3708-4717-8c29-54ccdbd4fbef	Energia Atv Inj TE oUC 05/2025 mPT GD1	156.0000	-0.322440	-50.30	extraido	2026-01-10 18:57:12.680471+00
40f45af7-22ca-486e-abc5-a025192791ca	a66d8ee0-3708-4717-8c29-54ccdbd4fbef	Energia Atv Inj TUSD oUC 05/2025 mPT GD1	156.0000	-0.489170	-76.31	extraido	2026-01-10 18:57:12.680471+00
647afb3b-3bd1-4842-b211-46676381e966	a66d8ee0-3708-4717-8c29-54ccdbd4fbef	Energia Atv Inj TE oUC 06/2025 mPT GD1	104.0000	-0.323650	-33.66	extraido	2026-01-10 18:57:12.680471+00
8150e790-efbb-4654-8e7a-80e96f281712	a66d8ee0-3708-4717-8c29-54ccdbd4fbef	Energia Atv Inj TUSD oUC 06/2025 mPT GD1	104.0000	-0.490960	-51.06	extraido	2026-01-10 18:57:12.680471+00
9aca24ec-7ad2-42fb-84df-9eb664476455	a66d8ee0-3708-4717-8c29-54ccdbd4fbef	Energia Ativa Fornecida TUSD	260.0000	0.612500	159.25	extraido	2026-01-10 18:57:12.680471+00
ea1123d6-f1e3-47ab-89b2-8747cd4e84d1	a66d8ee0-3708-4717-8c29-54ccdbd4fbef	Energia Consumida Faturada TUSD	30.0000	0.610000	18.30	extraido	2026-01-10 18:57:12.680471+00
1ec80e8b-cac8-414d-8b94-b45284fc2607	a66d8ee0-3708-4717-8c29-54ccdbd4fbef	CIP ILUM PUB PREF MUNICIPAL	0.0000	0.000000	48.67	extraido	2026-01-10 18:57:12.680471+00
feadf749-7526-4741-a764-0b095d8f0c66	dbaf5cf1-dd48-4512-9b88-78545dcd4047	Adicional Band. Vermelha	194.0000	0.057470	11.15	extraido	2026-01-10 18:57:16.175133+00
f2bb7a3b-a872-4371-a000-d03f2824335c	dbaf5cf1-dd48-4512-9b88-78545dcd4047	Energia Consumida Faturada TE	30.0000	0.316000	9.48	extraido	2026-01-10 18:57:16.175133+00
69633656-04f2-497b-a63a-5b4daa4257be	dbaf5cf1-dd48-4512-9b88-78545dcd4047	Energia Ativa Fornecida TE	164.0000	0.316710	51.94	extraido	2026-01-10 18:57:16.175133+00
a42f20e6-a51d-4b7e-81d2-ec4e71163f78	dbaf5cf1-dd48-4512-9b88-78545dcd4047	Adic. Band. Vermelha Comp.	164.0000	-0.057500	-9.43	extraido	2026-01-10 18:57:16.175133+00
a24af156-64dd-444b-a4df-eb2704af1e11	dbaf5cf1-dd48-4512-9b88-78545dcd4047	Energia Atv Inj TE oUC 05/2025 mPT GD1	164.0000	-0.316590	-51.92	extraido	2026-01-10 18:57:16.175133+00
65356aa1-de45-451b-825d-867b269d6872	dbaf5cf1-dd48-4512-9b88-78545dcd4047	Energia Atv Inj TUSD oUC 05/2025 mPT GD1	164.0000	-0.480300	-78.77	extraido	2026-01-10 18:57:16.175133+00
9ddd4fba-852a-40a0-bf19-15f2a8aaffd4	dbaf5cf1-dd48-4512-9b88-78545dcd4047	Energia Ativa Fornecida TUSD	164.0000	0.600370	98.46	extraido	2026-01-10 18:57:16.175133+00
96cdc668-1c8a-484a-8543-9b1f567a322a	dbaf5cf1-dd48-4512-9b88-78545dcd4047	Energia Consumida Faturada TUSD	30.0000	0.600330	18.01	extraido	2026-01-10 18:57:16.175133+00
9e64ce03-2401-4c64-903d-b4be15f1c405	dbaf5cf1-dd48-4512-9b88-78545dcd4047	CIP ILUM PUB PREF MUNICIPAL	0.0000	0.000000	22.58	extraido	2026-01-10 18:57:16.175133+00
38ed2f65-4922-4a9e-860f-2345f5302bb7	6acc1a46-4c39-42bb-8751-73bf6a9128d0	Energia Ativa Fornecida TE	170.0000	0.324530	55.17	extraido	2026-01-10 18:57:20.93371+00
2096d080-d228-422b-b3d8-de56e2520a2d	6acc1a46-4c39-42bb-8751-73bf6a9128d0	Energia Ativa Fornecida TUSD	170.0000	0.615290	104.60	extraido	2026-01-10 18:57:20.93371+00
54404e11-8571-4622-a1c9-92db569a6867	6acc1a46-4c39-42bb-8751-73bf6a9128d0	Energia Atv Inj TE oUC 05/2025 mPT	140.0000	-0.324430	-45.42	extraido	2026-01-10 18:57:20.93371+00
c3cc0eff-0fcc-4b50-bbfd-c0d3df3165f7	6acc1a46-4c39-42bb-8751-73bf6a9128d0	Energia Atv Inj TUSD oUC 05/2025 mPT	140.0000	-0.492360	-68.93	extraido	2026-01-10 18:57:20.93371+00
108560d6-4431-4fa7-8d31-62650bb4c8b0	6acc1a46-4c39-42bb-8751-73bf6a9128d0	Adic. Band. Amarela Comp.	140.0000	-0.020570	-2.88	extraido	2026-01-10 18:57:20.93371+00
3a267c80-cf3c-48c0-ba7a-24b0b38506fe	6acc1a46-4c39-42bb-8751-73bf6a9128d0	Adic. Band. Vermelha Comp.	140.0000	-0.009790	-1.37	extraido	2026-01-10 18:57:20.93371+00
18ff8331-618c-47eb-9d0d-7703994c1621	6acc1a46-4c39-42bb-8751-73bf6a9128d0	Adicional Band. Amarela	170.0000	0.020590	3.50	extraido	2026-01-10 18:57:20.93371+00
297ccbbc-b075-4955-9837-13f0a425f763	6acc1a46-4c39-42bb-8751-73bf6a9128d0	Adicional Band. Vermelha	170.0000	0.009710	1.65	extraido	2026-01-10 18:57:20.93371+00
c853578e-c740-4023-9d0f-5c5fcf4f551e	6acc1a46-4c39-42bb-8751-73bf6a9128d0	CIP ILUM PUB PREF MUNICIPAL	0.0000	0.000000	22.58	extraido	2026-01-10 18:57:20.93371+00
d0d36d21-ba4f-44bb-9f86-1e942b36e7e3	e8e83deb-d7a7-41ec-807c-3334ca414eef	Adicional Band. Vermelha	1.0000	0.059470	66.37	extraido	2026-01-10 18:57:27.183978+00
0269cef2-9331-4651-9073-9377b659b771	e8e83deb-d7a7-41ec-807c-3334ca414eef	Energia Ativa Fornecida TE	1.0000	0.326860	364.78	extraido	2026-01-10 18:57:27.183978+00
909dc7a2-84a2-42a5-8f2d-afaeb7f7653c	e8e83deb-d7a7-41ec-807c-3334ca414eef	Adic. Band. Vermelha Comp.	1.0000	-0.059470	-66.37	extraido	2026-01-10 18:57:27.183978+00
f154866b-4aca-493c-9f5f-ff98f611fd08	e8e83deb-d7a7-41ec-807c-3334ca414eef	Energia Atv Inj TE oUC 11/2025 mPT GD2	1.0000	-0.326860	-364.78	extraido	2026-01-10 18:57:27.183978+00
e5999b6d-6b52-4c19-90e4-0b2e08c6ed33	e8e83deb-d7a7-41ec-807c-3334ca414eef	Energia Atv Inj TUSD oUC 11/2025 mPT GD2	1.0000	-0.355780	-397.05	extraido	2026-01-10 18:57:27.183978+00
e6962847-e47f-4f98-b345-9564d5cd8a2c	e8e83deb-d7a7-41ec-807c-3334ca414eef	Energia Ativa Fornecida TUSD	1.0000	0.619740	691.63	extraido	2026-01-10 18:57:27.183978+00
2935c150-fb23-4e2a-af39-68417827e40e	e8e83deb-d7a7-41ec-807c-3334ca414eef	CIP ILUM PUB PREF MUNICIPAL	0.0000	0.000000	150.82	extraido	2026-01-10 18:57:27.183978+00
5e25a84a-22d8-446a-babd-133db502d2ca	27a897fc-c8e5-4e63-8f6e-cf2ada18206e	Adicional Band. Amarela	923.0000	0.003400	3.14	extraido	2026-01-10 18:57:27.264505+00
d6061e30-c274-47c5-a2d9-837896f74973	27a897fc-c8e5-4e63-8f6e-cf2ada18206e	Adicional Band. Vermelha	923.0000	0.050890	46.97	extraido	2026-01-10 18:57:27.264505+00
fec339db-d339-42c8-bb3a-dc6109f7d1fc	27a897fc-c8e5-4e63-8f6e-cf2ada18206e	Energia Consumida Faturada TE	30.0000	0.323670	9.71	extraido	2026-01-10 18:57:27.264505+00
6c84a141-1a20-4014-8631-782a1e8ef914	27a897fc-c8e5-4e63-8f6e-cf2ada18206e	Energia Ativa Fornecida TE	893.0000	0.324640	289.90	extraido	2026-01-10 18:57:27.264505+00
142c5efd-3927-4c15-a813-6d0ee614814d	27a897fc-c8e5-4e63-8f6e-cf2ada18206e	Adic. Band. Amarela Comp.	893.0000	-0.003430	-3.06	extraido	2026-01-10 18:57:27.264505+00
a9581b48-3845-42be-a29a-412785305044	27a897fc-c8e5-4e63-8f6e-cf2ada18206e	Adic. Band. Vermelha Comp.	893.0000	-0.050920	-45.47	extraido	2026-01-10 18:57:27.264505+00
c93d9bc0-6d8e-4541-869c-e8b554f38339	27a897fc-c8e5-4e63-8f6e-cf2ada18206e	Energia Atv Inj TE oUC 05/2025 mPT GD1	118.0000	-0.325510	-38.41	extraido	2026-01-10 18:57:27.264505+00
9d5ce5aa-4406-4c30-a967-98ed48e493d6	27a897fc-c8e5-4e63-8f6e-cf2ada18206e	Energia Atv Inj TUSD oUC 05/2025 mPT GD1	118.0000	-0.493980	-58.29	extraido	2026-01-10 18:57:27.264505+00
2f3595f9-001f-48cf-8d08-bd5dc98313f1	27a897fc-c8e5-4e63-8f6e-cf2ada18206e	Energia Atv Inj TE oUC 06/2025 mPT GD1	774.0000	-0.324870	-251.45	extraido	2026-01-10 18:57:27.264505+00
9050a49f-6965-44f2-8f06-cb0e6c2556e7	27a897fc-c8e5-4e63-8f6e-cf2ada18206e	Energia Atv Inj TUSD oUC 06/2025 mPT GD1	774.0000	-0.492760	-381.40	extraido	2026-01-10 18:57:27.264505+00
e3dbf714-2578-4598-a5e3-6b9fa8a7df4a	27a897fc-c8e5-4e63-8f6e-cf2ada18206e	Energia Ativa Fornecida TUSD	893.0000	0.615480	549.62	extraido	2026-01-10 18:57:27.264505+00
42c728f4-9b76-44bb-ac49-e981c34a1970	27a897fc-c8e5-4e63-8f6e-cf2ada18206e	Energia Consumida Faturada TUSD	30.0000	0.615000	18.45	extraido	2026-01-10 18:57:27.264505+00
b09ba4e4-e6bc-405a-a2c8-1b157e2bc3cc	27a897fc-c8e5-4e63-8f6e-cf2ada18206e	CIP ILUM PUB PREF MUNICIPAL	0.0000	0.000000	82.89	extraido	2026-01-10 18:57:27.264505+00
a6dd976d-7478-4aa3-b23e-76998b464cc6	7105e882-a141-45c2-8402-a3e073cc3c7d	Adicional Band. Vermelha	586.0000	0.057610	33.76	extraido	2026-01-10 18:57:30.024929+00
56598d27-7e38-4980-a7c1-76556e8eccf4	7105e882-a141-45c2-8402-a3e073cc3c7d	Energia Ativa Fornecida TE	586.0000	0.316670	185.57	extraido	2026-01-10 18:57:30.024929+00
781f87d0-1932-4b63-92f8-799fe52d69c7	7105e882-a141-45c2-8402-a3e073cc3c7d	Adic. Band. Vermelha Comp.	586.0000	-0.057610	-33.76	extraido	2026-01-10 18:57:30.024929+00
cf317a4e-9a95-425f-aedd-415926719a11	7105e882-a141-45c2-8402-a3e073cc3c7d	Energia Atv Inj TE oUC 07/2025 mPT GD2	586.0000	-0.316670	-185.57	extraido	2026-01-10 18:57:30.024929+00
4668a5bc-f975-477f-a8a1-7808e34ef42a	7105e882-a141-45c2-8402-a3e073cc3c7d	Energia Atv Inj TUSD oUC 07/2025 mPT GD2	586.0000	-0.344710	-202.00	extraido	2026-01-10 18:57:30.024929+00
7892e5d1-3c80-47c4-a7be-89a60ce62184	7105e882-a141-45c2-8402-a3e073cc3c7d	Energia Ativa Fornecida TUSD	586.0000	0.600440	351.86	extraido	2026-01-10 18:57:30.024929+00
6f883272-0e02-4fab-9360-677478b7893e	7105e882-a141-45c2-8402-a3e073cc3c7d	CIP ILUM PUB PREF MUNICIPAL	0.0000	0.000000	60.35	extraido	2026-01-10 18:57:30.024929+00
977a0d71-0b70-45c1-9db9-93bf31179071	60b14078-f9b0-4539-9a31-59784e769dc7	Adicional Band. Amarela	125.0000	0.009200	1.15	extraido	2026-01-10 18:57:31.425714+00
698df620-b550-4f2f-8b54-b900cc8ed1bd	60b14078-f9b0-4539-9a31-59784e769dc7	Adicional Band. Vermelha	125.0000	0.036480	4.56	extraido	2026-01-10 18:57:31.425714+00
5394a549-375e-4670-bbd0-a8d156dd9ee7	60b14078-f9b0-4539-9a31-59784e769dc7	Energia Consumida Faturada TE	30.0000	0.323670	9.71	extraido	2026-01-10 18:57:31.425714+00
3c164203-9727-4699-90e7-d53beb95fc2c	60b14078-f9b0-4539-9a31-59784e769dc7	Energia Ativa Fornecida TE	95.0000	0.324740	30.85	extraido	2026-01-10 18:57:31.425714+00
aba8263d-7922-40a3-b9d9-b65245a1d7aa	60b14078-f9b0-4539-9a31-59784e769dc7	Adic. Band. Amarela Comp.	95.0000	-0.009160	-0.87	extraido	2026-01-10 18:57:31.425714+00
e03e3218-b744-4aa6-a7ce-e414cb2c8db1	60b14078-f9b0-4539-9a31-59784e769dc7	Adic. Band. Vermelha Comp.	95.0000	-0.036320	-3.45	extraido	2026-01-10 18:57:31.425714+00
b3f4cfc5-48d2-41c8-8f1f-e81dea5c04e1	60b14078-f9b0-4539-9a31-59784e769dc7	Energia Atv Inj TE oUC 05/2025 mPT GD1	95.0000	-0.324420	-30.82	extraido	2026-01-10 18:57:31.425714+00
b353dc91-5775-4ee5-8370-f59b75429da6	60b14078-f9b0-4539-9a31-59784e769dc7	Energia Atv Inj TUSD oUC 05/2025 mPT GD1	95.0000	-0.492320	-46.77	extraido	2026-01-10 18:57:31.425714+00
84573bb7-4b0d-4e27-8488-080bd8be03af	60b14078-f9b0-4539-9a31-59784e769dc7	Energia Ativa Fornecida TUSD	95.0000	0.615370	58.46	extraido	2026-01-10 18:57:31.425714+00
a8a09134-0faf-4220-bc0c-810c1e0c2e4c	60b14078-f9b0-4539-9a31-59784e769dc7	Energia Consumida Faturada TU	30.0000	0.615000	18.45	extraido	2026-01-10 18:57:31.425714+00
b35c905e-7add-4b1c-9614-106d7ed1431a	60b14078-f9b0-4539-9a31-59784e769dc7	CIP ILUM PUB PREF MUNICIPAL	0.0000	0.000000	10.96	extraido	2026-01-10 18:57:31.425714+00
dcd8642b-f547-44a0-bad9-cde36ee1aca5	9e4e5f9d-7c57-4498-a41e-479b2268d6dd	Energia Ativa Fornecida TE	393.0000	0.324580	127.56	extraido	2026-01-10 18:57:31.603128+00
f14c8b23-18f7-4c92-b107-1fabe9cf5b21	9e4e5f9d-7c57-4498-a41e-479b2268d6dd	Energia Ativa Fornecida TUSD	393.0000	0.615450	241.87	extraido	2026-01-10 18:57:31.603128+00
ce425413-d78a-45e0-865b-3b3045ddc18a	9e4e5f9d-7c57-4498-a41e-479b2268d6dd	Energia Atv Inj TE oUC 05/2025 mPT	363.0000	-0.324570	-117.82	extraido	2026-01-10 18:57:31.603128+00
a9d302ba-bb0e-4d34-8178-16eee2aeeb45	9e4e5f9d-7c57-4498-a41e-479b2268d6dd	Energia Atv Inj TUSD oUC 05/2025 mPT	363.0000	-0.492400	-178.74	extraido	2026-01-10 18:57:31.603128+00
8083011f-070f-4c5c-8ae5-8cf32701491b	9e4e5f9d-7c57-4498-a41e-479b2268d6dd	Adic. Band. Amarela Comp.	363.0000	-0.014880	-5.40	extraido	2026-01-10 18:57:31.603128+00
3daa1869-736d-44e5-acc1-bbe9827f7a93	9e4e5f9d-7c57-4498-a41e-479b2268d6dd	Adic. Band. Vermelha Comp.	363.0000	-0.023550	-8.55	extraido	2026-01-10 18:57:31.603128+00
a05f33d8-53bf-4aac-8feb-76b6e7745bc8	9e4e5f9d-7c57-4498-a41e-479b2268d6dd	Adicional Band. Amarela	393.0000	0.014890	5.85	extraido	2026-01-10 18:57:31.603128+00
795c6fc7-01ec-4440-bf8d-18ee13771731	9e4e5f9d-7c57-4498-a41e-479b2268d6dd	Adicional Band. Vermelha	393.0000	0.023590	9.27	extraido	2026-01-10 18:57:31.603128+00
2eee5571-67ce-4b03-9ecf-9524ea93d8b8	9e4e5f9d-7c57-4498-a41e-479b2268d6dd	CIP ILUM PUB PREF MUNICIPAL	0.0000	0.000000	29.19	extraido	2026-01-10 18:57:31.603128+00
90995e9e-bcfa-4558-9658-4949af9ece7b	317d94da-5bca-4673-8185-d6b94c58193e	Adicional Band. Vermelha	280.0000	0.094930	26.58	extraido	2026-01-10 18:57:31.727298+00
1083028c-44b1-4a10-ae3a-cb24dbd9b0ed	317d94da-5bca-4673-8185-d6b94c58193e	Energia Ativa Fornecida TE	280.0000	0.321680	90.07	extraido	2026-01-10 18:57:31.727298+00
96a1ec83-3427-4a82-b4c8-9c79eb39f5a3	317d94da-5bca-4673-8185-d6b94c58193e	Adic. Band. Vermelha Comp.	280.0000	-0.094930	-26.58	extraido	2026-01-10 18:57:31.727298+00
2abfa30c-eaeb-4fb1-b24d-90f8e7c05d65	317d94da-5bca-4673-8185-d6b94c58193e	Energia Atv Inj TE oUC 08/2025 mPT GD2	280.0000	-0.321710	-90.08	extraido	2026-01-10 18:57:31.727298+00
226f3647-5a04-46d8-9782-5c0aaa1ce700	317d94da-5bca-4673-8185-d6b94c58193e	Energia Atv Inj TUSD oUC 08/2025 mPT GD2	280.0000	-0.350250	-98.07	extraido	2026-01-10 18:57:31.727298+00
52fb0123-dca1-4209-9e85-217fb6cbb3e9	afc4b820-e3fc-41cd-8720-465f7769f728	Adicional Band. Vermelha	78.0000	0.086280	6.73	extraido	2026-01-10 18:57:18.53433+00
88d75575-3fb7-4294-9791-50bbb85e2a16	afc4b820-e3fc-41cd-8720-465f7769f728	Energia Consumida Faturada TE	29.0000	0.332070	9.63	extraido	2026-01-10 18:57:18.53433+00
16e2f44c-2139-4004-ae82-dde03fee8be9	afc4b820-e3fc-41cd-8720-465f7769f728	Energia Ativa Fornecida TE	48.0000	0.321880	15.45	extraido	2026-01-10 18:57:18.53433+00
3f5f4bbb-77a1-4bee-8894-cf6bf0b86ae2	afc4b820-e3fc-41cd-8720-465f7769f728	Adic. Band. Vermelha Comp.	48.0000	-0.085830	-4.12	extraido	2026-01-10 18:57:18.53433+00
604da894-a7ae-4c29-8ad6-0115fc196697	afc4b820-e3fc-41cd-8720-465f7769f728	Energia Atv Inj TE oUC 05/2025 mPT GD1	48.0000	-0.321250	-15.42	extraido	2026-01-10 18:57:18.53433+00
e83250e5-f9fa-40f1-aa96-003b9b554fdd	afc4b820-e3fc-41cd-8720-465f7769f728	Energia Atv Inj TUSD oUC 05/2025 mPT GD1	48.0000	-0.487920	-23.42	extraido	2026-01-10 18:57:18.53433+00
7daed2d9-d83f-49ce-aa84-4997646670ec	afc4b820-e3fc-41cd-8720-465f7769f728	Energia Ativa Fornecida TUSD	48.0000	0.609790	29.27	extraido	2026-01-10 18:57:18.53433+00
b2e26faa-5585-48ae-b0c3-18df54530396	afc4b820-e3fc-41cd-8720-465f7769f728	Energia Consumida Faturada TUSD	29.0000	0.630690	18.29	extraido	2026-01-10 18:57:18.53433+00
63cd79ce-fea5-482c-8cb5-bec673fb0f93	afc4b820-e3fc-41cd-8720-465f7769f728	CIP ILUM PUB PREF MUNICIPAL	0.0000	0.000000	5.02	extraido	2026-01-10 18:57:18.53433+00
c5809243-f5f1-4725-8608-f401ad4f475e	c39af3d7-7dca-428d-b230-41068981c239	Adicional Band. Vermelha	979.0000	0.057630	56.42	extraido	2026-01-10 18:57:18.714181+00
5c663ddd-bbf5-4ae5-a325-0226a47e45e1	c39af3d7-7dca-428d-b230-41068981c239	Energia Ativa Fornecida TE	979.0000	0.316700	310.05	extraido	2026-01-10 18:57:18.714181+00
3a2348b5-2662-4dbb-9597-17815fbb62d0	c39af3d7-7dca-428d-b230-41068981c239	Adic. Band. Vermelha Comp.	979.0000	-0.057630	-56.42	extraido	2026-01-10 18:57:18.714181+00
b98070c4-192a-4d16-a8b1-c9a473fab06a	c39af3d7-7dca-428d-b230-41068981c239	Energia Atv Inj TE oUC 07/2025 mPT GD2	979.0000	-0.316700	-310.05	extraido	2026-01-10 18:57:18.714181+00
3373f41b-2984-435f-955d-237aac777fa0	c39af3d7-7dca-428d-b230-41068981c239	Energia Atv Inj TUSD oUC 07/2025 mPT GD2	979.0000	-0.344720	-337.48	extraido	2026-01-10 18:57:18.714181+00
09656b88-5e42-45d6-a130-7488bdbc3e28	c39af3d7-7dca-428d-b230-41068981c239	Energia Ativa Fornecida TUSD	979.0000	0.600470	587.86	extraido	2026-01-10 18:57:18.714181+00
f1ca2da4-6780-4c70-87dd-69805b956b18	c39af3d7-7dca-428d-b230-41068981c239	CIP ILUM PUB PREF MUNICIPAL	0.0000	0.000000	82.89	extraido	2026-01-10 18:57:18.714181+00
586081d3-1b80-4d07-b2c6-3497a1a91488	1a785583-53ae-41a8-950c-d8507dab8569	Adicional Band. Vermelha	147.0000	0.083540	12.28	extraido	2026-01-10 18:57:23.222553+00
49ba9b0a-11a2-455d-a95c-0c6a87fb24d4	1a785583-53ae-41a8-950c-d8507dab8569	Energia Consumida Faturada TE	6.0000	0.326670	1.96	extraido	2026-01-10 18:57:23.222553+00
6fd06629-ce29-4a20-9cd5-37ba7658436c	1a785583-53ae-41a8-950c-d8507dab8569	Energia Ativa Fornecida TE	140.0000	0.323710	45.32	extraido	2026-01-10 18:57:23.222553+00
d1e99fab-bcd0-47c5-a07d-d3a7875f339e	1a785583-53ae-41a8-950c-d8507dab8569	Adic. Band. Vermelha Comp.	140.0000	-0.084070	-11.77	extraido	2026-01-10 18:57:23.222553+00
b3a07f45-4970-4bb0-aeaf-b182486f7d6b	1a785583-53ae-41a8-950c-d8507dab8569	Energia Atv Inj TE oUC 07/2025 mPT GD2	140.0000	-0.323710	-45.32	extraido	2026-01-10 18:57:23.222553+00
1476323e-db64-484b-a93e-61efad7c4b4c	1a785583-53ae-41a8-950c-d8507dab8569	Energia Atv Inj TUSD oUC 07/2025 mPT GD2	140.0000	-0.352430	-49.34	extraido	2026-01-10 18:57:23.222553+00
30ee687f-dac0-4c45-bac3-bdb9bf3b9356	1a785583-53ae-41a8-950c-d8507dab8569	Energia Ativa Fornecida TUSD	140.0000	0.614000	85.96	extraido	2026-01-10 18:57:23.222553+00
4d5c194f-0ae3-4ec4-a95b-8a160b241e58	1a785583-53ae-41a8-950c-d8507dab8569	Energia Consumida Faturada TUSD	6.0000	0.618330	3.71	extraido	2026-01-10 18:57:23.222553+00
ee9c7867-185c-460d-adb8-6072bf5afdab	1a785583-53ae-41a8-950c-d8507dab8569	CIP ILUM PUB PREF MUNICIPAL	0.0000	0.000000	11.82	extraido	2026-01-10 18:57:23.222553+00
f3fe9a84-e396-4da9-9beb-ca70579b4688	48c5b991-802c-4dbb-afdc-576218ae1383	Energia Ativa Fornecida TE	1.0000	0.335250	427.45	extraido	2026-01-10 18:57:25.100783+00
d3e24b13-576d-4984-b54e-d3be829c2b62	48c5b991-802c-4dbb-afdc-576218ae1383	Energia Ativa Fornecida TUSD	1.0000	0.622560	793.76	extraido	2026-01-10 18:57:25.100783+00
d86e4a54-2a26-4401-8a4d-ee2379a37501	48c5b991-802c-4dbb-afdc-576218ae1383	Energia Atv Inj TE oUC 05/2025 mPT	912.0000	-0.335250	-305.75	extraido	2026-01-10 18:57:25.100783+00
ab0fdb37-2259-4326-90f1-6b5ce0509e78	48c5b991-802c-4dbb-afdc-576218ae1383	Energia Atv Inj TUSD oUC 05/2025 mPT	912.0000	-0.498040	-454.21	extraido	2026-01-10 18:57:25.100783+00
c1a12521-2567-4ef5-97c5-2232d0f75237	48c5b991-802c-4dbb-afdc-576218ae1383	Adic. Band. Amarela Comp.	912.0000	-0.016250	-14.82	extraido	2026-01-10 18:57:25.100783+00
dfc33377-a7ae-42dc-a36b-c307e59bb2e7	48c5b991-802c-4dbb-afdc-576218ae1383	Adicional Band. Amarela	1.0000	0.016260	20.73	extraido	2026-01-10 18:57:25.100783+00
edb7caa9-1371-4a06-af51-4cd91a3aa2aa	48c5b991-802c-4dbb-afdc-576218ae1383	CIP ILUM PUB PREF MUNICIPAL	0.0000	0.000000	141.89	extraido	2026-01-10 18:57:25.100783+00
dbdbf936-5df7-438d-8c60-a5c2deb6b5af	65dc9a2f-a816-4e91-b89d-1ead2b9a5973	Adicional Band. Amarela	400.0000	0.000000	0.00	extraido	2026-01-10 18:57:25.911669+00
7baacdf8-6cd1-42e4-a892-151ddbc43ee6	65dc9a2f-a816-4e91-b89d-1ead2b9a5973	Adicional Band. Vermelha	400.0000	0.057630	23.05	extraido	2026-01-10 18:57:25.911669+00
540f8323-bd07-4b4b-9c24-5e03050bcaee	65dc9a2f-a816-4e91-b89d-1ead2b9a5973	Energia Consumida Faturada TE	30.0000	0.316000	9.48	extraido	2026-01-10 18:57:25.911669+00
831eac45-c892-4acb-bfe5-a4aec1b33486	65dc9a2f-a816-4e91-b89d-1ead2b9a5973	Energia Ativa Fornecida TE	370.0000	0.316700	117.18	extraido	2026-01-10 18:57:25.911669+00
99ed2f62-fd89-4135-9ab1-8ef5af71705e	65dc9a2f-a816-4e91-b89d-1ead2b9a5973	Adic. Band. Vermelha Comp.	370.0000	-0.057590	-21.31	extraido	2026-01-10 18:57:25.911669+00
dfd07ce0-3bf8-4e9d-a3c0-c52cb1ba7b99	65dc9a2f-a816-4e91-b89d-1ead2b9a5973	Energia Atv Inj TE oUC 05/2025 mPT GD1	128.0000	-0.318050	-40.71	extraido	2026-01-10 18:57:25.911669+00
e37f648e-6cfb-44a0-8d41-04b21772bab7	65dc9a2f-a816-4e91-b89d-1ead2b9a5973	Energia Atv Inj TUSD oUC 05/2025 mPT GD1	128.0000	-0.482660	-61.78	extraido	2026-01-10 18:57:25.911669+00
a27be7f7-fb08-4560-8c12-bc9c76d08f36	65dc9a2f-a816-4e91-b89d-1ead2b9a5973	Energia Atv Inj TE oUC 06/2025 mPT GD1	241.0000	-0.317100	-76.42	extraido	2026-01-10 18:57:25.911669+00
3c0b7707-915d-4f10-b295-8baa5e180bda	65dc9a2f-a816-4e91-b89d-1ead2b9a5973	Energia Atv Inj TUSD oUC 06/2025 mPT GD1	241.0000	-0.481120	-115.95	extraido	2026-01-10 18:57:25.911669+00
6ace4851-50e3-44e3-95c6-215fd2cac111	65dc9a2f-a816-4e91-b89d-1ead2b9a5973	Energia Ativa Fornecida TUSD	370.0000	0.600430	222.16	extraido	2026-01-10 18:57:25.911669+00
632711a3-858e-4205-a81c-932b742a954a	65dc9a2f-a816-4e91-b89d-1ead2b9a5973	Energia Consumida Faturada TUSD	30.0000	0.600670	18.02	extraido	2026-01-10 18:57:25.911669+00
fd4a4a43-ff72-49a7-96c0-a5fbff709cd2	65dc9a2f-a816-4e91-b89d-1ead2b9a5973	CIP ILUM PUB PREF MUNICIPAL	0.0000	0.000000	29.19	extraido	2026-01-10 18:57:25.911669+00
b270cd27-4860-45b7-a387-53835519d4ab	49072862-980b-4c60-afdf-db2e365601c8	Adicional Band. Amarela	150.0000	0.000000	0.00	extraido	2026-01-10 18:57:25.927921+00
61024525-d369-4fd1-b365-81311ccd1f6f	49072862-980b-4c60-afdf-db2e365601c8	Adicional Band. Vermelha	150.0000	0.057470	8.62	extraido	2026-01-10 18:57:25.927921+00
a8296f04-4d98-46fa-bba3-0a71500c4b98	49072862-980b-4c60-afdf-db2e365601c8	Energia Consumida Faturada TE	30.0000	0.316000	9.48	extraido	2026-01-10 18:57:25.927921+00
73e28018-27f6-434d-8dc9-b59c995f5e6a	49072862-980b-4c60-afdf-db2e365601c8	Energia Ativa Fornecida TE	120.0000	0.316670	38.00	extraido	2026-01-10 18:57:25.927921+00
85b42139-8f64-46c7-9ec6-d249d21bd1e2	49072862-980b-4c60-afdf-db2e365601c8	Adic. Band. Vermelha Comp.	120.0000	-0.057500	-6.90	extraido	2026-01-10 18:57:25.927921+00
ef40949e-858e-45b8-bc52-71fb669d68df	49072862-980b-4c60-afdf-db2e365601c8	Energia Atv Inj TE oUC 05/2025 mPT GD1	120.0000	-0.316500	-37.98	extraido	2026-01-10 18:57:25.927921+00
f1728242-5c33-4792-8ba2-73390b8878f4	49072862-980b-4c60-afdf-db2e365601c8	Energia Atv Inj TUSD oUC 05/2025 mPT GD1	120.0000	-0.480250	-57.63	extraido	2026-01-10 18:57:25.927921+00
53e5dd3f-ebdc-497a-8687-69391990967f	49072862-980b-4c60-afdf-db2e365601c8	Energia Ativa Fornecida TUSD	120.0000	0.600250	72.03	extraido	2026-01-10 18:57:25.927921+00
cdf2492f-0c86-4f01-a129-53b3330e70cf	49072862-980b-4c60-afdf-db2e365601c8	Energia Consumida Faturada TUSD	30.0000	0.601000	18.03	extraido	2026-01-10 18:57:25.927921+00
3e029c6f-dcb0-4f7b-944a-43ff00ee1c8c	49072862-980b-4c60-afdf-db2e365601c8	CIP ILUM PUB PREF MUNICIPAL	0.0000	0.000000	10.96	extraido	2026-01-10 18:57:25.927921+00
6c1047ff-f07d-4b25-8d53-54649c9a7716	51876541-ab60-46fd-ba71-0eb3d8552d54	Adicional Band. Amarela	4.0000	0.003430	14.34	extraido	2026-01-10 18:57:26.097779+00
b6d1c60a-6aef-4b10-93b5-30a851e89ca8	51876541-ab60-46fd-ba71-0eb3d8552d54	Adicional Band. Vermelha	4.0000	0.050930	212.70	extraido	2026-01-10 18:57:26.097779+00
847dbf37-e0de-4513-8679-fbf13676e2c3	51876541-ab60-46fd-ba71-0eb3d8552d54	Energia Consumida Faturada TE	30.0000	0.323670	9.71	extraido	2026-01-10 18:57:26.097779+00
6f88a1b0-2850-471d-a01e-f8f43fd0d19c	51876541-ab60-46fd-ba71-0eb3d8552d54	Energia Ativa Fornecida TE	4.0000	0.324630	1345.92	extraido	2026-01-10 18:57:26.097779+00
67aad691-6f5a-4a88-af0f-e700670d7d61	51876541-ab60-46fd-ba71-0eb3d8552d54	Adic. Band. Amarela Comp.	4.0000	-0.003440	-14.25	extraido	2026-01-10 18:57:26.097779+00
fea4e9ef-62d8-4421-b017-38bfeaae8f78	51876541-ab60-46fd-ba71-0eb3d8552d54	Adic. Band. Vermelha Comp.	4.0000	-0.050940	-211.18	extraido	2026-01-10 18:57:26.097779+00
c2cc8814-29d4-4d1b-b05a-51cee69951a0	51876541-ab60-46fd-ba71-0eb3d8552d54	Energia Atv Inj TE mUC 06/2025 mPT GD1	4.0000	-0.324630	-1345.90	extraido	2026-01-10 18:57:26.097779+00
151862bd-e6bc-41e1-8843-35774ce62947	51876541-ab60-46fd-ba71-0eb3d8552d54	Energia Atv Inj TUSD mUC 06/2025 mPT GD1	4.0000	-0.492400	-2041.50	extraido	2026-01-10 18:57:26.097779+00
2113c70e-06d2-4c74-a5fe-ab9cc848576f	51876541-ab60-46fd-ba71-0eb3d8552d54	Energia Ativa Fornecida TUSD	4.0000	0.615500	2551.87	extraido	2026-01-10 18:57:26.097779+00
57dcc6fc-8cc1-4291-ace8-a4bad2577ca8	51876541-ab60-46fd-ba71-0eb3d8552d54	Energia Consumida Faturada TUSD	30.0000	0.615000	18.45	extraido	2026-01-10 18:57:26.097779+00
0be2fcbe-58ba-42d4-a7fd-825f5161fa09	51876541-ab60-46fd-ba71-0eb3d8552d54	CIP ILUM PUB PREF MUNICIPAL	0.0000	0.000000	372.01	extraido	2026-01-10 18:57:26.097779+00
ff7512a2-a969-4ae8-8b66-90f5aa00fe14	97413059-0944-45ae-a26f-b855ecbc42b3	Adicional Band. Amarela	304.0000	0.003320	1.01	extraido	2026-01-10 18:57:27.191747+00
65670f7e-7106-4655-b1b8-204026aa207f	97413059-0944-45ae-a26f-b855ecbc42b3	Adicional Band. Vermelha	304.0000	0.050820	15.45	extraido	2026-01-10 18:57:27.191747+00
c4fc046b-f178-4064-b4d7-b02db0b88536	97413059-0944-45ae-a26f-b855ecbc42b3	Energia Consumida Faturada TE	30.0000	0.323670	9.71	extraido	2026-01-10 18:57:27.191747+00
735a283b-11f4-4ded-9b85-b3de24995486	97413059-0944-45ae-a26f-b855ecbc42b3	Energia Ativa Fornecida TE	274.0000	0.324670	88.96	extraido	2026-01-10 18:57:27.191747+00
1d7e0716-4ef2-4a6c-94f3-dab5d0aafc02	97413059-0944-45ae-a26f-b855ecbc42b3	Adic. Band. Amarela Comp.	274.0000	-0.003320	-0.91	extraido	2026-01-10 18:57:27.191747+00
acb7b9e2-9eb6-465f-a18a-c4da1af1295b	97413059-0944-45ae-a26f-b855ecbc42b3	Adic. Band. Vermelha Comp.	274.0000	-0.050840	-13.93	extraido	2026-01-10 18:57:27.191747+00
ee10327f-3f3e-435d-a5cb-1aba28d4a86a	97413059-0944-45ae-a26f-b855ecbc42b3	Energia Atv Inj TE oUC 05/2025 mPT GD1	49.0000	-0.326120	-15.98	extraido	2026-01-10 18:57:27.191747+00
080fe02f-259e-47b4-9d6f-c88415bdd39e	97413059-0944-45ae-a26f-b855ecbc42b3	Energia Atv Inj TUSD oUC 05/2025 mPT GD1	49.0000	-0.495510	-24.28	extraido	2026-01-10 18:57:27.191747+00
86e81cd4-f3cb-4b33-a7ed-80658d0d0a91	97413059-0944-45ae-a26f-b855ecbc42b3	Energia Atv Inj TE oUC 06/2025 mPT GD1	224.0000	-0.325490	-72.91	extraido	2026-01-10 18:57:27.191747+00
712b27bd-4d8a-4a29-a6a9-9710bc20588b	97413059-0944-45ae-a26f-b855ecbc42b3	Energia Atv Inj TUSD oUC 06/2025 mPT GD1	224.0000	-0.493790	-110.61	extraido	2026-01-10 18:57:27.191747+00
9fd6fbee-b06f-4a40-81e9-c8c153917e84	97413059-0944-45ae-a26f-b855ecbc42b3	Energia Ativa Fornecida TUSD	274.0000	0.615400	168.62	extraido	2026-01-10 18:57:27.191747+00
9aa774b6-b038-419c-b3cf-2a08c8dc9762	97413059-0944-45ae-a26f-b855ecbc42b3	Energia Consumida Faturada TUSD	30.0000	0.616000	18.48	extraido	2026-01-10 18:57:27.191747+00
df7dd9d7-bae5-4637-90c2-387109d3eadd	97413059-0944-45ae-a26f-b855ecbc42b3	CIP ILUM PUB PREF MUNICIPAL	0.0000	0.000000	29.11	extraido	2026-01-10 18:57:27.191747+00
79282eee-f7fd-4cae-a75e-fdb6e7666e29	defe17c4-7e56-4576-a4fc-499e4a3cdb60	Energia Ativa Fornecida TE	454.0000	0.334430	151.83	extraido	2026-01-10 18:57:32.01074+00
c789c91f-21f8-43d9-9d71-98e7e0d14562	defe17c4-7e56-4576-a4fc-499e4a3cdb60	Energia Ativa Fornecida TUSD	454.0000	0.622950	282.82	extraido	2026-01-10 18:57:32.01074+00
4adb41db-4160-4b84-af19-493d7e74702f	defe17c4-7e56-4576-a4fc-499e4a3cdb60	Energia Atv Inj TE oUC 05/2025 mPT	314.0000	-0.334430	-105.01	extraido	2026-01-10 18:57:32.01074+00
46bb7901-6dde-47c3-bbd1-d8793b3ed446	defe17c4-7e56-4576-a4fc-499e4a3cdb60	Energia Atv Inj TUSD oUC 05/2025 mPT	314.0000	-0.498340	-156.48	extraido	2026-01-10 18:57:32.01074+00
1566d44e-2caa-4d3f-8b2b-9b192a6d32ce	defe17c4-7e56-4576-a4fc-499e4a3cdb60	Adic. Band. Amarela Comp.	314.0000	-0.016590	-5.21	extraido	2026-01-10 18:57:32.01074+00
1c617b1b-397a-48b0-a8e7-26ee0e6d6b5a	defe17c4-7e56-4576-a4fc-499e4a3cdb60	Adicional Band. Amarela	454.0000	0.016630	7.55	extraido	2026-01-10 18:57:32.01074+00
8d10d279-122c-44d5-bf16-5b46201b71b4	defe17c4-7e56-4576-a4fc-499e4a3cdb60	CIP ILUM PUB PREF MUNICIPAL	0.0000	0.000000	27.91	extraido	2026-01-10 18:57:32.01074+00
4ce3e475-819a-4f33-8402-876e967dceab	12df84cd-92f6-4ad0-97ea-81763f4ec168	Adicional Band. Vermelha	4.0000	0.103340	413.35	extraido	2026-01-10 18:57:32.315526+00
9fd1192a-c61e-4161-bf3b-730eeb8551c2	12df84cd-92f6-4ad0-97ea-81763f4ec168	Energia Ativa Fornecida TE	4.0000	0.321670	1286.66	extraido	2026-01-10 18:57:32.315526+00
e55c34a2-92ec-49ff-a9c1-ca214aff1dda	12df84cd-92f6-4ad0-97ea-81763f4ec168	Adic. Band. Vermelha Comp.	4.0000	-0.103340	-413.35	extraido	2026-01-10 18:57:32.315526+00
8ccb9364-361e-4d4a-b33a-aee63ef1f6bc	12df84cd-92f6-4ad0-97ea-81763f4ec168	Energia Atv Inj TE mUC 09/2025 mPT GD2	4.0000	-0.321670	-1286.66	extraido	2026-01-10 18:57:32.315526+00
018e0581-e4c7-4b2f-9c21-a700ff8c470f	12df84cd-92f6-4ad0-97ea-81763f4ec168	Energia Atv Inj TUSD mUC 09/2025 mPT GD2	4.0000	-0.350120	-1400.48	extraido	2026-01-10 18:57:32.315526+00
9846d1c1-4a19-4582-8f82-d417dcc7d2d7	12df84cd-92f6-4ad0-97ea-81763f4ec168	Energia Ativa Fornecida TUSD	4.0000	0.609880	2439.52	extraido	2026-01-10 18:57:32.315526+00
e6931636-c32c-441b-b677-ebc083234e56	12df84cd-92f6-4ad0-97ea-81763f4ec168	CIP ILUM PUB PREF MUNICIPAL	0.0000	0.000000	401.20	extraido	2026-01-10 18:57:32.315526+00
0d770ad2-fe25-423d-b16c-560b3a125f93	22faf8cb-db7a-4874-9415-b6818c51a0e1	Adicional Band. Vermelha	394.0000	0.059470	23.43	extraido	2026-01-10 18:57:32.515198+00
d1e03d22-a062-4d0f-8b23-ee30d282ebcf	22faf8cb-db7a-4874-9415-b6818c51a0e1	Energia Ativa Fornecida TE	394.0000	0.326830	128.77	extraido	2026-01-10 18:57:32.515198+00
5f203ca5-a3ec-44ba-a2eb-4b74ccc5c19d	22faf8cb-db7a-4874-9415-b6818c51a0e1	Adic. Band. Vermelha Comp.	394.0000	-0.059470	-23.43	extraido	2026-01-10 18:57:32.515198+00
53a5d5bf-5e8c-42c5-bc62-26bd6bd47d69	22faf8cb-db7a-4874-9415-b6818c51a0e1	Energia Atv Inj TE oUC 09/2025 mPT GD2	313.0000	-0.326800	-102.40	extraido	2026-01-10 18:57:32.515198+00
0c4fb452-3c9e-41ec-8d53-5fb51fdcc02e	22faf8cb-db7a-4874-9415-b6818c51a0e1	Energia Atv Inj TUSD oUC 09/2025 mPT GD2	313.0000	-0.355750	-111.47	extraido	2026-01-10 18:57:32.515198+00
aa21f979-f790-43a1-ab58-75afc8418239	22faf8cb-db7a-4874-9415-b6818c51a0e1	Energia Atv Inj TE oUC 10/2025 mPT GD2	80.0000	-0.326440	-26.33	extraido	2026-01-10 18:57:32.515198+00
38c2de1c-b615-4c65-9f9c-76efbf677f34	22faf8cb-db7a-4874-9415-b6818c51a0e1	Energia Atv Inj TUSD oUC 10/2025 mPT GD2	80.0000	-0.355570	-28.68	extraido	2026-01-10 18:57:32.515198+00
b719c4c2-272c-460f-a0d2-df0e06611723	22faf8cb-db7a-4874-9415-b6818c51a0e1	Energia Ativa Fornecida TUSD	394.0000	0.619720	244.17	extraido	2026-01-10 18:57:32.515198+00
55bd27bd-9fa3-45bd-850e-f4ea712e3fc0	22faf8cb-db7a-4874-9415-b6818c51a0e1	CIP ILUM PUB PREF MUNICIPAL	0.0000	0.000000	29.19	extraido	2026-01-10 18:57:32.515198+00
1561d1cf-2cc4-45e1-b537-5711d1776c57	aad8f9c4-4aa7-4bfe-b29c-4f032ef55d57	Adicional Band. Vermelha	323.0000	0.065730	21.23	extraido	2026-01-10 18:57:32.561569+00
ab463ef0-0e34-4787-9875-000af1c057d8	aad8f9c4-4aa7-4bfe-b29c-4f032ef55d57	Energia Ativa Fornecida TE	323.0000	0.317370	102.51	extraido	2026-01-10 18:57:32.561569+00
c359ce99-d7cc-4aa8-9b96-8e478acbd844	aad8f9c4-4aa7-4bfe-b29c-4f032ef55d57	Adic. Band. Vermelha Comp.	323.0000	-0.065730	-21.23	extraido	2026-01-10 18:57:32.561569+00
2f52d131-1450-4bf0-b711-e852c97e8824	aad8f9c4-4aa7-4bfe-b29c-4f032ef55d57	Energia Atv Inj TE oUC 10/2025 mPT GD2	323.0000	-0.317370	-102.51	extraido	2026-01-10 18:57:32.561569+00
2ab7254d-edfc-411b-8601-cf34736f1d91	aad8f9c4-4aa7-4bfe-b29c-4f032ef55d57	Energia Atv Inj TUSD oUC 10/2025 mPT GD2	323.0000	-0.345480	-111.59	extraido	2026-01-10 18:57:32.561569+00
bd6ec6e2-35fc-4321-818a-3ee9213aed67	aad8f9c4-4aa7-4bfe-b29c-4f032ef55d57	Energia Ativa Fornecida TUSD	323.0000	0.601800	194.38	extraido	2026-01-10 18:57:32.561569+00
4faf0edd-76cc-4976-a551-fdef00a19901	aad8f9c4-4aa7-4bfe-b29c-4f032ef55d57	CIP ILUM PUB PREF MUNICIPAL	0.0000	0.000000	29.11	extraido	2026-01-10 18:57:32.561569+00
3f940fb7-f053-4c43-9739-d0d5943d1474	881383be-58f5-4146-8734-cd2094e6778f	Adicional Band. Vermelha	328.0000	0.059390	19.48	extraido	2026-01-10 18:57:26.110602+00
c6a6a6a9-feca-4623-85f3-656be5379a07	881383be-58f5-4146-8734-cd2094e6778f	Energia Consumida Faturada TE	144.0000	0.326880	47.07	extraido	2026-01-10 18:57:26.110602+00
ab20f2e8-02e6-4061-afad-7cbb7a218de8	881383be-58f5-4146-8734-cd2094e6778f	Energia Ativa Fornecida TE	183.0000	0.328630	60.14	extraido	2026-01-10 18:57:26.110602+00
23e666ae-6535-43bf-a944-abb473b4331e	881383be-58f5-4146-8734-cd2094e6778f	Adic. Band. Vermelha Comp.	183.0000	-0.059620	-10.91	extraido	2026-01-10 18:57:26.110602+00
dce15026-3a3a-4d40-9424-8f3e405561e3	881383be-58f5-4146-8734-cd2094e6778f	Energia Atv Inj TE oUC 08/2025 mPT GD2	3.0000	-0.410000	-1.23	extraido	2026-01-10 18:57:26.110602+00
280c03df-9955-4b65-b2c9-39354746d2ae	881383be-58f5-4146-8734-cd2094e6778f	Energia Atv Inj TUSD oUC 08/2025 mPT GD2	3.0000	-0.443330	-1.33	extraido	2026-01-10 18:57:26.110602+00
725df490-e919-40f5-84c8-c0cf64f48fd5	881383be-58f5-4146-8734-cd2094e6778f	Energia Atv Inj TE oUC 09/2025 mPT GD2	71.0000	-0.327750	-23.27	extraido	2026-01-10 18:57:26.110602+00
824fdb07-f28a-4329-869f-f9b29a9c2005	881383be-58f5-4146-8734-cd2094e6778f	Energia Atv Inj TUSD oUC 09/2025 mPT GD2	71.0000	-0.356900	-25.34	extraido	2026-01-10 18:57:26.110602+00
9be2027d-8e15-4302-896e-480b0bd40db3	881383be-58f5-4146-8734-cd2094e6778f	Energia Atv Inj TE oUC 10/2025 mPT GD2	108.0000	-0.329260	-35.56	extraido	2026-01-10 18:57:26.110602+00
fdcc9d78-163f-42e6-8205-0281ace00060	881383be-58f5-4146-8734-cd2094e6778f	Energia Atv Inj TUSD oUC 10/2025 mPT GD2	108.0000	-0.358520	-38.72	extraido	2026-01-10 18:57:26.110602+00
04087085-50ff-43c0-aaa3-87a25d803383	881383be-58f5-4146-8734-cd2094e6778f	Energia Ativa Fornecida TUSD	183.0000	0.622790	113.97	extraido	2026-01-10 18:57:26.110602+00
8b7065d2-dfd2-4d81-b893-e4ca6cd7b74b	881383be-58f5-4146-8734-cd2094e6778f	Energia Consumida Faturada TUSD	144.0000	0.620140	89.30	extraido	2026-01-10 18:57:26.110602+00
a5ee4bb7-59d1-497d-b853-630a57a20f1e	881383be-58f5-4146-8734-cd2094e6778f	CIP ILUM PUB PREF MUNICIPAL	0.0000	0.000000	56.40	extraido	2026-01-10 18:57:26.110602+00
f1d617b4-72e9-49a1-847b-48444c28355d	f2204ab3-744e-4b8f-8ff9-a7abf81ddc18	Adicional Band. Vermelha	271.0000	0.057600	15.61	extraido	2026-01-10 18:57:27.113739+00
3d19c666-09d4-4d89-8e5e-4ba130ec025c	f2204ab3-744e-4b8f-8ff9-a7abf81ddc18	Energia Ativa Fornecida TE	271.0000	0.316640	85.81	extraido	2026-01-10 18:57:27.113739+00
49ea1bd3-a32b-4a6f-8c24-5f0b2bb46271	f2204ab3-744e-4b8f-8ff9-a7abf81ddc18	Adic. Band. Vermelha Comp.	271.0000	-0.057600	-15.61	extraido	2026-01-10 18:57:27.113739+00
8ac453a5-5731-43ea-94db-3c28df204976	f2204ab3-744e-4b8f-8ff9-a7abf81ddc18	Energia Atv Inj TE oUC 07/2025 mPT GD2	271.0000	-0.316640	-85.81	extraido	2026-01-10 18:57:27.113739+00
a02cfe72-d5e8-451b-ba0e-3b74076910e5	f2204ab3-744e-4b8f-8ff9-a7abf81ddc18	Energia Atv Inj TUSD oUC 07/2025 mPT GD2	271.0000	-0.344690	-93.41	extraido	2026-01-10 18:57:27.113739+00
f3418653-0a82-42f3-aa2e-0a7437a0946d	f2204ab3-744e-4b8f-8ff9-a7abf81ddc18	Energia Ativa Fornecida TUSD	271.0000	0.600440	162.72	extraido	2026-01-10 18:57:27.113739+00
5078289c-1c37-4a8d-84c3-e83a7e315901	f2204ab3-744e-4b8f-8ff9-a7abf81ddc18	CIP ILUM PUB PREF MUNICIPAL	0.0000	0.000000	29.11	extraido	2026-01-10 18:57:27.113739+00
14919023-83d3-41d7-892a-cc5156d4684c	39e216b6-a84b-4349-aa65-c131cfb573c8	Adicional Band. Vermelha	4.0000	0.059500	260.36	extraido	2026-01-10 18:57:29.834523+00
e1acaa81-3c56-4e23-b3cb-c1d8f40dc522	39e216b6-a84b-4349-aa65-c131cfb573c8	Energia Ativa Fornecida TE	4.0000	0.326880	1430.43	extraido	2026-01-10 18:57:29.834523+00
6b82ca22-7baf-4e3b-be40-1eb850d63c76	39e216b6-a84b-4349-aa65-c131cfb573c8	Adic. Band. Vermelha Comp.	4.0000	-0.059500	-260.36	extraido	2026-01-10 18:57:29.834523+00
0bd61b2e-87ab-4416-bbbe-33ba10a41016	39e216b6-a84b-4349-aa65-c131cfb573c8	Energia Atv Inj TE mUC 11/2025 mPT GD2	4.0000	-0.326880	-1430.43	extraido	2026-01-10 18:57:29.834523+00
0d1d742c-0706-4639-97d2-3c3a1ad7638e	39e216b6-a84b-4349-aa65-c131cfb573c8	Energia Atv Inj TUSD mUC 11/2025 mPT GD2	4.0000	-0.355800	-1556.96	extraido	2026-01-10 18:57:29.834523+00
5863314a-b762-48db-b55e-0f57da17abea	39e216b6-a84b-4349-aa65-c131cfb573c8	Energia Ativa Fornecida TUSD	4.0000	0.619770	2712.11	extraido	2026-01-10 18:57:29.834523+00
ef057563-a795-44e6-b5d6-7016a08159b6	39e216b6-a84b-4349-aa65-c131cfb573c8	CIP ILUM PUB PREF MUNICIPAL	0.0000	0.000000	372.01	extraido	2026-01-10 18:57:29.834523+00
9a8605d9-153b-4fa9-b3b2-f9efb1512777	ad816e90-a9d3-4bea-bacc-eecf81e5b029	Energia Ativa Fornecida TE	6.0000	0.348270	2205.26	extraido	2026-01-10 18:57:30.024884+00
0a1f9cec-03b8-4ec4-aa96-9ebefef05ea5	ad816e90-a9d3-4bea-bacc-eecf81e5b029	Energia Ativa Fornecida TUSD	6.0000	0.573360	3630.53	extraido	2026-01-10 18:57:30.024884+00
351ad9ba-09f0-46a5-9e79-2210c4edb672	ad816e90-a9d3-4bea-bacc-eecf81e5b029	Energia Atv Inj TE mUC 03/2025 mPT	6.0000	-0.348270	-2194.81	extraido	2026-01-10 18:57:30.024884+00
a4894922-0801-42a2-aa18-36714448a335	ad816e90-a9d3-4bea-bacc-eecf81e5b029	Energia Atv Inj TUSD mUC 03/2025 mPT	6.0000	-0.458690	-2890.67	extraido	2026-01-10 18:57:30.024884+00
b570a90b-9c11-4560-9535-d992b690325f	ad816e90-a9d3-4bea-bacc-eecf81e5b029	CIP ILUM PUB PREF MUNICIPAL	0.0000	0.000000	339.57	extraido	2026-01-10 18:57:30.024884+00
5bea7da6-8558-47fc-8936-1face79c76d5	1c628668-5bec-4816-b4eb-a5cc1bda24eb	Adicional Band. Vermelha	118.0000	0.059320	7.00	extraido	2026-01-10 18:57:31.931601+00
3a6c630e-c506-459f-8830-01cd970bc68b	1c628668-5bec-4816-b4eb-a5cc1bda24eb	Energia Consumida Faturada TE	17.0000	0.336470	5.72	extraido	2026-01-10 18:57:31.931601+00
130fbdd5-48d8-4010-bcde-ba7f22b600e6	1c628668-5bec-4816-b4eb-a5cc1bda24eb	Energia Ativa Fornecida TE	100.0000	0.328300	32.83	extraido	2026-01-10 18:57:31.931601+00
583635fb-51d5-44e5-a046-e4809166aa6b	1c628668-5bec-4816-b4eb-a5cc1bda24eb	Adic. Band. Vermelha Comp.	100.0000	-0.059600	-5.96	extraido	2026-01-10 18:57:31.931601+00
b7e54d98-803a-4718-a1e7-0f89841ca121	1c628668-5bec-4816-b4eb-a5cc1bda24eb	Energia Atv Inj TE oUC 06/2025 mPT GD1	28.0000	-0.334640	-9.37	extraido	2026-01-10 18:57:31.931601+00
47000a25-fdda-4b11-8f6f-b9995c3e055b	1c628668-5bec-4816-b4eb-a5cc1bda24eb	Energia Atv Inj TUSD oUC 06/2025 mPT GD1	28.0000	-0.508210	-14.23	extraido	2026-01-10 18:57:31.931601+00
cd0583a8-67b6-49c0-832f-f0cfe671ce49	1c628668-5bec-4816-b4eb-a5cc1bda24eb	Energia Atv Inj TE oUC 07/2025 mPT GD2	71.0000	-0.330000	-23.43	extraido	2026-01-10 18:57:31.931601+00
d031bd63-f181-4b04-905d-c9ce8481c62e	1c628668-5bec-4816-b4eb-a5cc1bda24eb	Energia Atv Inj TUSD oUC 07/2025 mPT GD2	71.0000	-0.359300	-25.51	extraido	2026-01-10 18:57:31.931601+00
34078032-ac8e-4f59-8946-ed92f52f33bc	1c628668-5bec-4816-b4eb-a5cc1bda24eb	Energia Ativa Fornecida TUSD	100.0000	0.622600	62.26	extraido	2026-01-10 18:57:31.931601+00
53bb4675-d20e-4e4f-8bec-1bcf097e1f3d	1c628668-5bec-4816-b4eb-a5cc1bda24eb	Energia Consumida Faturada TUSD	17.0000	0.638240	10.85	extraido	2026-01-10 18:57:31.931601+00
d2aa3d7e-e971-44a9-96ba-c0d91e740cf4	1c628668-5bec-4816-b4eb-a5cc1bda24eb	CIP ILUM PUB PREF MUNICIPAL	0.0000	0.000000	10.96	extraido	2026-01-10 18:57:31.931601+00
85425e0b-696a-4d70-946c-d565404d4957	fd695d6a-2f34-4f73-8dcb-84ada2ce79a2	Adicional Band. Vermelha	763.0000	0.059460	45.37	extraido	2026-01-10 18:57:32.092632+00
d8d31795-a1e5-4040-a09a-ec3e60f23d49	fd695d6a-2f34-4f73-8dcb-84ada2ce79a2	Energia Ativa Fornecida TE	763.0000	0.326840	249.38	extraido	2026-01-10 18:57:32.092632+00
50a5411a-70b9-4131-9ab8-403e2a5747f5	fd695d6a-2f34-4f73-8dcb-84ada2ce79a2	Adic. Band. Vermelha Comp.	763.0000	-0.059460	-45.37	extraido	2026-01-10 18:57:32.092632+00
83a5cd9e-0388-414a-a5b8-e447a6537948	fd695d6a-2f34-4f73-8dcb-84ada2ce79a2	Energia Atv Inj TE oUC 11/2025 mPT GD2	763.0000	-0.326840	-249.38	extraido	2026-01-10 18:57:32.092632+00
70c9a0a2-9c20-42a2-b8d6-956e2ac209e4	fd695d6a-2f34-4f73-8dcb-84ada2ce79a2	Energia Atv Inj TUSD oUC 11/2025 mPT GD2	763.0000	-0.355780	-271.46	extraido	2026-01-10 18:57:32.092632+00
e90eff66-c421-4a62-b65f-4932bf960b9d	fd695d6a-2f34-4f73-8dcb-84ada2ce79a2	Energia Ativa Fornecida TUSD	763.0000	0.619740	472.86	extraido	2026-01-10 18:57:32.092632+00
81eb22a5-120b-412d-84bd-3a0f7fb4a749	fd695d6a-2f34-4f73-8dcb-84ada2ce79a2	CIP ILUM PUB PREF MUNICIPAL	0.0000	0.000000	60.35	extraido	2026-01-10 18:57:32.092632+00
7f36e8b5-bf8c-4447-a105-a28fb39aceb6	94ad28cc-1f97-4b25-8578-434af15221ef	Adicional Band. Vermelha	748.0000	0.065790	49.21	extraido	2026-01-10 18:57:32.181948+00
32c6c75d-6450-4849-bb4c-9d583e737575	94ad28cc-1f97-4b25-8578-434af15221ef	Energia Ativa Fornecida TE	748.0000	0.317390	237.41	extraido	2026-01-10 18:57:32.181948+00
cbbfeb29-0434-427a-9246-401da8033974	94ad28cc-1f97-4b25-8578-434af15221ef	Adic. Band. Vermelha Comp.	748.0000	-0.065790	-49.21	extraido	2026-01-10 18:57:32.181948+00
9cbb7093-a00c-4600-8ade-e9d502ac6995	94ad28cc-1f97-4b25-8578-434af15221ef	Energia Atv Inj TE oUC 10/2025 mPT GD2	748.0000	-0.317410	-237.42	extraido	2026-01-10 18:57:32.181948+00
33ea5b69-e54f-47e1-8019-dae69a0a15b3	94ad28cc-1f97-4b25-8578-434af15221ef	Energia Atv Inj TUSD oUC 10/2025 mPT GD2	748.0000	-0.345510	-258.44	extraido	2026-01-10 18:57:32.181948+00
a6f36aa3-508f-4d29-aaf7-cce574820945	94ad28cc-1f97-4b25-8578-434af15221ef	Energia Ativa Fornecida TUSD	748.0000	0.601830	450.17	extraido	2026-01-10 18:57:32.181948+00
ac251ca8-2b4e-4ace-aa3d-95830d26fcf8	94ad28cc-1f97-4b25-8578-434af15221ef	CIP ILUM PUB PREF MUNICIPAL	0.0000	0.000000	60.35	extraido	2026-01-10 18:57:32.181948+00
7b00d69b-2920-4c40-bbfc-48e8f4ee1393	f7a8559a-4cb4-4f3c-89e4-58d4f406f024	Adicional Band. Vermelha	138.0000	0.103260	14.25	extraido	2026-01-10 18:57:32.236075+00
0cd08f06-8fea-4150-904e-ad574dd4d5f2	f7a8559a-4cb4-4f3c-89e4-58d4f406f024	Energia Consumida Faturada TE	30.0000	0.320670	9.62	extraido	2026-01-10 18:57:32.236075+00
27e23cf3-4c1e-416c-a66c-c08b839445c8	f7a8559a-4cb4-4f3c-89e4-58d4f406f024	Energia Ativa Fornecida TE	107.0000	0.324770	34.75	extraido	2026-01-10 18:57:32.236075+00
37ac8caf-d88f-47b9-9020-dcf8b0aed6e1	f7a8559a-4cb4-4f3c-89e4-58d4f406f024	Adic. Band. Vermelha Comp.	107.0000	-0.104020	-11.13	extraido	2026-01-10 18:57:32.236075+00
0222d950-8d10-4f27-b9ad-f1f15c57c5fa	f7a8559a-4cb4-4f3c-89e4-58d4f406f024	Energia Atv Inj TE oUC 05/2025 mPT GD1	43.0000	-0.327910	-14.10	extraido	2026-01-10 18:57:32.236075+00
03d53eff-9a3a-484e-ba14-f9223303ab12	317d94da-5bca-4673-8185-d6b94c58193e	Energia Ativa Fornecida TUSD	280.0000	0.610110	170.83	extraido	2026-01-10 18:57:31.727298+00
db5e45e6-8af9-47d7-be31-0abbc288cc46	317d94da-5bca-4673-8185-d6b94c58193e	CIP ILUM PUB PREF MUNICIPAL	0.0000	0.000000	31.39	extraido	2026-01-10 18:57:31.727298+00
8726a7a2-ff7f-4d58-a118-adf0010435e8	ed46a9b3-f122-4954-a792-4f5a0f352c16	Adicional Band. Amarela	603.0000	0.003400	2.05	extraido	2026-01-10 18:57:32.062154+00
24d36d87-114b-4c91-9439-0fe7857a1f6b	ed46a9b3-f122-4954-a792-4f5a0f352c16	Adicional Band. Vermelha	603.0000	0.050880	30.68	extraido	2026-01-10 18:57:32.062154+00
3834c614-f3ad-4968-ae4b-5ceef28eafe0	ed46a9b3-f122-4954-a792-4f5a0f352c16	Energia Consumida Faturada TE	30.0000	0.323670	9.71	extraido	2026-01-10 18:57:32.062154+00
1acdc5f7-e553-4261-815c-8ddfc46db835	ed46a9b3-f122-4954-a792-4f5a0f352c16	Energia Ativa Fornecida TE	573.0000	0.324640	186.02	extraido	2026-01-10 18:57:32.062154+00
42397982-c6b4-486b-a52b-4e738fd75fcd	ed46a9b3-f122-4954-a792-4f5a0f352c16	Adic. Band. Amarela Comp.	573.0000	-0.003400	-1.95	extraido	2026-01-10 18:57:32.062154+00
8fdbcd6e-f578-4889-aeca-f93160c63086	ed46a9b3-f122-4954-a792-4f5a0f352c16	Adic. Band. Vermelha Comp.	573.0000	-0.050910	-29.17	extraido	2026-01-10 18:57:32.062154+00
792c7ecd-614e-45a2-82ce-d53662d050cf	ed46a9b3-f122-4954-a792-4f5a0f352c16	Energia Atv Inj TE oUC 05/2025 mPT GD1	92.0000	-0.326740	-30.06	extraido	2026-01-10 18:57:32.062154+00
fe1cc3d4-f8f4-4dd8-a016-bfffacc0853a	ed46a9b3-f122-4954-a792-4f5a0f352c16	Energia Atv Inj TUSD oUC 05/2025 mPT GD1	92.0000	-0.495760	-45.61	extraido	2026-01-10 18:57:32.062154+00
ebf83d20-a9e1-4238-9884-e9e87efdf99a	ed46a9b3-f122-4954-a792-4f5a0f352c16	Energia Atv Inj TE oUC 06/2025 mPT GD1	480.0000	-0.324810	-155.91	extraido	2026-01-10 18:57:32.062154+00
2afb0760-11e3-471b-b04c-a5bb011c365c	ed46a9b3-f122-4954-a792-4f5a0f352c16	Energia Atv Inj TUSD oUC 06/2025 mPT GD1	480.0000	-0.492710	-236.50	extraido	2026-01-10 18:57:32.062154+00
cf379181-aad9-4a9a-8146-0f4463dcb204	ed46a9b3-f122-4954-a792-4f5a0f352c16	Energia Ativa Fornecida TUSD	573.0000	0.615460	352.66	extraido	2026-01-10 18:57:32.062154+00
83627426-297b-4287-ac6a-12ee3ade3a3a	ed46a9b3-f122-4954-a792-4f5a0f352c16	Energia Consumida Faturada TUSD	30.0000	0.615000	18.45	extraido	2026-01-10 18:57:32.062154+00
9dea9aab-2bce-4ee8-b1fa-4a66deac64e8	ed46a9b3-f122-4954-a792-4f5a0f352c16	CIP ILUM PUB PREF MUNICIPAL	0.0000	0.000000	60.35	extraido	2026-01-10 18:57:32.062154+00
e1e9188a-0a3c-4dba-bf8d-10a330d89058	5185ae2a-28a9-460e-8a84-2587ba0df970	Adicional Band. Amarela	418.0000	0.009500	3.97	extraido	2026-01-10 18:57:32.108177+00
8d782556-f913-4745-85bb-1bca8c1d6faf	5185ae2a-28a9-460e-8a84-2587ba0df970	Adicional Band. Vermelha	418.0000	0.036990	15.46	extraido	2026-01-10 18:57:32.108177+00
64333899-4bc9-4c85-ae34-1d384df1ebbc	5185ae2a-28a9-460e-8a84-2587ba0df970	Energia Ativa Fornecida TE	418.0000	0.327800	137.02	extraido	2026-01-10 18:57:32.108177+00
cf683133-b83d-430b-82ac-efd2f0bee8bb	5185ae2a-28a9-460e-8a84-2587ba0df970	Adic. Band. Amarela Comp.	418.0000	-0.009500	-3.97	extraido	2026-01-10 18:57:32.108177+00
e1269bd0-d0a0-4f26-99e2-99b8761452a6	5185ae2a-28a9-460e-8a84-2587ba0df970	Adic. Band. Vermelha Comp.	418.0000	-0.036990	-15.46	extraido	2026-01-10 18:57:32.108177+00
c3c71596-d2a2-4977-811d-77beef5aa8b3	5185ae2a-28a9-460e-8a84-2587ba0df970	Energia Atv Inj TE oUC 10/2025 mPT GD2	418.0000	-0.327800	-137.02	extraido	2026-01-10 18:57:32.108177+00
11c3e720-30e3-496f-8c21-05522d031589	5185ae2a-28a9-460e-8a84-2587ba0df970	Energia Atv Inj TUSD oUC 10/2025 mPT GD2	418.0000	-0.356840	-149.16	extraido	2026-01-10 18:57:32.108177+00
a5a554ce-f566-4ad9-9659-15078f2f0cb5	5185ae2a-28a9-460e-8a84-2587ba0df970	Energia Ativa Fornecida TUSD	418.0000	0.621580	259.82	extraido	2026-01-10 18:57:32.108177+00
784e815f-a86e-423d-af4a-4edeca9819c8	5185ae2a-28a9-460e-8a84-2587ba0df970	CIP ILUM PUB PREF MUNICIPAL	0.0000	0.000000	27.91	extraido	2026-01-10 18:57:32.108177+00
8b2599aa-b823-466c-a0f5-5bab598a6174	c040215d-58dd-4b66-b19f-884e1f7d3c5d	Energia Ativa Fornecida TE	4.0000	0.329940	1321.08	extraido	2026-01-10 18:57:32.205605+00
9f171991-e814-4a8b-9b87-2bbb65b957a4	c040215d-58dd-4b66-b19f-884e1f7d3c5d	Energia Ativa Fornecida TUSD	4.0000	0.625570	2504.78	extraido	2026-01-10 18:57:32.205605+00
58e72b82-b080-4852-b046-b0ee2751d670	c040215d-58dd-4b66-b19f-884e1f7d3c5d	Energia Atv Inj TE mUC 05/2025 mPT	3.0000	-0.329940	-1311.18	extraido	2026-01-10 18:57:32.205605+00
5c8de30c-cf3a-4921-a291-17690ba2a6a2	c040215d-58dd-4b66-b19f-884e1f7d3c5d	Energia Atv Inj TUSD mUC 05/2025 mPT	3.0000	-0.500460	-1988.82	extraido	2026-01-10 18:57:32.205605+00
444d1f99-cd6b-46f4-a8ab-fb3257da1d74	c040215d-58dd-4b66-b19f-884e1f7d3c5d	Adic. Band. Amarela Comp.	3.0000	-0.022090	-87.78	extraido	2026-01-10 18:57:32.205605+00
d2676f7f-5fd4-4986-83a8-7ab6fde49869	c040215d-58dd-4b66-b19f-884e1f7d3c5d	Adicional Band. Amarela	4.0000	0.022090	88.43	extraido	2026-01-10 18:57:32.205605+00
4b5d3823-6f36-4d0f-9f12-3b776c44b6d1	c040215d-58dd-4b66-b19f-884e1f7d3c5d	CIP ILUM PUB PREF MUNICIPAL	0.0000	0.000000	349.97	extraido	2026-01-10 18:57:32.205605+00
90bb5a96-21b8-4464-8e60-7732c20e1320	2963ea13-c8ab-4bb2-9434-da24797250a0	Energia Ativa Fornecida TE	958.0000	0.334450	320.40	extraido	2026-01-10 18:57:32.207201+00
8eae398f-b1e7-4c46-a462-c477d548d742	2963ea13-c8ab-4bb2-9434-da24797250a0	Energia Ativa Fornecida TUSD	958.0000	0.622970	596.81	extraido	2026-01-10 18:57:32.207201+00
52027c49-45b8-4315-a80a-422b20c4894e	2963ea13-c8ab-4bb2-9434-da24797250a0	Energia Atv Inj TE oUC 05/2025 mPT	695.0000	-0.334470	-232.46	extraido	2026-01-10 18:57:32.207201+00
81d4cb01-37e0-403e-9fd5-e24a234dd6cf	2963ea13-c8ab-4bb2-9434-da24797250a0	Energia Atv Inj TUSD oUC 05/2025 mPT	695.0000	-0.498390	-346.38	extraido	2026-01-10 18:57:32.207201+00
23ee4d6c-c18c-4788-8d25-d393b89a07b3	2963ea13-c8ab-4bb2-9434-da24797250a0	Adic. Band. Amarela Comp.	695.0000	-0.016630	-11.56	extraido	2026-01-10 18:57:32.207201+00
21124ff4-24a3-4c15-9e07-6343b0f3c7a5	2963ea13-c8ab-4bb2-9434-da24797250a0	Adicional Band. Amarela	958.0000	0.016660	15.96	extraido	2026-01-10 18:57:32.207201+00
13169b02-d205-4dbb-88e0-b39b56b07399	2963ea13-c8ab-4bb2-9434-da24797250a0	CIP ILUM PUB PREF MUNICIPAL	0.0000	0.000000	77.98	extraido	2026-01-10 18:57:32.207201+00
1a6e4863-c2e1-4dd5-b6af-569e147ae683	5f7ecf77-8e50-4fbe-9c4c-d0f17339d9a5	Adicional Band. Vermelha	1.0000	0.065800	71.13	extraido	2026-01-10 18:57:32.586563+00
fa6cbec8-058e-4a2a-b9d9-ab5a3d432cfc	5f7ecf77-8e50-4fbe-9c4c-d0f17339d9a5	Energia Ativa Fornecida TE	1.0000	0.317410	343.12	extraido	2026-01-10 18:57:32.586563+00
e7962585-7959-4985-acc1-e40d7f25f42a	5f7ecf77-8e50-4fbe-9c4c-d0f17339d9a5	Adic. Band. Vermelha Comp.	1.0000	-0.065800	-71.13	extraido	2026-01-10 18:57:32.586563+00
c48764f8-2b90-4cee-8dcb-33e45a28825c	5f7ecf77-8e50-4fbe-9c4c-d0f17339d9a5	Energia Atv Inj TE oUC 10/2025 mPT GD2	1.0000	-0.317420	-343.13	extraido	2026-01-10 18:57:32.586563+00
170ec3ae-a626-4a0c-a8ee-559668cb41ba	5f7ecf77-8e50-4fbe-9c4c-d0f17339d9a5	Energia Atv Inj TUSD oUC 10/2025 mPT GD2	1.0000	-0.345490	-373.48	extraido	2026-01-10 18:57:32.586563+00
897b08fb-b758-4bed-a9dc-e0db4fb3d21d	5f7ecf77-8e50-4fbe-9c4c-d0f17339d9a5	Energia Ativa Fornecida TUSD	1.0000	0.601820	650.57	extraido	2026-01-10 18:57:32.586563+00
31c52612-f80b-4b9b-813c-0b02dcb93a20	5f7ecf77-8e50-4fbe-9c4c-d0f17339d9a5	CIP ILUM PUB PREF MUNICIPAL	0.0000	0.000000	150.82	extraido	2026-01-10 18:57:32.586563+00
ece882c8-2656-49cc-8fb6-05a883fc3271	d01c5cab-5efb-419d-a854-42e703b9a75f	Adicional Band. Vermelha	92.0000	0.074130	6.82	extraido	2026-01-10 18:57:33.124343+00
355dac33-2ccb-402a-83c4-da3eb6934659	d01c5cab-5efb-419d-a854-42e703b9a75f	Energia Consumida Faturada TE	30.0000	0.317000	9.51	extraido	2026-01-10 18:57:33.124343+00
1b5d9d57-a590-45b8-8fd0-a26157793fcd	d01c5cab-5efb-419d-a854-42e703b9a75f	Energia Ativa Fornecida TE	61.0000	0.322460	19.67	extraido	2026-01-10 18:57:33.124343+00
f07dda29-e971-4171-9143-d6bb5b6647e0	d01c5cab-5efb-419d-a854-42e703b9a75f	Adic. Band. Vermelha Comp.	61.0000	-0.075080	-4.58	extraido	2026-01-10 18:57:33.124343+00
3f8f1740-aab9-40ac-b344-9533b3eb84c3	d01c5cab-5efb-419d-a854-42e703b9a75f	Energia Atv Inj TE oUC 06/2025 mPT GD1	61.0000	-0.322300	-19.66	extraido	2026-01-10 18:57:33.124343+00
c9cde841-c76a-4444-ac87-f82e3f4adb7f	d01c5cab-5efb-419d-a854-42e703b9a75f	Energia Atv Inj TUSD oUC 06/2025 mPT GD1	61.0000	-0.489020	-29.83	extraido	2026-01-10 18:57:33.124343+00
fbab123c-6fbd-4e9a-9197-b92244914a93	d01c5cab-5efb-419d-a854-42e703b9a75f	Energia Ativa Fornecida TUSD	61.0000	0.611150	37.28	extraido	2026-01-10 18:57:33.124343+00
af62c5f6-ee2b-46ca-8660-e6aab1ff991d	d01c5cab-5efb-419d-a854-42e703b9a75f	Energia Consumida Faturada TUSD	30.0000	0.602330	18.07	extraido	2026-01-10 18:57:33.124343+00
a5ec0772-f2c5-4b93-9f23-a04471f89907	d01c5cab-5efb-419d-a854-42e703b9a75f	CIP ILUM PUB PREF MUNICIPAL	0.0000	0.000000	4.65	extraido	2026-01-10 18:57:33.124343+00
2f04a0da-8e74-480a-abdc-f43b4d2d221f	0fb79693-5afc-4b2d-9f5e-01a69db2f3dc	Adicional Band. Vermelha	132.0000	0.103180	13.62	extraido	2026-01-10 18:57:35.824519+00
e76f957e-8441-40ec-b6b5-b55b41a4cf00	0fb79693-5afc-4b2d-9f5e-01a69db2f3dc	Energia Consumida Faturada TE	9.0000	0.342220	3.08	extraido	2026-01-10 18:57:35.824519+00
6d418f35-c46b-450a-9839-7781da83b3a7	0fb79693-5afc-4b2d-9f5e-01a69db2f3dc	Energia Ativa Fornecida TE	122.0000	0.322540	39.35	extraido	2026-01-10 18:57:35.824519+00
f2c8607b-27ee-46d6-b70a-2c836609567c	0fb79693-5afc-4b2d-9f5e-01a69db2f3dc	Adic. Band. Vermelha Comp.	122.0000	-0.103440	-12.62	extraido	2026-01-10 18:57:35.824519+00
1a7c09ee-f653-41fd-a74c-f06b08641251	0fb79693-5afc-4b2d-9f5e-01a69db2f3dc	Energia Atv Inj TE oUC 07/2025 mPT GD2	34.0000	-0.327350	-11.13	extraido	2026-01-10 18:57:35.824519+00
a25e4f21-a14a-4ab1-9194-89be7e18b285	f7a8559a-4cb4-4f3c-89e4-58d4f406f024	Energia Atv Inj TUSD oUC 05/2025 mPT GD1	43.0000	-0.497910	-21.41	extraido	2026-01-10 18:57:32.236075+00
dc83de05-aeef-4c56-9f2b-2b6fe4d1eb08	f7a8559a-4cb4-4f3c-89e4-58d4f406f024	Energia Atv Inj TE oUC 06/2025 mPT GD1	64.0000	-0.321880	-20.60	extraido	2026-01-10 18:57:32.236075+00
eeac1c7d-12ca-4ce9-92bc-97ce437c619a	f7a8559a-4cb4-4f3c-89e4-58d4f406f024	Energia Atv Inj TUSD oUC 06/2025 mPT GD1	64.0000	-0.488280	-31.25	extraido	2026-01-10 18:57:32.236075+00
a2c04590-5987-4cb8-ba80-76b527cf3d09	f7a8559a-4cb4-4f3c-89e4-58d4f406f024	Energia Ativa Fornecida TUSD	107.0000	0.615230	65.83	extraido	2026-01-10 18:57:32.236075+00
7c285335-092f-40b3-bd68-d9e1b538c8c2	f7a8559a-4cb4-4f3c-89e4-58d4f406f024	Energia Consumida Faturada TUSD	30.0000	0.610670	18.32	extraido	2026-01-10 18:57:32.236075+00
85d2fa96-659f-4414-bdcb-8ae65abb31c8	f7a8559a-4cb4-4f3c-89e4-58d4f406f024	CIP ILUM PUB PREF MUNICIPAL	0.0000	0.000000	11.82	extraido	2026-01-10 18:57:32.236075+00
6efbf1c7-dfad-4f86-a202-f150257a793c	0c59aca1-3a47-4b89-8aeb-56422813a40f	Adicional Band. Vermelha	130.0000	0.078230	10.17	extraido	2026-01-10 18:57:32.309716+00
6935d008-97cc-4ce4-9672-0408ae726fa4	0c59aca1-3a47-4b89-8aeb-56422813a40f	Energia Consumida Faturada TE	9.0000	0.331110	2.98	extraido	2026-01-10 18:57:32.309716+00
2192f8d4-2ba0-44ce-b75b-12d6bbce6240	0c59aca1-3a47-4b89-8aeb-56422813a40f	Energia Ativa Fornecida TE	120.0000	0.318920	38.27	extraido	2026-01-10 18:57:32.309716+00
728e03ba-c37a-4af8-b7af-41a1a87a291b	0c59aca1-3a47-4b89-8aeb-56422813a40f	Adic. Band. Vermelha Comp.	120.0000	-0.078500	-9.42	extraido	2026-01-10 18:57:32.309716+00
e8802a53-c310-4165-8558-98bd33ee9bd8	0c59aca1-3a47-4b89-8aeb-56422813a40f	Energia Atv Inj TE oUC 08/2025 mPT GD2	120.0000	-0.318580	-38.23	extraido	2026-01-10 18:57:32.309716+00
d36f69d2-f8f3-4a2e-bf3b-918f71700e70	0c59aca1-3a47-4b89-8aeb-56422813a40f	Energia Atv Inj TUSD oUC 08/2025 mPT GD2	120.0000	-0.346830	-41.62	extraido	2026-01-10 18:57:32.309716+00
9bcea61e-7f65-42ea-b6e7-1d18840ade27	0c59aca1-3a47-4b89-8aeb-56422813a40f	Energia Ativa Fornecida TUSD	120.0000	0.604250	72.51	extraido	2026-01-10 18:57:32.309716+00
56e4c8a6-a1e2-4d0b-920b-50f0d40dfb44	0c59aca1-3a47-4b89-8aeb-56422813a40f	Energia Consumida Faturada TUSD	9.0000	0.634440	5.71	extraido	2026-01-10 18:57:32.309716+00
3ffe2134-1359-498f-b916-9ec398b8805b	0c59aca1-3a47-4b89-8aeb-56422813a40f	CIP ILUM PUB PREF MUNICIPAL	0.0000	0.000000	10.96	extraido	2026-01-10 18:57:32.309716+00
7db49c76-2ff5-4eb6-8ac9-c0e57c9b663c	f956c8ce-b99d-43f3-9e8f-6b9dc40f0675	Adicional Band. Vermelha	316.0000	0.103320	32.65	extraido	2026-01-10 18:57:32.399359+00
00215790-4892-43d4-94df-7c793ec2b313	f956c8ce-b99d-43f3-9e8f-6b9dc40f0675	Energia Ativa Fornecida TE	316.0000	0.321610	101.63	extraido	2026-01-10 18:57:32.399359+00
4060f0ff-80c9-483a-9a5c-4868664298f5	f956c8ce-b99d-43f3-9e8f-6b9dc40f0675	Adic. Band. Vermelha Comp.	316.0000	-0.103320	-32.65	extraido	2026-01-10 18:57:32.399359+00
3f8f2b54-bd94-4a8b-b428-230f373ae297	f956c8ce-b99d-43f3-9e8f-6b9dc40f0675	Energia Atv Inj TE oUC 06/2025 mPT GD1	127.0000	-0.321520	-41.10	extraido	2026-01-10 18:57:32.399359+00
3aabd52e-7869-4471-9aba-f8eec4b1e7a0	f956c8ce-b99d-43f3-9e8f-6b9dc40f0675	Energia Atv Inj TUSD oUC 06/2025 mPT GD1	127.0000	-0.487830	-62.36	extraido	2026-01-10 18:57:32.399359+00
898d5950-d468-4189-9d2b-c0d534fcb005	f956c8ce-b99d-43f3-9e8f-6b9dc40f0675	Energia Atv Inj TE oUC 07/2025 mPT GD2	188.0000	-0.321570	-60.51	extraido	2026-01-10 18:57:32.399359+00
02b909b3-eaf2-4801-b695-c5e464bf372c	f956c8ce-b99d-43f3-9e8f-6b9dc40f0675	Energia Atv Inj TUSD oUC 07/2025 mPT GD2	188.0000	-0.350000	-65.86	extraido	2026-01-10 18:57:32.399359+00
daff964a-b93f-4d90-a973-3d416794bcf9	f956c8ce-b99d-43f3-9e8f-6b9dc40f0675	Energia Ativa Fornecida TUSD	316.0000	0.609840	192.71	extraido	2026-01-10 18:57:32.399359+00
dfe9b70a-1bba-4d45-b24f-feb963f95fe6	f956c8ce-b99d-43f3-9e8f-6b9dc40f0675	CIP ILUM PUB PREF MUNICIPAL	0.0000	0.000000	60.82	extraido	2026-01-10 18:57:32.399359+00
d4088992-ab7f-406e-8ab5-885415352bc4	e3b0f455-7aea-48a9-be37-1da287c9f298	Adicional Band. Vermelha	277.0000	0.103250	28.60	extraido	2026-01-10 18:57:32.415074+00
c9b1d182-3878-416e-9545-c4560515e5da	e3b0f455-7aea-48a9-be37-1da287c9f298	Energia Ativa Fornecida TE	277.0000	0.321550	89.07	extraido	2026-01-10 18:57:32.415074+00
9d6b38b2-ff93-43d4-ad8b-2fab861b3a55	e3b0f455-7aea-48a9-be37-1da287c9f298	Adic. Band. Vermelha Comp.	277.0000	-0.103250	-28.60	extraido	2026-01-10 18:57:32.415074+00
7a0791c2-7e27-405a-89b6-9c3f3d994f37	e3b0f455-7aea-48a9-be37-1da287c9f298	Energia Atv Inj TE oUC 09/2025 mPT GD2	277.0000	-0.321550	-89.07	extraido	2026-01-10 18:57:32.415074+00
3e638bdf-6a0c-4dac-9c74-1089fceef8a0	e3b0f455-7aea-48a9-be37-1da287c9f298	Energia Atv Inj TUSD oUC 09/2025 mPT GD2	277.0000	-0.350070	-96.97	extraido	2026-01-10 18:57:32.415074+00
b40e3360-1a07-42d3-829b-c0c82b2efcc6	e3b0f455-7aea-48a9-be37-1da287c9f298	Energia Ativa Fornecida TUSD	277.0000	0.609780	168.91	extraido	2026-01-10 18:57:32.415074+00
8bb59683-817c-48a8-8307-8e2aaf4df42f	e3b0f455-7aea-48a9-be37-1da287c9f298	CIP ILUM PUB PREF MUNICIPAL	0.0000	0.000000	31.39	extraido	2026-01-10 18:57:32.415074+00
097da282-a716-4879-85b4-287b809d2be0	1cd2f21b-f887-4c0d-a7bd-aed26e1f60f1	Adicional Band. Vermelha	139.0000	0.059350	8.25	extraido	2026-01-10 18:57:32.43543+00
9f833534-38ac-4e4a-8932-14191277ac4d	1cd2f21b-f887-4c0d-a7bd-aed26e1f60f1	Energia Consumida Faturada TE	7.0000	0.328570	2.30	extraido	2026-01-10 18:57:32.43543+00
7a94955f-712a-4250-bdb4-e302fbaa84c0	1cd2f21b-f887-4c0d-a7bd-aed26e1f60f1	Energia Ativa Fornecida TE	131.0000	0.329160	43.12	extraido	2026-01-10 18:57:32.43543+00
0ee0d9f8-8eb1-4ed3-b401-2f5ecceb8abe	1cd2f21b-f887-4c0d-a7bd-aed26e1f60f1	Adic. Band. Vermelha Comp.	131.0000	-0.059770	-7.83	extraido	2026-01-10 18:57:32.43543+00
f703a5ec-57cd-4868-abb2-763218a4179a	1cd2f21b-f887-4c0d-a7bd-aed26e1f60f1	Energia Atv Inj TE oUC 08/2025 mPT GD2	2.0000	-0.440000	-0.88	extraido	2026-01-10 18:57:32.43543+00
89289301-382f-4c4c-b938-067a873001c7	1cd2f21b-f887-4c0d-a7bd-aed26e1f60f1	Energia Atv Inj TUSD oUC 08/2025 mPT GD2	2.0000	-0.490000	-0.98	extraido	2026-01-10 18:57:32.43543+00
abf62154-add0-436c-9f38-a58d1dcc8a23	1cd2f21b-f887-4c0d-a7bd-aed26e1f60f1	Energia Atv Inj TE oUC 09/2025 mPT GD2	129.0000	-0.327130	-42.20	extraido	2026-01-10 18:57:32.43543+00
9e4cbafd-c500-4846-ba17-148d2a08741b	1cd2f21b-f887-4c0d-a7bd-aed26e1f60f1	Energia Atv Inj TUSD oUC 09/2025 mPT GD2	129.0000	-0.356200	-45.95	extraido	2026-01-10 18:57:32.43543+00
1dffccaf-5162-4929-bcda-03c30d22bf16	1cd2f21b-f887-4c0d-a7bd-aed26e1f60f1	Energia Ativa Fornecida TUSD	131.0000	0.624120	81.76	extraido	2026-01-10 18:57:32.43543+00
b32fb671-ef3b-4231-9794-007e0d2344c5	1cd2f21b-f887-4c0d-a7bd-aed26e1f60f1	Energia Consumida Faturada TUSD	7.0000	0.622860	4.36	extraido	2026-01-10 18:57:32.43543+00
05727407-4fab-4211-a2ff-97d289f6cce0	1cd2f21b-f887-4c0d-a7bd-aed26e1f60f1	CIP ILUM PUB PREF MUNICIPAL	0.0000	0.000000	10.96	extraido	2026-01-10 18:57:32.43543+00
fb61f9f7-b36c-48ce-9be0-9cce09cba601	195e6548-4488-47e2-99ee-d52eb6c687f1	Adicional Band. Vermelha	319.0000	0.059400	18.95	extraido	2026-01-10 18:57:32.475127+00
de188f57-261f-4318-aa5e-b82a31dbe038	195e6548-4488-47e2-99ee-d52eb6c687f1	Energia Ativa Fornecida TE	319.0000	0.326830	104.26	extraido	2026-01-10 18:57:32.475127+00
56332012-d493-4b23-b1e7-144a441ff15c	195e6548-4488-47e2-99ee-d52eb6c687f1	Adic. Band. Vermelha Comp.	319.0000	-0.059400	-18.95	extraido	2026-01-10 18:57:32.475127+00
2c05068e-8ba7-44c5-a794-b150fcd9bcbf	195e6548-4488-47e2-99ee-d52eb6c687f1	Energia Atv Inj TE oUC 11/2025 mPT GD2	319.0000	-0.326830	-104.26	extraido	2026-01-10 18:57:32.475127+00
49dfad20-526a-4358-8793-301176a29032	195e6548-4488-47e2-99ee-d52eb6c687f1	Energia Atv Inj TUSD oUC 11/2025 mPT GD2	319.0000	-0.355770	-113.49	extraido	2026-01-10 18:57:32.475127+00
9e63b559-e5fd-4699-9b57-36683a213ff8	195e6548-4488-47e2-99ee-d52eb6c687f1	Energia Ativa Fornecida TUSD	319.0000	0.619690	197.68	extraido	2026-01-10 18:57:32.475127+00
7b1ae5f7-8c76-4da8-a8d8-52d0e20b0a9d	195e6548-4488-47e2-99ee-d52eb6c687f1	CIP ILUM PUB PREF MUNICIPAL	0.0000	0.000000	29.11	extraido	2026-01-10 18:57:32.475127+00
4c7be21f-a3ba-407a-973d-c56ba70bf8b4	227dbdd1-850c-455a-be7a-5f7036e7e559	Adicional Band. Vermelha	905.0000	0.103310	93.50	extraido	2026-01-10 18:57:32.498571+00
536addb7-6af5-413f-9d46-7bb3ce786e3d	227dbdd1-850c-455a-be7a-5f7036e7e559	Energia Ativa Fornecida TE	905.0000	0.321640	291.08	extraido	2026-01-10 18:57:32.498571+00
4ab2fcac-459a-4ed3-8c4b-ff2f3f887d5b	227dbdd1-850c-455a-be7a-5f7036e7e559	Adic. Band. Vermelha Comp.	905.0000	-0.103310	-93.50	extraido	2026-01-10 18:57:32.498571+00
0829a13c-7fff-42d5-9384-65931332ba2e	227dbdd1-850c-455a-be7a-5f7036e7e559	Energia Atv Inj TE oUC 09/2025 mPT GD2	905.0000	-0.321640	-291.08	extraido	2026-01-10 18:57:32.498571+00
a16519c3-b7b8-4e8b-b791-80aff4905c75	227dbdd1-850c-455a-be7a-5f7036e7e559	Energia Atv Inj TUSD oUC 09/2025 mPT GD2	905.0000	-0.350110	-316.85	extraido	2026-01-10 18:57:32.498571+00
c53ff665-289c-478c-9510-d8d186ab21ad	227dbdd1-850c-455a-be7a-5f7036e7e559	Energia Ativa Fornecida TUSD	905.0000	0.609860	551.92	extraido	2026-01-10 18:57:32.498571+00
df133b60-30b7-4fc6-8bbd-83ee46a807b9	227dbdd1-850c-455a-be7a-5f7036e7e559	CIP ILUM PUB PREF MUNICIPAL	0.0000	0.000000	89.40	extraido	2026-01-10 18:57:32.498571+00
981eb069-2c68-448a-be02-8e14efd9f012	1f4860a9-1d89-447f-b95b-fc0d6e70e7c2	Adicional Band. Vermelha	195.0000	0.103230	20.13	extraido	2026-01-10 18:57:32.546562+00
19a2ac75-4e54-4244-91e3-568657893224	1f4860a9-1d89-447f-b95b-fc0d6e70e7c2	Energia Ativa Fornecida TE	195.0000	0.321590	62.71	extraido	2026-01-10 18:57:32.546562+00
905226be-3d3c-43e4-a528-8e2915b0c3ec	1f4860a9-1d89-447f-b95b-fc0d6e70e7c2	Adic. Band. Vermelha Comp.	195.0000	-0.103230	-20.13	extraido	2026-01-10 18:57:32.546562+00
96371c1e-1473-4c92-a479-dc90b2fd3681	1f4860a9-1d89-447f-b95b-fc0d6e70e7c2	Energia Atv Inj TE oUC 09/2025 mPT GD2	195.0000	-0.321590	-62.71	extraido	2026-01-10 18:57:32.546562+00
93e17b3b-dcff-4824-811a-eab734a92e28	1f4860a9-1d89-447f-b95b-fc0d6e70e7c2	Energia Atv Inj TUSD oUC 09/2025 mPT GD2	195.0000	-0.350100	-68.27	extraido	2026-01-10 18:57:32.546562+00
e9a5c2da-24c1-42b8-8a88-e4a21e943a6b	1f4860a9-1d89-447f-b95b-fc0d6e70e7c2	Energia Ativa Fornecida TUSD	195.0000	0.609790	118.91	extraido	2026-01-10 18:57:32.546562+00
075df066-65f3-4df1-a6f8-ab4752065147	1f4860a9-1d89-447f-b95b-fc0d6e70e7c2	CIP ILUM PUB PREF MUNICIPAL	0.0000	0.000000	41.86	extraido	2026-01-10 18:57:32.546562+00
320bf3c2-5872-4faa-939c-a7c3e1fecd5a	cdd9395c-f10b-446f-a342-eca9a43fe2ef	Adicional Band. Vermelha	310.0000	0.096000	29.76	extraido	2026-01-10 18:57:32.605087+00
dd7c57aa-27f5-46ab-8924-4a9b080acff4	cdd9395c-f10b-446f-a342-eca9a43fe2ef	Energia Ativa Fornecida TE	310.0000	0.317320	98.37	extraido	2026-01-10 18:57:32.605087+00
d6556237-3444-4b6a-9f30-f14191a7dca2	cdd9395c-f10b-446f-a342-eca9a43fe2ef	Adic. Band. Vermelha Comp.	310.0000	-0.096000	-29.76	extraido	2026-01-10 18:57:32.605087+00
0f0e4e75-16f6-4b3e-b94b-0dff83532e60	cdd9395c-f10b-446f-a342-eca9a43fe2ef	Energia Atv Inj TE oUC 07/2025 mPT GD2	162.0000	-0.317330	-51.72	extraido	2026-01-10 18:57:32.605087+00
8b3fdbad-dd81-4513-8b33-aeb165b9288b	cdd9395c-f10b-446f-a342-eca9a43fe2ef	Energia Atv Inj TUSD oUC 07/2025 mPT GD2	162.0000	-0.345430	-56.30	extraido	2026-01-10 18:57:32.605087+00
afeef543-e5e1-457e-94b8-cc599f33dc70	cdd9395c-f10b-446f-a342-eca9a43fe2ef	Energia Atv Inj TE oUC 08/2025 mPT GD2	147.0000	-0.317310	-46.65	extraido	2026-01-10 18:57:32.605087+00
ca7b8274-38f5-4302-b40b-eef485a982e9	cdd9395c-f10b-446f-a342-eca9a43fe2ef	Energia Atv Inj TUSD oUC 08/2025 mPT GD2	147.0000	-0.345410	-50.78	extraido	2026-01-10 18:57:32.605087+00
34733980-e3b2-4dfd-a2e6-7cc0db1d319b	cdd9395c-f10b-446f-a342-eca9a43fe2ef	Energia Ativa Fornecida TUSD	310.0000	0.601770	186.55	extraido	2026-01-10 18:57:32.605087+00
00445886-9c81-4677-b057-cd7d4dffee07	cdd9395c-f10b-446f-a342-eca9a43fe2ef	CIP ILUM PUB PREF MUNICIPAL	0.0000	0.000000	56.40	extraido	2026-01-10 18:57:32.605087+00
beb59154-05c5-430e-903c-3e85a61616f3	d48ed6fc-be35-4c51-a3a1-c3bb68ec1236	Adicional Band. Vermelha	600.0000	0.103300	61.98	extraido	2026-01-10 18:57:32.550016+00
2ec0c5ce-af00-4406-95a6-a3204c8760c6	d48ed6fc-be35-4c51-a3a1-c3bb68ec1236	Energia Ativa Fornecida TE	600.0000	0.321630	192.98	extraido	2026-01-10 18:57:32.550016+00
bebbe206-b184-4692-82e8-00f977ba74bd	d48ed6fc-be35-4c51-a3a1-c3bb68ec1236	Adic. Band. Vermelha Comp.	600.0000	-0.103300	-61.98	extraido	2026-01-10 18:57:32.550016+00
1a3034f5-f38d-4bad-89ff-0afe43b7adba	d48ed6fc-be35-4c51-a3a1-c3bb68ec1236	Energia Atv Inj TE oUC 09/2025 mPT GD2	600.0000	-0.321630	-192.98	extraido	2026-01-10 18:57:32.550016+00
5f24c071-c143-4c15-9513-584d496d3141	d48ed6fc-be35-4c51-a3a1-c3bb68ec1236	Energia Atv Inj TUSD oUC 09/2025 mPT GD2	600.0000	-0.350080	-210.05	extraido	2026-01-10 18:57:32.550016+00
b73f74dc-ce52-4c30-9f3a-7241f5d2c776	d48ed6fc-be35-4c51-a3a1-c3bb68ec1236	Energia Ativa Fornecida TUSD	600.0000	0.609830	365.90	extraido	2026-01-10 18:57:32.550016+00
8ee633b7-46da-471a-91cd-be67c5f8833d	d48ed6fc-be35-4c51-a3a1-c3bb68ec1236	CIP ILUM PUB PREF MUNICIPAL	0.0000	0.000000	65.09	extraido	2026-01-10 18:57:32.550016+00
0c73c8a7-e2f9-43ec-b450-43a6eea47f39	fd05e518-4716-4b62-8157-9f965a9a5ac3	Adicional Band. Vermelha	295.0000	0.065690	19.38	extraido	2026-01-10 18:57:35.821448+00
370b6c5f-4c0b-411d-b437-f9721463cf3a	fd05e518-4716-4b62-8157-9f965a9a5ac3	Energia Ativa Fornecida TE	295.0000	0.317320	93.61	extraido	2026-01-10 18:57:35.821448+00
f43056b5-5013-4ae0-aaba-79db9d59b1d7	fd05e518-4716-4b62-8157-9f965a9a5ac3	Adic. Band. Vermelha Comp.	295.0000	-0.065690	-19.38	extraido	2026-01-10 18:57:35.821448+00
e21faae1-8100-4852-86e5-f9d3a4ad1f5e	fd05e518-4716-4b62-8157-9f965a9a5ac3	Energia Atv Inj TE oUC 10/2025 mPT GD2	295.0000	-0.317360	-93.62	extraido	2026-01-10 18:57:35.821448+00
d91556d9-c13b-4531-ace1-1e34f0d6f102	fd05e518-4716-4b62-8157-9f965a9a5ac3	Energia Atv Inj TUSD oUC 10/2025 mPT GD2	295.0000	-0.345490	-101.92	extraido	2026-01-10 18:57:35.821448+00
c605b649-d06a-476b-8fb8-91106881c83e	fd05e518-4716-4b62-8157-9f965a9a5ac3	Energia Ativa Fornecida TUSD	295.0000	0.601760	177.52	extraido	2026-01-10 18:57:35.821448+00
b72dd196-9aad-4017-b720-a8c83c9eb65a	fd05e518-4716-4b62-8157-9f965a9a5ac3	CIP ILUM PUB PREF MUNICIPAL	0.0000	0.000000	48.52	extraido	2026-01-10 18:57:35.821448+00
941060ef-86ef-4605-ad50-8c487a927365	ca72314c-b674-4940-9247-711b1fab8510	Adicional Band. Vermelha	388.0000	0.083400	32.36	extraido	2026-01-10 18:57:32.568181+00
11a170d7-ce44-4a01-abe8-d5640d95e6f0	ca72314c-b674-4940-9247-711b1fab8510	Energia Ativa Fornecida TE	388.0000	0.317350	123.13	extraido	2026-01-10 18:57:32.568181+00
84345d50-b851-4874-bbeb-4724c96f7df7	ca72314c-b674-4940-9247-711b1fab8510	Adic. Band. Vermelha Comp.	388.0000	-0.083400	-32.36	extraido	2026-01-10 18:57:32.568181+00
a85a0051-564d-4ad7-928d-c8ee088f83b5	ca72314c-b674-4940-9247-711b1fab8510	Energia Atv Inj TE oUC 08/2025 mPT GD2	131.0000	-0.317210	-41.72	extraido	2026-01-10 18:57:32.568181+00
101b8f73-6524-428b-b28f-e303bf53c0e8	ca72314c-b674-4940-9247-711b1fab8510	Energia Atv Inj TUSD oUC 08/2025 mPT GD2	131.0000	-0.345410	-45.43	extraido	2026-01-10 18:57:32.568181+00
10b9dfcf-9df7-49bb-ba27-1daf7eedf980	ca72314c-b674-4940-9247-711b1fab8510	Energia Atv Inj TE oUC 09/2025 mPT GD2	256.0000	-0.317380	-81.40	extraido	2026-01-10 18:57:32.568181+00
0ea9cb1b-1812-4cd2-8381-b3e1c9003a12	ca72314c-b674-4940-9247-711b1fab8510	Energia Atv Inj TUSD oUC 09/2025 mPT GD2	256.0000	-0.345450	-88.60	extraido	2026-01-10 18:57:32.568181+00
b86dc2f7-b23f-49bc-9fd1-77ec0e1d22ea	ca72314c-b674-4940-9247-711b1fab8510	Energia Ativa Fornecida TUSD	388.0000	0.601750	233.48	extraido	2026-01-10 18:57:32.568181+00
893d1c42-28fb-4919-ba96-b6262e16a761	ca72314c-b674-4940-9247-711b1fab8510	CIP ILUM PUB PREF MUNICIPAL	0.0000	0.000000	29.19	extraido	2026-01-10 18:57:32.568181+00
fd2aaba7-d86e-427e-8217-377eb2be715e	befe29d1-c2dc-4136-accf-ac105aab38e9	Adicional Band. Vermelha	300.0000	0.059400	17.82	extraido	2026-01-10 18:57:32.600311+00
aadaf6cb-49f0-489b-91ab-083678a9e15e	befe29d1-c2dc-4136-accf-ac105aab38e9	Energia Ativa Fornecida TE	300.0000	0.326770	98.03	extraido	2026-01-10 18:57:32.600311+00
80cea0a5-b965-4fae-99f4-e220b88dd23f	befe29d1-c2dc-4136-accf-ac105aab38e9	Adic. Band. Vermelha Comp.	300.0000	-0.059400	-17.82	extraido	2026-01-10 18:57:32.600311+00
f028736a-ceed-46f5-9c5c-5c2e1d8de038	befe29d1-c2dc-4136-accf-ac105aab38e9	Energia Atv Inj TE oUC 11/2025 mPT GD2	300.0000	-0.326770	-98.03	extraido	2026-01-10 18:57:32.600311+00
bd7016a3-a450-40ac-8a56-2b94515093e9	befe29d1-c2dc-4136-accf-ac105aab38e9	Energia Atv Inj TUSD oUC 11/2025 mPT GD2	300.0000	-0.355730	-106.72	extraido	2026-01-10 18:57:32.600311+00
02c264d9-d67e-4a2b-a16b-caa57c3b3896	befe29d1-c2dc-4136-accf-ac105aab38e9	Energia Ativa Fornecida TUSD	300.0000	0.619700	185.91	extraido	2026-01-10 18:57:32.600311+00
c26960c1-4edc-443f-b9b5-a15312e3e3d0	befe29d1-c2dc-4136-accf-ac105aab38e9	CIP ILUM PUB PREF MUNICIPAL	0.0000	0.000000	48.52	extraido	2026-01-10 18:57:32.600311+00
165b7e6b-5682-4132-8ae5-fa63049ffa90	cbc548b7-ea22-4a21-8410-7b16adacaeb1	Adicional Band. Vermelha	4.0000	0.065810	290.95	extraido	2026-01-10 18:57:35.477495+00
b7817ba5-31d9-4789-84fb-22caf50ad755	cbc548b7-ea22-4a21-8410-7b16adacaeb1	Energia Ativa Fornecida TE	4.0000	0.317430	1403.37	extraido	2026-01-10 18:57:35.477495+00
9a81c65c-0ca4-49f2-91a1-8f61f0c68219	cbc548b7-ea22-4a21-8410-7b16adacaeb1	Adic. Band. Vermelha Comp.	4.0000	-0.065810	-290.95	extraido	2026-01-10 18:57:35.477495+00
0f9a6f9c-969b-488f-8716-3e6bacc83176	cbc548b7-ea22-4a21-8410-7b16adacaeb1	Energia Atv Inj TE mUC 10/2025 mPT GD2	4.0000	-0.317430	-1403.38	extraido	2026-01-10 18:57:35.477495+00
e7e8423d-ccd0-4658-b5b4-fa45a5c8e41e	cbc548b7-ea22-4a21-8410-7b16adacaeb1	Energia Atv Inj TUSD mUC 10/2025 mPT GD2	4.0000	-0.345510	-1527.52	extraido	2026-01-10 18:57:35.477495+00
bd5b3023-ff34-4291-9b59-f2a423520398	cbc548b7-ea22-4a21-8410-7b16adacaeb1	Energia Ativa Fornecida TUSD	4.0000	0.601860	2660.82	extraido	2026-01-10 18:57:35.477495+00
b0727b82-e9b6-409b-a388-74c0f0214f32	cbc548b7-ea22-4a21-8410-7b16adacaeb1	CIP ILUM PUB PREF MUNICIPAL	0.0000	0.000000	372.01	extraido	2026-01-10 18:57:35.477495+00
0912aea1-7ca8-4aae-9fc8-eff997aaad8f	54f7b46d-8420-4aa9-a11b-8d99da0e66a4	Adicional Band. Vermelha	351.0000	0.103280	36.25	extraido	2026-01-10 18:57:37.266406+00
a4bd2dc9-20a5-482b-afb6-4206192d4132	54f7b46d-8420-4aa9-a11b-8d99da0e66a4	Energia Ativa Fornecida TE	351.0000	0.321600	112.88	extraido	2026-01-10 18:57:37.266406+00
f54a3f40-3983-438f-a4f0-d4d7427d14a3	54f7b46d-8420-4aa9-a11b-8d99da0e66a4	Adic. Band. Vermelha Comp.	351.0000	-0.103280	-36.25	extraido	2026-01-10 18:57:37.266406+00
2b752846-6537-4c4b-b06e-2752fc46c6bc	54f7b46d-8420-4aa9-a11b-8d99da0e66a4	Energia Atv Inj TE oUC 08/2025 mPT GD2	351.0000	-0.321600	-112.88	extraido	2026-01-10 18:57:37.266406+00
f1ffd55e-a7f9-4413-a6b2-7d1f93c6bfb3	54f7b46d-8420-4aa9-a11b-8d99da0e66a4	Energia Atv Inj TUSD oUC 08/2025 mPT GD2	351.0000	-0.350090	-122.88	extraido	2026-01-10 18:57:37.266406+00
ec38f3d6-36c2-4b34-8826-862a8db9dd60	54f7b46d-8420-4aa9-a11b-8d99da0e66a4	Energia Ativa Fornecida TUSD	351.0000	0.609830	214.05	extraido	2026-01-10 18:57:37.266406+00
9e850e75-30a2-4b72-8057-249c0e519c00	54f7b46d-8420-4aa9-a11b-8d99da0e66a4	CIP ILUM PUB PREF MUNICIPAL	0.0000	0.000000	31.49	extraido	2026-01-10 18:57:37.266406+00
7f9ba0a1-d3f4-48c2-ac37-05fcc6bc3c62	0fb79693-5afc-4b2d-9f5e-01a69db2f3dc	Energia Atv Inj TUSD oUC 07/2025 mPT GD2	34.0000	-0.356760	-12.13	extraido	2026-01-10 18:57:35.824519+00
f07d41e9-c497-48fc-b1a2-54e0a7838599	0fb79693-5afc-4b2d-9f5e-01a69db2f3dc	Energia Atv Inj TE oUC 08/2025 mPT GD2	87.0000	-0.323910	-28.18	extraido	2026-01-10 18:57:35.824519+00
4e9710e7-13ea-451e-984e-51b21f694d37	0fb79693-5afc-4b2d-9f5e-01a69db2f3dc	Energia Atv Inj TUSD oUC 08/2025 mPT GD2	87.0000	-0.352640	-30.68	extraido	2026-01-10 18:57:35.824519+00
4d7121dc-394e-441b-b46b-a6b87f5569c8	0fb79693-5afc-4b2d-9f5e-01a69db2f3dc	Energia Ativa Fornecida TUSD	122.0000	0.611560	74.61	extraido	2026-01-10 18:57:35.824519+00
fde55fe9-4b63-46d4-95bc-e927962e0e73	0fb79693-5afc-4b2d-9f5e-01a69db2f3dc	Energia Consumida Faturada TUSD	9.0000	0.652220	5.87	extraido	2026-01-10 18:57:35.824519+00
e37662ae-b112-4a5b-b7dd-3095c766ddea	0fb79693-5afc-4b2d-9f5e-01a69db2f3dc	CIP ILUM PUB PREF MUNICIPAL	0.0000	0.000000	11.82	extraido	2026-01-10 18:57:35.824519+00
2d5b0c86-7a1f-42d6-ab77-e81a8086fcd8	3c3d8169-7957-4590-a291-5c66bdf745dd	Adicional Band. Amarela	1.0000	0.021810	25.56	extraido	2026-01-10 19:15:16.441591+00
933a3926-1246-499e-a9c2-123b96370428	3c3d8169-7957-4590-a291-5c66bdf745dd	Adicional Band. Vermelha	1.0000	0.007920	9.28	extraido	2026-01-10 19:15:16.441591+00
acd23959-cfa6-4ef9-a985-980cb7a02280	3c3d8169-7957-4590-a291-5c66bdf745dd	Energia Ativa Fornecida TE	1.0000	0.327830	384.22	extraido	2026-01-10 19:15:16.441591+00
64b3e7f4-b59c-4022-b3b5-062f95645e14	3c3d8169-7957-4590-a291-5c66bdf745dd	Adic. Band. Amarela Comp.	1.0000	-0.021810	-25.56	extraido	2026-01-10 19:15:16.441591+00
2aafe2d1-b8a3-4158-a14a-cb51790414b8	3c3d8169-7957-4590-a291-5c66bdf745dd	Adic. Band. Vermelha Comp.	1.0000	-0.007920	-9.28	extraido	2026-01-10 19:15:16.441591+00
afe97f1d-bb40-410f-ba34-90a7cbc0a3f3	3c3d8169-7957-4590-a291-5c66bdf745dd	Energia Atv Inj TE oUC 05/2025 mPT GD1	249.0000	-0.327790	-81.85	extraido	2026-01-10 19:15:16.441591+00
f785a7cd-332e-483e-91f5-5e9d81d7da7d	3c3d8169-7957-4590-a291-5c66bdf745dd	Energia Atv Inj TUSD oUC 05/2025 mPT GD1	249.0000	-0.497270	-124.17	extraido	2026-01-10 19:15:16.441591+00
d4b6e5a7-f0cb-4dee-ad69-f5cb28175c00	3c3d8169-7957-4590-a291-5c66bdf745dd	Energia Atv Inj TE oUC 12/2025 mPT GD2	922.0000	-0.327840	-302.37	extraido	2026-01-10 19:15:16.441591+00
1e0b6dce-a627-48a1-9560-ec0f82be2760	3c3d8169-7957-4590-a291-5c66bdf745dd	Energia Atv Inj TUSD oUC 12/2025 mPT GD2	922.0000	-0.356850	-329.12	extraido	2026-01-10 19:15:16.441591+00
c7e9ce1d-0ce8-43f5-a2d7-8a9d81818ede	3c3d8169-7957-4590-a291-5c66bdf745dd	Energia Ativa Fornecida TUSD	1.0000	0.621600	728.52	extraido	2026-01-10 19:15:16.441591+00
11b76933-3fa9-4a19-9acd-a4af22e10e2f	3c3d8169-7957-4590-a291-5c66bdf745dd	CIP ILUM PUB PREF MUNICIPAL	0.0000	0.000000	141.89	extraido	2026-01-10 19:15:16.441591+00
39c275e3-64c0-429e-b2ca-fc774b07fcda	3508b040-a857-420e-8e14-1a2c4e43748e	Adicional Band. Amarela	4.0000	0.021840	96.17	extraido	2026-01-10 19:15:18.935185+00
97f377ed-6151-46ce-b744-ac2b5275e702	3508b040-a857-420e-8e14-1a2c4e43748e	Adicional Band. Vermelha	4.0000	0.007950	35.01	extraido	2026-01-10 19:15:18.935185+00
e2b1d2aa-7775-4e91-866b-1c15e97b0719	3508b040-a857-420e-8e14-1a2c4e43748e	Energia Ativa Fornecida TE	4.0000	0.327860	1443.88	extraido	2026-01-10 19:15:18.935185+00
8f18a683-4a54-4e8c-8131-63ae2f0e7fb0	3508b040-a857-420e-8e14-1a2c4e43748e	Adic. Band. Amarela Comp.	4.0000	-0.021840	-96.17	extraido	2026-01-10 19:15:18.935185+00
215c161d-58ed-4b37-9c4c-95dc8fe1c6cb	3508b040-a857-420e-8e14-1a2c4e43748e	Adic. Band. Vermelha Comp.	4.0000	-0.007950	-35.01	extraido	2026-01-10 19:15:18.935185+00
d3621ac1-b1fb-4417-8074-c5b287c71120	3508b040-a857-420e-8e14-1a2c4e43748e	Energia Atv Inj TE mUC 12/2025 mPT GD2	4.0000	-0.327860	-1443.88	extraido	2026-01-10 19:15:18.935185+00
ec9cd4ec-9f1d-43e1-a4ba-d63c18e4f282	3508b040-a857-420e-8e14-1a2c4e43748e	Energia Atv Inj TUSD mUC 12/2025 mPT GD2	4.0000	-0.356860	-1571.62	extraido	2026-01-10 19:15:18.935185+00
57ff603f-ac6e-4dea-8c2b-cf1d3a9f980b	3508b040-a857-420e-8e14-1a2c4e43748e	Energia Ativa Fornecida TUSD	4.0000	0.621630	2737.65	extraido	2026-01-10 19:15:18.935185+00
0bb5c1e6-e594-4255-bc19-dab337fe9e47	3508b040-a857-420e-8e14-1a2c4e43748e	CIP ILUM PUB PREF MUNICIPAL	0.0000	0.000000	349.97	extraido	2026-01-10 19:15:18.935185+00
68994bb7-7711-4997-921c-18d0e416c5f5	f73ca487-8c35-4069-aab4-5e702687b373	Adicional Band. Amarela	131.0000	0.003210	0.42	extraido	2026-01-10 19:15:23.307392+00
1a7c9945-d7ca-41c5-bdce-8aa3ee7ffab0	f73ca487-8c35-4069-aab4-5e702687b373	Adicional Band. Vermelha	131.0000	0.051220	6.71	extraido	2026-01-10 19:15:23.307392+00
ad12c065-9933-4870-a632-4f870e468cb8	f73ca487-8c35-4069-aab4-5e702687b373	Energia Consumida Faturada TE	8.0000	0.351250	2.81	extraido	2026-01-10 19:15:23.307392+00
d3912b5a-3b08-4f0c-b01d-01c237fd1b8c	f73ca487-8c35-4069-aab4-5e702687b373	Energia Ativa Fornecida TE	122.0000	0.328770	40.11	extraido	2026-01-10 19:15:23.307392+00
92996900-0e24-4023-95dd-3bea5e5927c6	f73ca487-8c35-4069-aab4-5e702687b373	Adic. Band. Amarela Comp.	122.0000	-0.003280	-0.40	extraido	2026-01-10 19:15:23.307392+00
3bdaa891-03d9-4357-b068-a19217c8b281	f73ca487-8c35-4069-aab4-5e702687b373	Adic. Band. Vermelha Comp.	122.0000	-0.051310	-6.26	extraido	2026-01-10 19:15:23.307392+00
0ef72e2a-8948-4c91-a11a-8df25557c843	f73ca487-8c35-4069-aab4-5e702687b373	Energia Atv Inj TE oUC 11/2025 mPT GD2	122.0000	-0.328770	-40.11	extraido	2026-01-10 19:15:23.307392+00
6e25bdc5-3cf8-4ee8-bd36-5ae6dcf1a515	f73ca487-8c35-4069-aab4-5e702687b373	Energia Atv Inj TUSD oUC 11/2025 mPT GD2	122.0000	-0.357950	-43.67	extraido	2026-01-10 19:15:23.307392+00
58231892-9fac-41a5-8349-19f4c0bfb06c	f73ca487-8c35-4069-aab4-5e702687b373	Energia Ativa Fornecida TUSD	122.0000	0.623440	76.06	extraido	2026-01-10 19:15:23.307392+00
36c6f97f-bf29-423d-a034-1cc1d5d960ff	f73ca487-8c35-4069-aab4-5e702687b373	Energia Consumida Faturada TUSD	8.0000	0.668750	5.35	extraido	2026-01-10 19:15:23.307392+00
7d61ed0a-2643-471f-b8e9-118d86479a10	f73ca487-8c35-4069-aab4-5e702687b373	CIP ILUM PUB PREF MUNICIPAL	0.0000	0.000000	12.20	extraido	2026-01-10 19:15:23.307392+00
c7339914-e2d4-470d-be2d-dcbe1b12fa42	5b12d0bb-97a9-4061-88cc-971f8c1aa2df	Adicional Band. Amarela	135.0000	0.013700	1.85	extraido	2026-01-10 19:15:27.603715+00
2fac86e0-3d65-42b8-867e-9df42ba03c94	5b12d0bb-97a9-4061-88cc-971f8c1aa2df	Adicional Band. Vermelha	135.0000	0.026670	3.60	extraido	2026-01-10 19:15:27.603715+00
4901b56a-d728-4147-8c83-1efd7c6543b6	5b12d0bb-97a9-4061-88cc-971f8c1aa2df	Energia Consumida Faturada TE	7.0000	0.342860	2.40	extraido	2026-01-10 19:15:27.603715+00
efc2cb90-0c93-4e79-ba0b-f0c2a17e0009	5b12d0bb-97a9-4061-88cc-971f8c1aa2df	Energia Ativa Fornecida TE	127.0000	0.329370	41.83	extraido	2026-01-10 19:15:27.603715+00
7af2e6d1-c0d4-4ae9-9b9b-c8e546490385	5b12d0bb-97a9-4061-88cc-971f8c1aa2df	Adic. Band. Amarela Comp.	127.0000	-0.013780	-1.75	extraido	2026-01-10 19:15:27.603715+00
1b108d21-98b7-418e-a6d0-db443cd7deea	5b12d0bb-97a9-4061-88cc-971f8c1aa2df	Adic. Band. Vermelha Comp.	127.0000	-0.026770	-3.40	extraido	2026-01-10 19:15:27.603715+00
7eaf03fc-efd4-47ce-b261-b09975e6f459	5b12d0bb-97a9-4061-88cc-971f8c1aa2df	Energia Atv Inj TE oUC 09/2025 mPT GD2	70.0000	-0.328000	-22.96	extraido	2026-01-10 19:15:27.603715+00
add2846c-6f8d-47f5-b729-89c0091fce9b	5b12d0bb-97a9-4061-88cc-971f8c1aa2df	Energia Atv Inj TUSD oUC 09/2025 mPT GD2	70.0000	-0.357140	-25.00	extraido	2026-01-10 19:15:27.603715+00
cd464d3d-90e2-45f7-82c6-bee1b4abdffe	5b12d0bb-97a9-4061-88cc-971f8c1aa2df	Energia Atv Inj TE oUC 10/2025 mPT GD2	57.0000	-0.330350	-18.83	extraido	2026-01-10 19:15:27.603715+00
509f0691-0654-4c7f-a98a-c999a819cbd8	5b12d0bb-97a9-4061-88cc-971f8c1aa2df	Energia Atv Inj TUSD oUC 10/2025 mPT GD2	57.0000	-0.360000	-20.52	extraido	2026-01-10 19:15:27.603715+00
1acd7203-770c-411e-896c-b779639c303c	5b12d0bb-97a9-4061-88cc-971f8c1aa2df	Energia Ativa Fornecida TUSD	127.0000	0.624490	79.31	extraido	2026-01-10 19:15:27.603715+00
0f4b5f69-c0df-40ba-a680-67bf43925821	5b12d0bb-97a9-4061-88cc-971f8c1aa2df	Energia Consumida Faturada TUSD	7.0000	0.655710	4.59	extraido	2026-01-10 19:15:27.603715+00
1a72432d-165d-4538-9900-d729702a057c	5b12d0bb-97a9-4061-88cc-971f8c1aa2df	CIP ILUM PUB PREF MUNICIPAL	0.0000	0.000000	10.31	extraido	2026-01-10 19:15:27.603715+00
fbab6113-b790-49a2-88d9-e44451125d4e	56b4b151-1ec6-42e8-a2a8-431848eb992d	Adicional Band. Amarela	281.0000	0.021740	6.11	extraido	2026-01-10 19:15:28.070463+00
6e8289ac-02bc-4f6c-bcde-28a3a6c57113	56b4b151-1ec6-42e8-a2a8-431848eb992d	Adicional Band. Vermelha	281.0000	0.007900	2.22	extraido	2026-01-10 19:15:28.070463+00
7aae00df-1060-40f7-8f5d-c6bf69a109fe	56b4b151-1ec6-42e8-a2a8-431848eb992d	Energia Ativa Fornecida TE	281.0000	0.327790	92.11	extraido	2026-01-10 19:15:28.070463+00
1f7c0b22-46c9-44eb-ac26-0fc6e8fe0a23	56b4b151-1ec6-42e8-a2a8-431848eb992d	Adic. Band. Amarela Comp.	281.0000	-0.021740	-6.11	extraido	2026-01-10 19:15:28.070463+00
9f3ef194-fd63-4afd-b2e5-fc0305dfd2e6	56b4b151-1ec6-42e8-a2a8-431848eb992d	Adic. Band. Vermelha Comp.	281.0000	-0.007900	-2.22	extraido	2026-01-10 19:15:28.070463+00
41ed9462-7739-4248-b316-1ba629c5e070	56b4b151-1ec6-42e8-a2a8-431848eb992d	Energia Atv Inj TE oUC 12/2025 mPT GD2	281.0000	-0.327790	-92.11	extraido	2026-01-10 19:15:28.070463+00
cad9aa9e-0b2d-4fea-a96b-0b6434bfb584	56b4b151-1ec6-42e8-a2a8-431848eb992d	Energia Atv Inj TUSD oUC 12/2025 mPT GD2	281.0000	-0.356830	-100.27	extraido	2026-01-10 19:15:28.070463+00
db853ed9-2c52-49fe-9965-67a2027109e5	56b4b151-1ec6-42e8-a2a8-431848eb992d	Energia Ativa Fornecida TUSD	281.0000	0.621570	174.66	extraido	2026-01-10 19:15:28.070463+00
0e382536-0fbd-46a9-862c-296401521f1c	56b4b151-1ec6-42e8-a2a8-431848eb992d	CIP ILUM PUB PREF MUNICIPAL	0.0000	0.000000	45.65	extraido	2026-01-10 19:15:28.070463+00
cf39dcef-54ef-4589-9fa3-be99d9abb3ee	0fa2e8ae-05c5-4f4a-9f34-36b6b534e2cd	Adicional Band. Amarela	324.0000	0.021790	7.06	extraido	2026-01-10 19:15:28.198055+00
dd6af184-a5d2-480f-b143-5faeabff5d2d	0fa2e8ae-05c5-4f4a-9f34-36b6b534e2cd	Adicional Band. Vermelha	324.0000	0.007870	2.55	extraido	2026-01-10 19:15:28.198055+00
10e7b32a-04ac-44ff-b82c-db550df93a73	0fa2e8ae-05c5-4f4a-9f34-36b6b534e2cd	Energia Ativa Fornecida TE	324.0000	0.327780	106.20	extraido	2026-01-10 19:15:28.198055+00
cea8e417-2403-4615-b458-103042c47f16	0fa2e8ae-05c5-4f4a-9f34-36b6b534e2cd	Adic. Band. Amarela Comp.	324.0000	-0.021790	-7.06	extraido	2026-01-10 19:15:28.198055+00
6b1db4c8-9eab-4b3e-863a-b912f4f5655f	0fa2e8ae-05c5-4f4a-9f34-36b6b534e2cd	Adic. Band. Vermelha Comp.	324.0000	-0.007870	-2.55	extraido	2026-01-10 19:15:28.198055+00
3985d374-aab5-47d1-9c81-20612cbd0361	0fa2e8ae-05c5-4f4a-9f34-36b6b534e2cd	Energia Atv Inj TE oUC 05/2025 mPT GD1	35.0000	-0.327260	-11.71	extraido	2026-01-10 19:15:28.198055+00
fc433a6c-03db-4dc6-accb-73dcf403316a	0fa2e8ae-05c5-4f4a-9f34-36b6b534e2cd	Energia Atv Inj TUSD oUC 05/2025 mPT GD1	35.0000	-0.496900	-17.78	extraido	2026-01-10 19:15:28.198055+00
6bbb8f03-ac10-4c03-82fa-f5ab1702df04	0fa2e8ae-05c5-4f4a-9f34-36b6b534e2cd	Energia Atv Inj TE oUC 12/2025 mPT GD2	288.0000	-0.327770	-94.47	extraido	2026-01-10 19:15:28.198055+00
db364977-a8ff-439b-b87b-6da3e79bdcb6	0fa2e8ae-05c5-4f4a-9f34-36b6b534e2cd	Energia Atv Inj TUSD oUC 12/2025 mPT GD2	288.0000	-0.356810	-102.84	extraido	2026-01-10 19:15:28.198055+00
9dfc30ac-27ce-4d3f-8826-10fdc25a70cc	0fa2e8ae-05c5-4f4a-9f34-36b6b534e2cd	Energia Ativa Fornecida TUSD	324.0000	0.621510	201.37	extraido	2026-01-10 19:15:28.198055+00
a55cbe0a-fb39-424a-ad89-ea848430e5b9	0fa2e8ae-05c5-4f4a-9f34-36b6b534e2cd	CIP ILUM PUB PREF MUNICIPAL	0.0000	0.000000	27.38	extraido	2026-01-10 19:15:28.198055+00
c0472331-b9ce-4ee8-827b-cdd75c680812	7c2b3737-c6cb-42d4-a548-0a229aa053a5	Adicional Band. Amarela	126.0000	0.015320	1.93	extraido	2026-01-10 19:15:28.214568+00
975e8562-cf80-4645-b42c-39df5baf3ab1	7c2b3737-c6cb-42d4-a548-0a229aa053a5	Adicional Band. Vermelha	126.0000	0.022380	2.82	extraido	2026-01-10 19:15:28.214568+00
8ab218e7-4bb6-4c78-9dc5-a75c11fd2072	7c2b3737-c6cb-42d4-a548-0a229aa053a5	Energia Consumida Faturada TE	9.0000	0.334440	3.01	extraido	2026-01-10 19:15:28.214568+00
b049d441-d6e3-43b0-87db-d16d8f754c44	7c2b3737-c6cb-42d4-a548-0a229aa053a5	Energia Ativa Fornecida TE	116.0000	0.329910	38.27	extraido	2026-01-10 19:15:28.214568+00
54c3d6e4-bee1-4cd7-bda3-9175ab527e88	7c2b3737-c6cb-42d4-a548-0a229aa053a5	Adic. Band. Amarela Comp.	116.0000	-0.015340	-1.78	extraido	2026-01-10 19:15:28.214568+00
de268f09-ecc9-4c0d-9f7c-9cc90b434d53	7c2b3737-c6cb-42d4-a548-0a229aa053a5	Adic. Band. Vermelha Comp.	116.0000	-0.022590	-2.62	extraido	2026-01-10 19:15:28.214568+00
9fd935d1-8fc7-4063-b86c-d41b3a7f2275	7c2b3737-c6cb-42d4-a548-0a229aa053a5	Energia Atv Inj TE oUC 07/2025 mPT GD2	116.0000	-0.329740	-38.25	extraido	2026-01-10 19:15:28.214568+00
b6bb1c82-e0e2-4c52-8168-09363d75c675	7c2b3737-c6cb-42d4-a548-0a229aa053a5	Energia Atv Inj TUSD oUC 07/2025 mPT GD2	116.0000	-0.358970	-41.64	extraido	2026-01-10 19:15:28.214568+00
c54a51a8-20cd-4d38-a67a-b55b1acab73e	7c2b3737-c6cb-42d4-a548-0a229aa053a5	Energia Ativa Fornecida TUSD	116.0000	0.625260	72.53	extraido	2026-01-10 19:15:28.214568+00
ccc75f5a-6a63-410c-827d-0b62d6427fe5	7c2b3737-c6cb-42d4-a548-0a229aa053a5	Energia Consumida Faturada TUSD	9.0000	0.641110	5.77	extraido	2026-01-10 19:15:28.214568+00
fe01cc7d-4ab8-494e-a0d7-05dbba9ce107	7c2b3737-c6cb-42d4-a548-0a229aa053a5	CIP ILUM PUB PREF MUNICIPAL	0.0000	0.000000	10.31	extraido	2026-01-10 19:15:28.214568+00
3151f7d0-d32f-4bd1-b18a-02704137defb	52498e18-ba38-472f-ba49-0eecb59ad745	Adicional Band. Amarela	947.0000	0.021820	20.66	extraido	2026-01-10 19:15:28.252101+00
8ac389f0-c98a-4e4d-8ff1-478fea1567d9	52498e18-ba38-472f-ba49-0eecb59ad745	Adicional Band. Vermelha	947.0000	0.007930	7.51	extraido	2026-01-10 19:15:28.252101+00
adb570e0-b98c-40a5-94be-6df9e8dcbf4a	52498e18-ba38-472f-ba49-0eecb59ad745	Energia Ativa Fornecida TE	947.0000	0.327840	310.46	extraido	2026-01-10 19:15:28.252101+00
a32201dd-0415-45a1-b4db-fbddf4bd5247	52498e18-ba38-472f-ba49-0eecb59ad745	Adic. Band. Amarela Comp.	947.0000	-0.021820	-20.66	extraido	2026-01-10 19:15:28.252101+00
81363e1f-019d-4551-99ac-aa8eba0dc24a	52498e18-ba38-472f-ba49-0eecb59ad745	Adic. Band. Vermelha Comp.	947.0000	-0.007930	-7.51	extraido	2026-01-10 19:15:28.252101+00
b19334e8-916d-455e-83d7-b08e25e20c77	52498e18-ba38-472f-ba49-0eecb59ad745	Energia Atv Inj TE oUC 05/2025 mPT GD1	163.0000	-0.327690	-53.71	extraido	2026-01-10 19:15:28.252101+00
0feed9bd-f8ce-4056-9776-eac66d8e656a	52498e18-ba38-472f-ba49-0eecb59ad745	Energia Atv Inj TUSD oUC 05/2025 mPT GD1	163.0000	-0.497250	-81.50	extraido	2026-01-10 19:15:28.252101+00
8c029800-006b-4c95-bdf4-b3c7e33a938d	52498e18-ba38-472f-ba49-0eecb59ad745	Energia Atv Inj TE oUC 07/2025 mPT GD2	33.0000	-0.327590	-11.05	extraido	2026-01-10 19:15:28.252101+00
a87d8441-2fe5-49d5-a253-65e9e759060d	52498e18-ba38-472f-ba49-0eecb59ad745	Energia Atv Inj TUSD oUC 07/2025 mPT GD2	33.0000	-0.356650	-12.03	extraido	2026-01-10 19:15:28.252101+00
1232851e-1f15-49e8-8337-589fb7accb0c	52498e18-ba38-472f-ba49-0eecb59ad745	Energia Atv Inj TE oUC 12/2025 mPT GD2	749.0000	-0.327820	-245.66	extraido	2026-01-10 19:15:28.252101+00
23dfeecb-3edf-4033-8b34-0858686609be	52498e18-ba38-472f-ba49-0eecb59ad745	Energia Atv Inj TUSD oUC 12/2025 mPT GD2	749.0000	-0.356830	-267.40	extraido	2026-01-10 19:15:28.252101+00
c5bb242c-8262-49fe-a45f-c8c7d3714fee	52498e18-ba38-472f-ba49-0eecb59ad745	Energia Ativa Fornecida TUSD	947.0000	0.621590	588.65	extraido	2026-01-10 19:15:28.252101+00
a1af13f5-6206-42a1-8f85-8752e5122769	52498e18-ba38-472f-ba49-0eecb59ad745	CIP ILUM PUB PREF MUNICIPAL	0.0000	0.000000	77.98	extraido	2026-01-10 19:15:28.252101+00
\.


--
-- Data for Name: lista_espera; Type: TABLE DATA; Schema: public; Owner: supabase_admin
--

COPY public.lista_espera (id, created_at, nome, email, consumo_estimado) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schema_migrations (version) FROM stdin;
00
20210710035447
20210722035447
20210730183235
20210909172000
20210927181326
20211122151130
20211124214934
20211202183645
20220114185221
20220114185340
20220224000811
20220323170000
20220429102000
20220531120530
20220614074223
20220811173540
20221003041349
20221003041400
20221011041400
20221020193600
20221021073300
20221021082433
20221027105023
20221114143122
20221114143410
20221125140132
\.


--
-- Data for Name: messages_2026_01_16; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2026_01_16 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- Data for Name: messages_2026_01_17; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2026_01_17 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- Data for Name: messages_2026_01_18; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2026_01_18 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- Data for Name: messages_2026_01_19; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2026_01_19 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- Data for Name: messages_2026_01_20; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2026_01_20 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- Data for Name: messages_2026_01_21; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2026_01_21 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- Data for Name: messages_2026_01_22; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2026_01_22 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.schema_migrations (version, inserted_at) FROM stdin;
20211116024918	2025-12-22 18:26:12
20211116045059	2025-12-22 18:26:12
20211116050929	2025-12-22 18:26:12
20211116051442	2025-12-22 18:26:12
20211116212300	2025-12-22 18:26:12
20211116213355	2025-12-22 18:26:12
20211116213934	2025-12-22 18:26:12
20211116214523	2025-12-22 18:26:12
20211122062447	2025-12-22 18:26:12
20211124070109	2025-12-22 18:26:12
20211202204204	2025-12-22 18:26:12
20211202204605	2025-12-22 18:26:12
20211210212804	2025-12-22 18:26:12
20211228014915	2025-12-22 18:26:12
20220107221237	2025-12-22 18:26:12
20220228202821	2025-12-22 18:26:12
20220312004840	2025-12-22 18:26:12
20220603231003	2025-12-22 18:26:12
20220603232444	2025-12-22 18:26:12
20220615214548	2025-12-22 18:26:12
20220712093339	2025-12-22 18:26:12
20220908172859	2025-12-22 18:26:12
20220916233421	2025-12-22 18:26:12
20230119133233	2025-12-22 18:26:12
20230128025114	2025-12-22 18:26:12
20230128025212	2025-12-22 18:26:12
20230227211149	2025-12-22 18:26:12
20230228184745	2025-12-22 18:26:12
20230308225145	2025-12-22 18:26:12
20230328144023	2025-12-22 18:26:12
20231018144023	2025-12-22 18:26:12
20231204144023	2025-12-22 18:26:12
20231204144024	2025-12-22 18:26:12
20231204144025	2025-12-22 18:26:12
20240108234812	2025-12-22 18:26:12
20240109165339	2025-12-22 18:26:12
20240227174441	2025-12-22 18:26:12
20240311171622	2025-12-22 18:26:12
20240321100241	2025-12-22 18:26:12
20240401105812	2025-12-22 18:26:12
20240418121054	2025-12-22 18:26:12
20240523004032	2025-12-22 18:26:12
20240618124746	2025-12-22 18:26:12
20240801235015	2025-12-22 18:26:12
20240805133720	2025-12-22 18:26:13
20240827160934	2025-12-22 18:26:13
20240919163303	2025-12-22 18:26:13
20240919163305	2025-12-22 18:26:13
20241019105805	2025-12-22 18:26:13
20241030150047	2025-12-22 18:26:13
20241108114728	2025-12-22 18:26:13
20241121104152	2025-12-22 18:26:13
20241130184212	2025-12-22 18:26:13
20241220035512	2025-12-22 18:26:13
20241220123912	2025-12-22 18:26:13
20241224161212	2025-12-22 18:26:13
20250107150512	2025-12-22 18:26:13
20250110162412	2025-12-22 18:26:13
20250123174212	2025-12-22 18:26:13
20250128220012	2025-12-22 18:26:13
20250506224012	2025-12-22 18:26:13
20250523164012	2025-12-22 18:26:13
20250714121412	2025-12-22 18:26:13
20250905041441	2025-12-22 18:26:13
20251103001201	2025-12-22 18:26:13
\.


--
-- Data for Name: subscription; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.subscription (id, subscription_id, entity, filters, claims, created_at) FROM stdin;
\.


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets (id, name, owner, created_at, updated_at, public, avif_autodetection, file_size_limit, allowed_mime_types, owner_id, type) FROM stdin;
faturas	faturas	\N	2025-12-22 20:01:41.099027+00	2025-12-22 20:01:41.099027+00	t	f	\N	\N	\N	STANDARD
contratos	contratos	\N	2025-12-23 15:56:58.560239+00	2025-12-23 15:56:58.560239+00	f	f	\N	\N	\N	STANDARD
\.


--
-- Data for Name: buckets_analytics; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets_analytics (name, type, format, created_at, updated_at, id, deleted_at) FROM stdin;
\.


--
-- Data for Name: buckets_vectors; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets_vectors (id, type, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: iceberg_namespaces; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.iceberg_namespaces (id, bucket_name, name, created_at, updated_at, metadata, catalog_id) FROM stdin;
\.


--
-- Data for Name: iceberg_tables; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.iceberg_tables (id, namespace_id, bucket_name, name, location, created_at, updated_at, remote_table_id, shard_key, shard_id, catalog_id) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.migrations (id, name, hash, executed_at) FROM stdin;
0	create-migrations-table	e18db593bcde2aca2a408c4d1100f6abba2195df	2025-12-22 18:26:23.348841
1	initialmigration	6ab16121fbaa08bbd11b712d05f358f9b555d777	2025-12-22 18:26:23.357828
2	storage-schema	f6a1fa2c93cbcd16d4e487b362e45fca157a8dbd	2025-12-22 18:26:23.363453
3	pathtoken-column	2cb1b0004b817b29d5b0a971af16bafeede4b70d	2025-12-22 18:26:23.383272
4	add-migrations-rls	427c5b63fe1c5937495d9c635c263ee7a5905058	2025-12-22 18:26:23.393724
5	add-size-functions	79e081a1455b63666c1294a440f8ad4b1e6a7f84	2025-12-22 18:26:23.398949
6	change-column-name-in-get-size	ded78e2f1b5d7e616117897e6443a925965b30d2	2025-12-22 18:26:23.405417
7	add-rls-to-buckets	e7e7f86adbc51049f341dfe8d30256c1abca17aa	2025-12-22 18:26:23.412146
8	add-public-to-buckets	fd670db39ed65f9d08b01db09d6202503ca2bab3	2025-12-22 18:26:23.415951
9	fix-search-function	af597a1b590c70519b464a4ab3be54490712796b	2025-12-22 18:26:23.420916
10	search-files-search-function	b595f05e92f7e91211af1bbfe9c6a13bb3391e16	2025-12-22 18:26:23.427647
11	add-trigger-to-auto-update-updated_at-column	7425bdb14366d1739fa8a18c83100636d74dcaa2	2025-12-22 18:26:23.436225
12	add-automatic-avif-detection-flag	8e92e1266eb29518b6a4c5313ab8f29dd0d08df9	2025-12-22 18:26:23.443713
13	add-bucket-custom-limits	cce962054138135cd9a8c4bcd531598684b25e7d	2025-12-22 18:26:23.449656
14	use-bytes-for-max-size	941c41b346f9802b411f06f30e972ad4744dad27	2025-12-22 18:26:23.453712
15	add-can-insert-object-function	934146bc38ead475f4ef4b555c524ee5d66799e5	2025-12-22 18:26:23.479637
16	add-version	76debf38d3fd07dcfc747ca49096457d95b1221b	2025-12-22 18:26:23.483763
17	drop-owner-foreign-key	f1cbb288f1b7a4c1eb8c38504b80ae2a0153d101	2025-12-22 18:26:23.488084
18	add_owner_id_column_deprecate_owner	e7a511b379110b08e2f214be852c35414749fe66	2025-12-22 18:26:23.491299
19	alter-default-value-objects-id	02e5e22a78626187e00d173dc45f58fa66a4f043	2025-12-22 18:26:23.49744
20	list-objects-with-delimiter	cd694ae708e51ba82bf012bba00caf4f3b6393b7	2025-12-22 18:26:23.501005
21	s3-multipart-uploads	8c804d4a566c40cd1e4cc5b3725a664a9303657f	2025-12-22 18:26:23.506746
22	s3-multipart-uploads-big-ints	9737dc258d2397953c9953d9b86920b8be0cdb73	2025-12-22 18:26:23.535394
23	optimize-search-function	9d7e604cddc4b56a5422dc68c9313f4a1b6f132c	2025-12-22 18:26:23.546522
24	operation-function	8312e37c2bf9e76bbe841aa5fda889206d2bf8aa	2025-12-22 18:26:23.552349
25	custom-metadata	d974c6057c3db1c1f847afa0e291e6165693b990	2025-12-22 18:26:23.557265
26	objects-prefixes	ef3f7871121cdc47a65308e6702519e853422ae2	2025-12-22 18:26:23.561027
27	search-v2	33b8f2a7ae53105f028e13e9fcda9dc4f356b4a2	2025-12-22 18:26:23.578006
28	object-bucket-name-sorting	ba85ec41b62c6a30a3f136788227ee47f311c436	2025-12-22 18:26:23.589963
29	create-prefixes	a7b1a22c0dc3ab630e3055bfec7ce7d2045c5b7b	2025-12-22 18:26:23.596844
30	update-object-levels	6c6f6cc9430d570f26284a24cf7b210599032db7	2025-12-22 18:26:23.602955
31	objects-level-index	33f1fef7ec7fea08bb892222f4f0f5d79bab5eb8	2025-12-22 18:26:23.614477
32	backward-compatible-index-on-objects	2d51eeb437a96868b36fcdfb1ddefdf13bef1647	2025-12-22 18:26:23.625171
33	backward-compatible-index-on-prefixes	fe473390e1b8c407434c0e470655945b110507bf	2025-12-22 18:26:23.635244
34	optimize-search-function-v1	82b0e469a00e8ebce495e29bfa70a0797f7ebd2c	2025-12-22 18:26:23.638335
35	add-insert-trigger-prefixes	63bb9fd05deb3dc5e9fa66c83e82b152f0caf589	2025-12-22 18:26:23.647627
36	optimise-existing-functions	81cf92eb0c36612865a18016a38496c530443899	2025-12-22 18:26:23.6511
37	add-bucket-name-length-trigger	3944135b4e3e8b22d6d4cbb568fe3b0b51df15c1	2025-12-22 18:26:23.662273
38	iceberg-catalog-flag-on-buckets	02716b81ceec9705aed84aa1501657095b32e5c5	2025-12-22 18:26:23.669113
39	add-search-v2-sort-support	0b610398a2ab38007247d4e86849a6640dc911c4	2025-12-22 18:26:23.696455
40	fix-prefix-race-conditions-optimized	0ac9c3dc677577aa12d933b6a910f567fd614342	2025-12-22 18:26:23.702954
41	add-object-level-update-trigger	44c22478bf01744b2129efc480cd2edc9a7d60e9	2025-12-22 18:26:23.714879
42	rollback-prefix-triggers	f2ab4f526ab7f979541082992593938c05ee4b47	2025-12-22 18:26:23.721708
43	fix-object-level	ab837ad8f1c7d00cc0b7310e989a23388ff29fc6	2025-12-22 18:26:23.728564
44	vector-bucket-type	99c20c0ffd52bb1ff1f32fb992f3b351e3ef8fb3	2025-12-22 18:26:23.73348
45	vector-buckets	049e27196d77a7cb76497a85afae669d8b230953	2025-12-22 18:26:23.736998
46	buckets-objects-grants	fedeb96d60fefd8e02ab3ded9fbde05632f84aed	2025-12-22 18:26:23.749303
47	iceberg-table-metadata	649df56855c24d8b36dd4cc1aeb8251aa9ad42c2	2025-12-22 18:26:23.753459
48	iceberg-catalog-ids	e0e8b460c609b9999ccd0df9ad14294613eed939	2025-12-22 18:26:23.759163
49	buckets-objects-grants-postgres	072b1195d0d5a2f888af6b2302a1938dd94b8b3d	2025-12-22 18:26:23.801135
\.


--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.objects (id, bucket_id, name, owner, created_at, updated_at, last_accessed_at, metadata, version, owner_id, user_metadata, level) FROM stdin;
3f6b22c7-0153-4038-b86c-c01a6bff36c1	faturas	triagem/1766839705732_cresse.pdf	\N	2025-12-27 12:48:31.009028+00	2025-12-27 12:48:31.009028+00	2025-12-27 12:48:31.009028+00	{"eTag": "\\"9498cd57a92c1ae79b0b12af53ec7545\\"", "size": 177272, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T12:48:30.753Z", "contentLength": 177272, "httpStatusCode": 200}	c5738b0c-0f2c-4cd8-a40c-6ce3926fd76b	\N	{}	2
5b3f72d8-7fa9-40f4-8db2-0a52048a14ee	faturas	triagem/1766856266440_francisco_pf.pdf	\N	2025-12-27 17:24:26.511566+00	2025-12-27 17:24:26.511566+00	2025-12-27 17:24:26.511566+00	{"eTag": "\\"16c79c4fc123f2c2e8fe9b9e7fc7d55f\\"", "size": 177570, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T17:24:26.498Z", "contentLength": 177570, "httpStatusCode": 200}	3cc12e87-3b96-43e1-818f-406751cee9a1	\N	{}	2
7d84ff41-3b47-4342-9252-5a14e8cfebaa	faturas	.emptyFolderPlaceholder	\N	2025-12-23 16:02:37.370107+00	2025-12-23 16:02:37.370107+00	2025-12-23 16:02:37.370107+00	{"eTag": "\\"d41d8cd98f00b204e9800998ecf8427e\\"", "size": 0, "mimetype": "application/octet-stream", "cacheControl": "max-age=3600", "lastModified": "2025-12-23T16:02:37.355Z", "contentLength": 0, "httpStatusCode": 200}	dc28a0da-3905-40ac-abd8-93478f47da84	\N	{}	1
b57584b7-9b4c-4a27-91b6-74eae8cd520b	faturas	triagem/1766531996033_bizu_forte.pdf	\N	2025-12-23 23:19:56.357915+00	2025-12-23 23:19:56.357915+00	2025-12-23 23:19:56.357915+00	{"eTag": "\\"80853473f4a5114d4f2a7436965de0f4\\"", "size": 177404, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-23T23:19:56.283Z", "contentLength": 177404, "httpStatusCode": 200}	ec5a86a2-03c8-48a2-8ede-e1776b486abe	\N	{}	2
a75518a9-a8bd-41e4-8678-d5ff71b18cee	faturas	triagem/1766531996579_landoski.pdf	\N	2025-12-23 23:19:56.660311+00	2025-12-23 23:19:56.660311+00	2025-12-23 23:19:56.660311+00	{"eTag": "\\"af9741746f03a59d4e8352db926befef\\"", "size": 177432, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-23T23:19:56.643Z", "contentLength": 177432, "httpStatusCode": 200}	a647d016-7e9f-4d29-8284-ba62b2a87938	\N	{}	2
6425358f-cb25-4fee-996e-51e6e8fc58e2	faturas	triagem/1766532408262_kipper.pdf	\N	2025-12-23 23:26:48.416513+00	2025-12-23 23:26:48.416513+00	2025-12-23 23:26:48.416513+00	{"eTag": "\\"f5f8a02ff4517e052008e1abf39dadbd\\"", "size": 177269, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-23T23:26:48.394Z", "contentLength": 177269, "httpStatusCode": 200}	4712d774-81cf-46b4-b0ba-ab17f02e6605	\N	{}	2
54161e76-0229-4d6a-9de8-4d0e98f0d909	faturas	triagem/1766668963806_Fatura_novembro_R__51_12_pg.pdf	\N	2025-12-25 13:22:45.336176+00	2025-12-25 13:22:45.336176+00	2025-12-25 13:22:45.336176+00	{"eTag": "\\"7212cc61d43b0e02ce8e33fba320f071\\"", "size": 182406, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-25T13:22:45.243Z", "contentLength": 182406, "httpStatusCode": 200}	0c9b6d71-52e3-4e55-987f-6a8a42de77df	\N	{}	2
90e7d783-c76e-46a2-9b3c-5bd6f3cdaafb	faturas	triagem/1766669221254_Fatura_novembro_R_250_00_pg.pdf	\N	2025-12-25 13:27:01.365978+00	2025-12-25 13:27:01.365978+00	2025-12-25 13:27:01.365978+00	{"eTag": "\\"45d1f470c389dbac1883204a729d445a\\"", "size": 182677, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-25T13:27:01.350Z", "contentLength": 182677, "httpStatusCode": 200}	f2bd806e-95ce-4500-8880-9d26f03a4992	\N	{}	2
2671a1bf-8d31-4208-aeb3-e929059cbf08	faturas	triagem/1766670783441_Fatura_novembro_R__51_12_pg.pdf	\N	2025-12-25 13:53:03.557913+00	2025-12-25 13:53:03.557913+00	2025-12-25 13:53:03.557913+00	{"eTag": "\\"7212cc61d43b0e02ce8e33fba320f071\\"", "size": 182406, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-25T13:53:03.542Z", "contentLength": 182406, "httpStatusCode": 200}	bf2037c1-b509-4f86-b34e-5c6b91aa1644	\N	{}	2
7d6b5d98-aa00-46f6-8575-90dcd4dad45c	faturas	triagem/1766671039353_Fatura_novembro_R__51_12_pg.pdf	\N	2025-12-25 13:57:19.454368+00	2025-12-25 13:57:19.454368+00	2025-12-25 13:57:19.454368+00	{"eTag": "\\"7212cc61d43b0e02ce8e33fba320f071\\"", "size": 182406, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-25T13:57:19.444Z", "contentLength": 182406, "httpStatusCode": 200}	5ca436ff-ce3e-466c-bd90-fd7fbfa78129	\N	{}	2
5758da5b-9b13-46f9-ab8f-2bb297839ad9	faturas	triagem/1766672308813_Fatura_novembro_R__51_12_pg.pdf	\N	2025-12-25 14:18:28.927813+00	2025-12-25 14:18:28.927813+00	2025-12-25 14:18:28.927813+00	{"eTag": "\\"7212cc61d43b0e02ce8e33fba320f071\\"", "size": 182406, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-25T14:18:28.917Z", "contentLength": 182406, "httpStatusCode": 200}	d90bb946-3f14-462b-b66f-6f64d1ce659b	\N	{}	2
2283c9da-7441-42d5-9529-a519e70d82ba	faturas	triagem/1766672904344_Fatura_novembro_R_250_00_pg.pdf	\N	2025-12-25 14:28:24.471785+00	2025-12-25 14:28:24.471785+00	2025-12-25 14:28:24.471785+00	{"eTag": "\\"45d1f470c389dbac1883204a729d445a\\"", "size": 182677, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-25T14:28:24.458Z", "contentLength": 182677, "httpStatusCode": 200}	db7010b8-9ef9-4347-84c4-10b9e67e18de	\N	{}	2
20c90579-67a2-444b-b318-f3471bfe2080	faturas	triagem/1766697969689_Fatura_novembro_R_250_00_pg.pdf	\N	2025-12-25 21:26:09.841533+00	2025-12-25 21:26:09.841533+00	2025-12-25 21:26:09.841533+00	{"eTag": "\\"45d1f470c389dbac1883204a729d445a\\"", "size": 182677, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-25T21:26:09.822Z", "contentLength": 182677, "httpStatusCode": 200}	c9669ff4-7a6b-4e81-a61b-f88c5793ce2f	\N	{}	2
599980c3-1f5e-468d-82dd-1c2e97b5662a	faturas	triagem/1766699536844_Fatura_novembro_R__127_71.pdf	\N	2025-12-25 21:52:17.014254+00	2025-12-25 21:52:17.014254+00	2025-12-25 21:52:17.014254+00	{"eTag": "\\"f1a11453063ea58e0eb6d2b290acf48a\\"", "size": 182584, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-25T21:52:16.989Z", "contentLength": 182584, "httpStatusCode": 200}	9b2182e1-46d1-4e04-8418-650b792c9728	\N	{}	2
fb33e173-41e6-4e25-ac40-4ead96dfd2c6	faturas	triagem/1766700495957_Fatura_novembro_R__1.527_16.pdf	\N	2025-12-25 22:08:17.378309+00	2025-12-25 22:08:17.378309+00	2025-12-25 22:08:17.378309+00	{"eTag": "\\"ff7a3773725c537fc6cd72ae461a42ac\\"", "size": 182445, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-25T22:08:17.310Z", "contentLength": 182445, "httpStatusCode": 200}	f46be67e-35f7-4778-befc-965e5893ab6e	\N	{}	2
cc450f98-3abb-442b-b326-f382e44b9775	faturas	triagem/1767101136971_cresse.pdf	\N	2025-12-30 13:25:37.081997+00	2025-12-30 13:25:37.081997+00	2025-12-30 13:25:37.081997+00	{"eTag": "\\"7f597cdb5332d5b6fb3e696d0e01f775\\"", "size": 177326, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T13:25:37.062Z", "contentLength": 177326, "httpStatusCode": 200}	59cdb932-7b28-4585-9864-ffa5235af4a5	\N	{}	2
fba7a7a2-8066-434a-a7cb-61fc485aea64	faturas	triagem/1766700497894_cresse_10.pdf	\N	2025-12-25 22:08:18.100767+00	2025-12-25 22:08:18.100767+00	2025-12-25 22:08:18.100767+00	{"eTag": "\\"ee00ca7b92501f1a96ede32bfb66134f\\"", "size": 182549, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-25T22:08:18.042Z", "contentLength": 182549, "httpStatusCode": 200}	7605d3eb-335c-4b45-adc6-2e2e24790c19	\N	{}	2
0429b9e6-1af0-4348-9162-1965faf979bb	faturas	triagem/1766840962364_cresse8.pdf	\N	2025-12-27 13:09:23.001527+00	2025-12-27 13:09:23.001527+00	2025-12-27 13:09:23.001527+00	{"eTag": "\\"95d528b796df06d1d4eb3d154697b962\\"", "size": 182152, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T13:09:22.942Z", "contentLength": 182152, "httpStatusCode": 200}	0adb8ac1-003e-47f5-a3e6-743e69524322	\N	{}	2
abe05470-5750-4187-8cca-9ce90935e2fc	faturas	triagem/1766700498488_cresse_9.pdf	\N	2025-12-25 22:08:18.540953+00	2025-12-25 22:08:18.540953+00	2025-12-25 22:08:18.540953+00	{"eTag": "\\"8c1955d302e692a9551fbf291c9497fb\\"", "size": 182459, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-25T22:08:18.522Z", "contentLength": 182459, "httpStatusCode": 200}	dc96b741-1f4a-4232-89e7-d45bf092c8d3	\N	{}	2
d63e9da3-85bd-4c59-9951-1cd90d89ffad	faturas	triagem/1766856266583_francisco_pj.pdf	\N	2025-12-27 17:24:26.650249+00	2025-12-27 17:24:26.650249+00	2025-12-27 17:24:26.650249+00	{"eTag": "\\"60dc9b85c02a7c431e60370fb1d4d643\\"", "size": 177445, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T17:24:26.638Z", "contentLength": 177445, "httpStatusCode": 200}	6a006de6-9977-45f1-90f0-aa57fc37c5ce	\N	{}	2
8a4017ac-579d-4ff5-86d0-c2613502b2fa	faturas	triagem/1766700498586_cresse_8.pdf	\N	2025-12-25 22:08:18.635751+00	2025-12-25 22:08:18.635751+00	2025-12-25 22:08:18.635751+00	{"eTag": "\\"3b3220970359a9b62a02b95eee281793\\"", "size": 181792, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-25T22:08:18.618Z", "contentLength": 181792, "httpStatusCode": 200}	c0e93c5a-f2f5-41eb-9663-a70b5891eb02	\N	{}	2
a672a5d3-c6fe-4f04-b78c-7720a2504992	faturas	triagem/1766700498696_cresse_5.pdf	\N	2025-12-25 22:08:18.737038+00	2025-12-25 22:08:18.737038+00	2025-12-25 22:08:18.737038+00	{"eTag": "\\"491fb9da933f702de76af94c27160b6d\\"", "size": 182162, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-25T22:08:18.722Z", "contentLength": 182162, "httpStatusCode": 200}	9e398dc1-a29e-4b6d-9b95-f80e4af8425d	\N	{}	2
2fdfa104-7d26-4a2c-aa7e-1229c828760c	faturas	triagem/1766856266697_kipper.pdf	\N	2025-12-27 17:24:26.740734+00	2025-12-27 17:24:26.740734+00	2025-12-27 17:24:26.740734+00	{"eTag": "\\"59b086cb2a5b390cc6f2813fbb9f7bd5\\"", "size": 177580, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T17:24:26.730Z", "contentLength": 177580, "httpStatusCode": 200}	25c104b7-4b59-4d1f-b4d3-947e7952a94b	\N	{}	2
6ff384b4-d22e-4b5c-be17-07ac8be017e5	faturas	triagem/1766700498798_cresse_4.pdf	\N	2025-12-25 22:08:18.843079+00	2025-12-25 22:08:18.843079+00	2025-12-25 22:08:18.843079+00	{"eTag": "\\"29d2ae248666696fe64dc89f16093ac4\\"", "size": 177637, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-25T22:08:18.830Z", "contentLength": 177637, "httpStatusCode": 200}	8b0881a2-f570-4965-be18-16486d54074f	\N	{}	2
57540c45-04ae-496e-9364-3286d76bd3ad	faturas	triagem/1766700498894_cresse_2.pdf	\N	2025-12-25 22:08:18.938396+00	2025-12-25 22:08:18.938396+00	2025-12-25 22:08:18.938396+00	{"eTag": "\\"142cdbcd4c36f5eb29c55d12e9ad9e48\\"", "size": 177521, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-25T22:08:18.926Z", "contentLength": 177521, "httpStatusCode": 200}	0870838d-82f5-4b81-9846-8857238503f4	\N	{}	2
128d1110-d213-422a-af3c-8590d5d0d391	faturas	triagem/1766856266801_landoski.pdf	\N	2025-12-27 17:24:26.886575+00	2025-12-27 17:24:26.886575+00	2025-12-27 17:24:26.886575+00	{"eTag": "\\"b20a2356ff8deb6bdc68a6d4f574a2ba\\"", "size": 177583, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T17:24:26.878Z", "contentLength": 177583, "httpStatusCode": 200}	23701a4e-a11f-4813-939c-33f79817b1a8	\N	{}	2
d30ec478-5e3f-4298-a3e7-373dc064eaab	faturas	triagem/1766700498979_cresse_1.pdf	\N	2025-12-25 22:08:19.023613+00	2025-12-25 22:08:19.023613+00	2025-12-25 22:08:19.023613+00	{"eTag": "\\"7f597cdb5332d5b6fb3e696d0e01f775\\"", "size": 177326, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-25T22:08:19.010Z", "contentLength": 177326, "httpStatusCode": 200}	9163dc4e-0dfa-47a6-84a7-7fc82ff3105b	\N	{}	2
9968fa49-f992-419d-aad5-4ebc2c4cdd4c	faturas	triagem/1766700499076_cresse.pdf	\N	2025-12-25 22:08:19.116207+00	2025-12-25 22:08:19.116207+00	2025-12-25 22:08:19.116207+00	{"eTag": "\\"d0909da518a248386f245d2ecaf15809\\"", "size": 244141, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-25T22:08:19.102Z", "contentLength": 244141, "httpStatusCode": 200}	7685dca2-ef0a-4d81-8365-ada72d050d58	\N	{}	2
716bfe7b-31cf-4b33-aec9-3035fe216a5c	faturas	triagem/1766700844701_cresse.pdf	\N	2025-12-25 22:14:04.861546+00	2025-12-25 22:14:04.861546+00	2025-12-25 22:14:04.861546+00	{"eTag": "\\"d0909da518a248386f245d2ecaf15809\\"", "size": 244141, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-25T22:14:04.839Z", "contentLength": 244141, "httpStatusCode": 200}	01ed037b-601e-4d4b-8d8b-aa190f331a46	\N	{}	2
eef2ba06-aadc-4bb3-9fe1-c11c9a46d7d2	faturas	triagem/1766701902522_Fatura_novembro_R__1.527_16.pdf	\N	2025-12-25 22:31:42.672539+00	2025-12-25 22:31:42.672539+00	2025-12-25 22:31:42.672539+00	{"eTag": "\\"ff7a3773725c537fc6cd72ae461a42ac\\"", "size": 182445, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-25T22:31:42.656Z", "contentLength": 182445, "httpStatusCode": 200}	08f9dcc5-06c2-4bf6-9b86-a55f19b83fa0	\N	{}	2
65a5ee9c-7200-464f-928c-7e555cbc252f	faturas	triagem/1766701902744_cresse_10.pdf	\N	2025-12-25 22:31:42.786353+00	2025-12-25 22:31:42.786353+00	2025-12-25 22:31:42.786353+00	{"eTag": "\\"ee00ca7b92501f1a96ede32bfb66134f\\"", "size": 182549, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-25T22:31:42.776Z", "contentLength": 182549, "httpStatusCode": 200}	d927a419-f056-45c7-a4f5-f33523e53ece	\N	{}	2
7e92bdea-c66d-4e38-a139-3ce63b0ef7f3	faturas	triagem/1766701902840_cresse_9.pdf	\N	2025-12-25 22:31:42.887963+00	2025-12-25 22:31:42.887963+00	2025-12-25 22:31:42.887963+00	{"eTag": "\\"8c1955d302e692a9551fbf291c9497fb\\"", "size": 182459, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-25T22:31:42.876Z", "contentLength": 182459, "httpStatusCode": 200}	ee0c11db-7ce2-49a1-bece-3a2be4267091	\N	{}	2
09535b0c-4110-4784-86d6-c25cbcf8235a	faturas	triagem/1767101145895_cresse.pdf	\N	2025-12-30 13:25:45.957926+00	2025-12-30 13:25:45.957926+00	2025-12-30 13:25:45.957926+00	{"eTag": "\\"9498cd57a92c1ae79b0b12af53ec7545\\"", "size": 177272, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T13:25:45.949Z", "contentLength": 177272, "httpStatusCode": 200}	380c2e03-8f31-42ea-b03c-32586507d427	\N	{}	2
b346e1cc-949f-4528-92b1-8b7e73e36100	faturas	triagem/1766701902940_cresse_8.pdf	\N	2025-12-25 22:31:42.99113+00	2025-12-25 22:31:42.99113+00	2025-12-25 22:31:42.99113+00	{"eTag": "\\"3b3220970359a9b62a02b95eee281793\\"", "size": 181792, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-25T22:31:42.980Z", "contentLength": 181792, "httpStatusCode": 200}	24f5764e-d45b-46da-b55b-58230bfe858c	\N	{}	2
a613d964-c58b-4a4e-8362-db27836a8db2	faturas	triagem/1766855984009_cresse.pdf	\N	2025-12-27 17:19:44.997066+00	2025-12-27 17:19:44.997066+00	2025-12-27 17:19:44.997066+00	{"eTag": "\\"d0909da518a248386f245d2ecaf15809\\"", "size": 244141, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T17:19:44.917Z", "contentLength": 244141, "httpStatusCode": 200}	3247cc74-988a-4aad-9f5b-6f101b06e69f	\N	{}	2
2b90029f-7b84-49ce-96ad-b9e2e9ee8fb3	faturas	triagem/1766701903054_cresse_5.pdf	\N	2025-12-25 22:31:43.109235+00	2025-12-25 22:31:43.109235+00	2025-12-25 22:31:43.109235+00	{"eTag": "\\"491fb9da933f702de76af94c27160b6d\\"", "size": 182162, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-25T22:31:43.088Z", "contentLength": 182162, "httpStatusCode": 200}	2a95199d-66c3-407b-b0d1-e1f9a6d17fa6	\N	{}	2
dcc86f2f-3fe4-4144-b964-109c66956b1b	faturas	triagem/1766701903181_cresse_4.pdf	\N	2025-12-25 22:31:43.249589+00	2025-12-25 22:31:43.249589+00	2025-12-25 22:31:43.249589+00	{"eTag": "\\"29d2ae248666696fe64dc89f16093ac4\\"", "size": 177637, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-25T22:31:43.232Z", "contentLength": 177637, "httpStatusCode": 200}	007c25da-fa4e-486a-ab89-5e0ba19517b5	\N	{}	2
92f7175a-c0e2-446f-861d-20e60520a7e2	faturas	triagem/1766856266924_miranda.pdf	\N	2025-12-27 17:24:26.981972+00	2025-12-27 17:24:26.981972+00	2025-12-27 17:24:26.981972+00	{"eTag": "\\"a34c966d9bf7b1706412b03f2f6888cd\\"", "size": 177473, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T17:24:26.970Z", "contentLength": 177473, "httpStatusCode": 200}	c97986a4-1eb4-4891-969e-60efc3ce258f	\N	{}	2
52774ffd-8a6c-4d5b-bb17-8de2cf84c96a	faturas	triagem/1766701903306_cresse_2.pdf	\N	2025-12-25 22:31:43.355032+00	2025-12-25 22:31:43.355032+00	2025-12-25 22:31:43.355032+00	{"eTag": "\\"142cdbcd4c36f5eb29c55d12e9ad9e48\\"", "size": 177521, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-25T22:31:43.344Z", "contentLength": 177521, "httpStatusCode": 200}	7ce41634-a357-46b0-8f9d-c37538cdbef4	\N	{}	2
fa91f8b2-d443-4c74-b09a-bd3208d6d60a	faturas	triagem/1766856294515_landoski.pdf	\N	2025-12-27 17:24:54.550816+00	2025-12-27 17:24:54.550816+00	2025-12-27 17:24:54.550816+00	{"eTag": "\\"d0755db54b5b76309a89ae9360e7645f\\"", "size": 182089, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T17:24:54.537Z", "contentLength": 182089, "httpStatusCode": 200}	24c057e2-292d-4b77-bb2d-e342cbbaab2e	\N	{}	2
49de2174-7291-431d-a0db-0c410c58e019	faturas	triagem/1766701903404_cresse_1.pdf	\N	2025-12-25 22:31:43.471657+00	2025-12-25 22:31:43.471657+00	2025-12-25 22:31:43.471657+00	{"eTag": "\\"7f597cdb5332d5b6fb3e696d0e01f775\\"", "size": 177326, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-25T22:31:43.460Z", "contentLength": 177326, "httpStatusCode": 200}	d7fe7ddc-9805-41fc-9f3e-b8bd16be76fb	\N	{}	2
552c6620-986b-4cee-90da-b873bcb1fdaa	faturas	triagem/1766701903528_cresse.pdf	\N	2025-12-25 22:31:43.573875+00	2025-12-25 22:31:43.573875+00	2025-12-25 22:31:43.573875+00	{"eTag": "\\"d0909da518a248386f245d2ecaf15809\\"", "size": 244141, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-25T22:31:43.560Z", "contentLength": 244141, "httpStatusCode": 200}	74859c25-b298-4daf-91fe-835715b58234	\N	{}	2
755b7020-6ee3-4ebb-9f64-0c63ef8d2bd9	faturas	triagem/1766702156426_cresse_10.pdf	\N	2025-12-25 22:35:56.522021+00	2025-12-25 22:35:56.522021+00	2025-12-25 22:35:56.522021+00	{"eTag": "\\"ee00ca7b92501f1a96ede32bfb66134f\\"", "size": 182549, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-25T22:35:56.510Z", "contentLength": 182549, "httpStatusCode": 200}	75bd8d84-1a38-46cc-b29e-4930b6707576	\N	{}	2
3510aaa2-338b-48e7-beda-11abd43bd18e	faturas	triagem/1766702156606_cresse_9.pdf	\N	2025-12-25 22:35:56.671169+00	2025-12-25 22:35:56.671169+00	2025-12-25 22:35:56.671169+00	{"eTag": "\\"8c1955d302e692a9551fbf291c9497fb\\"", "size": 182459, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-25T22:35:56.646Z", "contentLength": 182459, "httpStatusCode": 200}	50b88eae-d461-465e-b021-10d650bd1878	\N	{}	2
13899180-1924-4c84-a412-6b0e71f5c5ec	faturas	triagem/1766702490069_cresse_2.pdf	\N	2025-12-25 22:41:30.174039+00	2025-12-25 22:41:30.174039+00	2025-12-25 22:41:30.174039+00	{"eTag": "\\"142cdbcd4c36f5eb29c55d12e9ad9e48\\"", "size": 177521, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-25T22:41:30.165Z", "contentLength": 177521, "httpStatusCode": 200}	ec4ec055-1682-42c4-b738-fb732e3bb8ae	\N	{}	2
c41895a2-d396-4222-92e1-ee0b40edca3a	faturas	triagem/1766702606216_landoski.pdf	\N	2025-12-25 22:43:26.320069+00	2025-12-25 22:43:26.320069+00	2025-12-25 22:43:26.320069+00	{"eTag": "\\"af9741746f03a59d4e8352db926befef\\"", "size": 177432, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-25T22:43:26.308Z", "contentLength": 177432, "httpStatusCode": 200}	740aa455-2502-4e5e-9fb4-54f798331811	\N	{}	2
ab811485-ab91-40a9-906d-0ce1609d45b9	faturas	triagem/1766702882242_Fatura_novembro_R__52_91.pdf	\N	2025-12-25 22:48:02.333581+00	2025-12-25 22:48:02.333581+00	2025-12-25 22:48:02.333581+00	{"eTag": "\\"1b2c1a48219816a664fba5d0c6b99f47\\"", "size": 182460, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-25T22:48:02.323Z", "contentLength": 182460, "httpStatusCode": 200}	ed66b2a4-7611-42bb-bb64-3e4bfe82ccba	\N	{}	2
4b4495db-4a85-4ee4-b1bf-f641bbf3ec99	faturas	triagem/1766702978567_Fatura_novembro_R__52_91.pdf	\N	2025-12-25 22:49:38.663376+00	2025-12-25 22:49:38.663376+00	2025-12-25 22:49:38.663376+00	{"eTag": "\\"1b2c1a48219816a664fba5d0c6b99f47\\"", "size": 182460, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-25T22:49:38.646Z", "contentLength": 182460, "httpStatusCode": 200}	da18cc57-9b3c-4c0b-862a-1af6357625a1	\N	{}	2
72195076-7ab1-4fd6-a1a9-9bce87009af8	faturas	triagem/1768042347244_Cresse.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 10:52:27.780707+00	2026-01-10 10:52:27.780707+00	2026-01-10 10:52:27.780707+00	{"eTag": "\\"ff7a3773725c537fc6cd72ae461a42ac\\"", "size": 182445, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T10:52:27.738Z", "contentLength": 182445, "httpStatusCode": 200}	73118014-6aee-4404-9149-50e6d4506767	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
44c0167e-9898-4709-b60a-edd2e813cf00	faturas	triagem/1766703031406_cresse_2.pdf	\N	2025-12-25 22:50:31.47484+00	2025-12-25 22:50:31.47484+00	2025-12-25 22:50:31.47484+00	{"eTag": "\\"142cdbcd4c36f5eb29c55d12e9ad9e48\\"", "size": 177521, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-25T22:50:31.462Z", "contentLength": 177521, "httpStatusCode": 200}	627437e0-2813-4a3b-9fcd-e926501b3427	\N	{}	2
6c5cda26-b030-40de-abd1-710632329a4e	faturas	triagem/1766856133730_cresse.pdf	\N	2025-12-27 17:22:13.877263+00	2025-12-27 17:22:13.877263+00	2025-12-27 17:22:13.877263+00	{"eTag": "\\"9498cd57a92c1ae79b0b12af53ec7545\\"", "size": 177272, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T17:22:13.861Z", "contentLength": 177272, "httpStatusCode": 200}	b6eb5db0-82e8-4d88-b6f9-a1e936ee9730	\N	{}	2
f0158222-9efe-44fb-b33c-e5f53f84f08b	faturas	triagem/1766703561130_cresse_5.pdf	\N	2025-12-25 22:59:21.227542+00	2025-12-25 22:59:21.227542+00	2025-12-25 22:59:21.227542+00	{"eTag": "\\"491fb9da933f702de76af94c27160b6d\\"", "size": 182162, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-25T22:59:21.216Z", "contentLength": 182162, "httpStatusCode": 200}	8b3a0d49-86e3-4522-82fb-da38edfd66ad	\N	{}	2
d47152b0-814f-4576-9069-8dbfe76743dc	faturas	triagem/1766703870757_cresse_2.pdf	\N	2025-12-25 23:04:30.853034+00	2025-12-25 23:04:30.853034+00	2025-12-25 23:04:30.853034+00	{"eTag": "\\"142cdbcd4c36f5eb29c55d12e9ad9e48\\"", "size": 177521, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-25T23:04:30.837Z", "contentLength": 177521, "httpStatusCode": 200}	453d4826-39e0-472f-a188-b5c5f31df9c8	\N	{}	2
bfc0a1be-1e78-4f61-99d8-4e35b05cea6a	faturas	triagem/1766856225572_bizu_forte.pdf	\N	2025-12-27 17:23:45.667425+00	2025-12-27 17:23:45.667425+00	2025-12-27 17:23:45.667425+00	{"eTag": "\\"80853473f4a5114d4f2a7436965de0f4\\"", "size": 177404, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T17:23:45.653Z", "contentLength": 177404, "httpStatusCode": 200}	fd9bc6f3-ad44-4a14-8688-6d80c2dfcfbd	\N	{}	2
b01985d5-e03d-4f95-9493-d095670ad41f	faturas	triagem/1766703975249_cresse_4.pdf	\N	2025-12-25 23:06:15.341506+00	2025-12-25 23:06:15.341506+00	2025-12-25 23:06:15.341506+00	{"eTag": "\\"29d2ae248666696fe64dc89f16093ac4\\"", "size": 177637, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-25T23:06:15.333Z", "contentLength": 177637, "httpStatusCode": 200}	900a42b9-783a-455f-81b0-3f018619689f	\N	{}	2
20ca4913-debd-40c5-a683-e8821817e2b6	faturas	triagem/1766704113274_cresse_9.pdf	\N	2025-12-25 23:08:33.373789+00	2025-12-25 23:08:33.373789+00	2025-12-25 23:08:33.373789+00	{"eTag": "\\"8c1955d302e692a9551fbf291c9497fb\\"", "size": 182459, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-25T23:08:33.365Z", "contentLength": 182459, "httpStatusCode": 200}	61fd73e4-5614-4e8d-adc6-7554b1b6138b	\N	{}	2
7b9f1b49-4752-43a0-8bbe-4372eb39fc8f	faturas	triagem/1766856225791_cresse.pdf	\N	2025-12-27 17:23:45.90876+00	2025-12-27 17:23:45.90876+00	2025-12-27 17:23:45.90876+00	{"eTag": "\\"142cdbcd4c36f5eb29c55d12e9ad9e48\\"", "size": 177521, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T17:23:45.877Z", "contentLength": 177521, "httpStatusCode": 200}	3f7db46d-2070-4091-8ff7-278353123177	\N	{}	2
71a6b148-84f6-44ab-9121-73084ae79dee	faturas	triagem/1766704192141_Fatura_novembro_R__1.527_16.pdf	\N	2025-12-25 23:09:52.302949+00	2025-12-25 23:09:52.302949+00	2025-12-25 23:09:52.302949+00	{"eTag": "\\"ff7a3773725c537fc6cd72ae461a42ac\\"", "size": 182445, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-25T23:09:52.290Z", "contentLength": 182445, "httpStatusCode": 200}	5b19ee51-ff2a-4b80-9df3-d1506a470fcf	\N	{}	2
e565efdf-927a-47a5-9beb-f90156dfdacd	faturas	triagem/1766704192389_cresse_10.pdf	\N	2025-12-25 23:09:52.439616+00	2025-12-25 23:09:52.439616+00	2025-12-25 23:09:52.439616+00	{"eTag": "\\"ee00ca7b92501f1a96ede32bfb66134f\\"", "size": 182549, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-25T23:09:52.422Z", "contentLength": 182549, "httpStatusCode": 200}	d3d8d907-d104-4c62-99a8-6ecec1511b70	\N	{}	2
c017c985-dc05-453f-b1c8-6c7c2aaeaee0	faturas	triagem/1766704192619_cresse_9.pdf	\N	2025-12-25 23:09:52.671937+00	2025-12-25 23:09:52.671937+00	2025-12-25 23:09:52.671937+00	{"eTag": "\\"8c1955d302e692a9551fbf291c9497fb\\"", "size": 182459, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-25T23:09:52.654Z", "contentLength": 182459, "httpStatusCode": 200}	74b408df-d998-4e42-bc75-e4c947a39b17	\N	{}	2
e586965b-bfc4-4917-8409-188748c5167b	faturas	triagem/1766704192716_cresse_5.pdf	\N	2025-12-25 23:09:52.758473+00	2025-12-25 23:09:52.758473+00	2025-12-25 23:09:52.758473+00	{"eTag": "\\"491fb9da933f702de76af94c27160b6d\\"", "size": 182162, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-25T23:09:52.746Z", "contentLength": 182162, "httpStatusCode": 200}	5b029a0f-fb6c-42cf-ac2e-884f1a1eb3d1	\N	{}	2
841e28ff-2ed8-4453-886a-adac4fdb1345	faturas	triagem/1766704192798_cresse_4.pdf	\N	2025-12-25 23:09:52.843921+00	2025-12-25 23:09:52.843921+00	2025-12-25 23:09:52.843921+00	{"eTag": "\\"29d2ae248666696fe64dc89f16093ac4\\"", "size": 177637, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-25T23:09:52.830Z", "contentLength": 177637, "httpStatusCode": 200}	a977805f-5475-4873-8cbd-968e505273e0	\N	{}	2
fe5f771c-2678-4d1b-8f55-c587ce54203a	faturas	triagem/1766704192954_cresse_2.pdf	\N	2025-12-25 23:09:53.093301+00	2025-12-25 23:09:53.093301+00	2025-12-25 23:09:53.093301+00	{"eTag": "\\"142cdbcd4c36f5eb29c55d12e9ad9e48\\"", "size": 177521, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-25T23:09:53.054Z", "contentLength": 177521, "httpStatusCode": 200}	04f77eef-281f-49d5-b77d-90255ff435c1	\N	{}	2
173742d4-6d30-4692-8d12-639c862f6a5e	faturas	triagem/1767483637441_bizuforte.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-03 23:40:40.071831+00	2026-01-03 23:40:40.071831+00	2026-01-03 23:40:40.071831+00	{"eTag": "\\"be4f815107538aa68badcad6a3cf0c84\\"", "size": 182627, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-03T23:40:39.926Z", "contentLength": 182627, "httpStatusCode": 200}	e2ed0202-0dfe-4928-bbb4-830546c8b4eb	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
3170ef62-c06b-490d-a293-4c400e8b9eb3	faturas	triagem/1766704193134_cresse_1.pdf	\N	2025-12-25 23:09:53.186512+00	2025-12-25 23:09:53.186512+00	2025-12-25 23:09:53.186512+00	{"eTag": "\\"7f597cdb5332d5b6fb3e696d0e01f775\\"", "size": 177326, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-25T23:09:53.174Z", "contentLength": 177326, "httpStatusCode": 200}	2741102d-6ae6-4ab7-902e-34afae1e32c4	\N	{}	2
8d4a36b3-ca1c-487a-ac66-fd9bdae49424	faturas	triagem/1766856177875_cresse.pdf	\N	2025-12-27 17:22:57.985833+00	2025-12-27 17:22:57.985833+00	2025-12-27 17:22:57.985833+00	{"eTag": "\\"7f597cdb5332d5b6fb3e696d0e01f775\\"", "size": 177326, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T17:22:57.935Z", "contentLength": 177326, "httpStatusCode": 200}	3902d3f3-3680-4864-8f00-35916895aca9	\N	{}	2
4dd834b3-89b6-4c4d-a77e-a03ebfcdafc5	faturas	triagem/1766704193279_cresse.pdf	\N	2025-12-25 23:09:53.352252+00	2025-12-25 23:09:53.352252+00	2025-12-25 23:09:53.352252+00	{"eTag": "\\"d0909da518a248386f245d2ecaf15809\\"", "size": 244141, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-25T23:09:53.338Z", "contentLength": 244141, "httpStatusCode": 200}	cfac323c-4927-433b-a0f5-3e92635185a4	\N	{}	2
3f819544-ccab-4879-b9b9-37348feaa3b4	faturas	triagem/1766704571545_bizu_forte.pdf	\N	2025-12-25 23:16:11.642262+00	2025-12-25 23:16:11.642262+00	2025-12-25 23:16:11.642262+00	{"eTag": "\\"80853473f4a5114d4f2a7436965de0f4\\"", "size": 177404, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-25T23:16:11.625Z", "contentLength": 177404, "httpStatusCode": 200}	ac15c9ef-299a-4266-ace4-7684005a4a2b	\N	{}	2
2c566d48-dd37-4862-8485-654d83f5307e	faturas	triagem/1766856266034_bizu_forte.pdf	\N	2025-12-27 17:24:26.15723+00	2025-12-27 17:24:26.15723+00	2025-12-27 17:24:26.15723+00	{"eTag": "\\"ebc017e8deb33a4aa669893a10930ef8\\"", "size": 177605, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T17:24:26.142Z", "contentLength": 177605, "httpStatusCode": 200}	7d11c289-dd99-4864-a63b-47942bbbc8ee	\N	{}	2
d4c4d289-7f44-4b35-b835-673f3aaafb05	faturas	triagem/1766704685001_Fatura_novembro_R__1.527_16.pdf	\N	2025-12-25 23:18:05.077694+00	2025-12-25 23:18:05.077694+00	2025-12-25 23:18:05.077694+00	{"eTag": "\\"ff7a3773725c537fc6cd72ae461a42ac\\"", "size": 182445, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-25T23:18:05.069Z", "contentLength": 182445, "httpStatusCode": 200}	f490f352-261b-41bf-8168-33f46b89bbdb	\N	{}	2
73c20bf4-1732-4eda-a90d-729ac9031213	faturas	triagem/1766704685150_cresse_10.pdf	\N	2025-12-25 23:18:05.192918+00	2025-12-25 23:18:05.192918+00	2025-12-25 23:18:05.192918+00	{"eTag": "\\"ee00ca7b92501f1a96ede32bfb66134f\\"", "size": 182549, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-25T23:18:05.177Z", "contentLength": 182549, "httpStatusCode": 200}	2de78da3-baa3-4e42-ba95-72fa03659c12	\N	{}	2
45fad86c-1fd2-4adc-a8d6-b2b5e0efc554	faturas	triagem/1766856266264_cresse.pdf	\N	2025-12-27 17:24:26.353926+00	2025-12-27 17:24:26.353926+00	2025-12-27 17:24:26.353926+00	{"eTag": "\\"29d2ae248666696fe64dc89f16093ac4\\"", "size": 177637, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T17:24:26.330Z", "contentLength": 177637, "httpStatusCode": 200}	32c1597f-41fd-4637-9f66-373a0112400e	\N	{}	2
6a26bd3a-712e-4e71-bf17-4063a82db5f0	faturas	triagem/1766704685228_cresse_9.pdf	\N	2025-12-25 23:18:05.279579+00	2025-12-25 23:18:05.279579+00	2025-12-25 23:18:05.279579+00	{"eTag": "\\"8c1955d302e692a9551fbf291c9497fb\\"", "size": 182459, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-25T23:18:05.269Z", "contentLength": 182459, "httpStatusCode": 200}	d47f2173-861d-4a41-9a1f-cf5290000678	\N	{}	2
3d47663b-5920-402a-8813-a75e5117cec4	faturas	triagem/1766704685313_cresse_5.pdf	\N	2025-12-25 23:18:05.354542+00	2025-12-25 23:18:05.354542+00	2025-12-25 23:18:05.354542+00	{"eTag": "\\"491fb9da933f702de76af94c27160b6d\\"", "size": 182162, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-25T23:18:05.341Z", "contentLength": 182162, "httpStatusCode": 200}	56b42e1d-944e-4587-95ef-8892246808f7	\N	{}	2
4e825efd-388a-444b-a372-30ff4254e4be	faturas	triagem/1766704685391_cresse_4.pdf	\N	2025-12-25 23:18:05.430838+00	2025-12-25 23:18:05.430838+00	2025-12-25 23:18:05.430838+00	{"eTag": "\\"29d2ae248666696fe64dc89f16093ac4\\"", "size": 177637, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-25T23:18:05.421Z", "contentLength": 177637, "httpStatusCode": 200}	2a62c31c-4b27-4b7d-a419-647d0e111b80	\N	{}	2
3221dc88-1183-4621-b360-797eb28b8ec0	faturas	triagem/1766704685466_cresse_2.pdf	\N	2025-12-25 23:18:05.508023+00	2025-12-25 23:18:05.508023+00	2025-12-25 23:18:05.508023+00	{"eTag": "\\"142cdbcd4c36f5eb29c55d12e9ad9e48\\"", "size": 177521, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-25T23:18:05.497Z", "contentLength": 177521, "httpStatusCode": 200}	ad38039d-443f-48c6-a345-e668f891be49	\N	{}	2
2de53240-1299-403d-952d-10b98d17f171	faturas	triagem/1766704685540_cresse_1.pdf	\N	2025-12-25 23:18:05.585128+00	2025-12-25 23:18:05.585128+00	2025-12-25 23:18:05.585128+00	{"eTag": "\\"7f597cdb5332d5b6fb3e696d0e01f775\\"", "size": 177326, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-25T23:18:05.573Z", "contentLength": 177326, "httpStatusCode": 200}	bd427e22-9dc4-436d-8bca-77d1614ec7c6	\N	{}	2
ef2f498c-e841-49ed-a2bc-18aacd1bf1b8	faturas	triagem/1766704685628_cresse.pdf	\N	2025-12-25 23:18:05.670765+00	2025-12-25 23:18:05.670765+00	2025-12-25 23:18:05.670765+00	{"eTag": "\\"d0909da518a248386f245d2ecaf15809\\"", "size": 244141, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-25T23:18:05.661Z", "contentLength": 244141, "httpStatusCode": 200}	578b0392-15ab-4fd5-b60c-76d74cba6e69	\N	{}	2
b9a952d0-7a4f-4276-b558-35b44893b919	faturas	triagem/1766704685710_bizu_forte.pdf	\N	2025-12-25 23:18:05.768178+00	2025-12-25 23:18:05.768178+00	2025-12-25 23:18:05.768178+00	{"eTag": "\\"80853473f4a5114d4f2a7436965de0f4\\"", "size": 177404, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-25T23:18:05.741Z", "contentLength": 177404, "httpStatusCode": 200}	955f4c07-b30e-4b6c-a452-265d76bf66eb	\N	{}	2
36bd166d-75f1-4dfc-a8d0-e1e026c5d5c5	faturas	triagem/1767483640907_cresse.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-03 23:40:41.035123+00	2026-01-03 23:40:41.035123+00	2026-01-03 23:40:41.035123+00	{"eTag": "\\"7611906e10c4ba00005fdbb8ebf88b34\\"", "size": 182580, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-03T23:40:40.998Z", "contentLength": 182580, "httpStatusCode": 200}	dea842d9-b7d8-4b8b-a089-12c3549bca98	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
8b03e6e2-d928-491c-b6f6-d82a6c8cad13	faturas	triagem/1766704685956_landoski.pdf	\N	2025-12-25 23:18:06.033325+00	2025-12-25 23:18:06.033325+00	2025-12-25 23:18:06.033325+00	{"eTag": "\\"af9741746f03a59d4e8352db926befef\\"", "size": 177432, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-25T23:18:06.013Z", "contentLength": 177432, "httpStatusCode": 200}	3fde6ef0-504f-413b-809a-83a8c33a2f4e	\N	{}	2
bfae2a48-23fb-4b71-9feb-4f4a2c130b7b	faturas	triagem/1766856226015_francisco_pf.pdf	\N	2025-12-27 17:23:46.134377+00	2025-12-27 17:23:46.134377+00	2025-12-27 17:23:46.134377+00	{"eTag": "\\"13e291ade247632417985f791d8be182\\"", "size": 177271, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T17:23:46.117Z", "contentLength": 177271, "httpStatusCode": 200}	3c50d8e5-807a-4160-ae8c-d12440107420	\N	{}	2
9cf5d153-54f1-4adb-82e2-73a4f37d238c	faturas	triagem/1766704686090_kipper.pdf	\N	2025-12-25 23:18:06.157754+00	2025-12-25 23:18:06.157754+00	2025-12-25 23:18:06.157754+00	{"eTag": "\\"f5f8a02ff4517e052008e1abf39dadbd\\"", "size": 177269, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-25T23:18:06.145Z", "contentLength": 177269, "httpStatusCode": 200}	c2460a11-083a-4d0a-91b5-101ad17f9af2	\N	{}	2
cbdfa2a3-c757-439e-a406-3ca77425628f	faturas	triagem/1768043123581_Cresse.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 11:05:23.679057+00	2026-01-10 11:05:23.679057+00	2026-01-10 11:05:23.679057+00	{"eTag": "\\"ff7a3773725c537fc6cd72ae461a42ac\\"", "size": 182445, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T11:05:23.668Z", "contentLength": 182445, "httpStatusCode": 200}	49ccdf81-0344-4843-a272-bd204e9e3380	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
0350d357-81c2-453b-aa40-1ba752dadd18	faturas	triagem/1766856226236_francisco_pj.pdf	\N	2025-12-27 17:23:46.413284+00	2025-12-27 17:23:46.413284+00	2025-12-27 17:23:46.413284+00	{"eTag": "\\"b8e9a5bf694458dfbd596461e70264c5\\"", "size": 177111, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T17:23:46.381Z", "contentLength": 177111, "httpStatusCode": 200}	1058401e-7f09-4fea-8dfa-efdce4986c91	\N	{}	2
6a6a02da-66eb-4f1f-b865-9989e92b930e	faturas	triagem/1767483641198_francisco_pf.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-03 23:40:41.299804+00	2026-01-03 23:40:41.299804+00	2026-01-03 23:40:41.299804+00	{"eTag": "\\"3f7478a8cca67883333b1c98656ef8ad\\"", "size": 182687, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-03T23:40:41.274Z", "contentLength": 182687, "httpStatusCode": 200}	bb63bfc9-5cf1-4932-97a8-826f065f3db9	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
b7fae9bf-313c-433e-ae05-c8cb0918a2cc	faturas	triagem/1766856226539_kipper.pdf	\N	2025-12-27 17:23:46.592108+00	2025-12-27 17:23:46.592108+00	2025-12-27 17:23:46.592108+00	{"eTag": "\\"f5f8a02ff4517e052008e1abf39dadbd\\"", "size": 177269, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T17:23:46.581Z", "contentLength": 177269, "httpStatusCode": 200}	3f66183d-4c36-4588-8d82-4b21cf5538a6	\N	{}	2
1414aae2-5021-4c92-8c81-67bb0f2a3c10	faturas	triagem/1766856226662_landoski.pdf	\N	2025-12-27 17:23:46.71866+00	2025-12-27 17:23:46.71866+00	2025-12-27 17:23:46.71866+00	{"eTag": "\\"af9741746f03a59d4e8352db926befef\\"", "size": 177432, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T17:23:46.693Z", "contentLength": 177432, "httpStatusCode": 200}	cba98e98-1fbb-47ee-b7dc-a37944b8aa40	\N	{}	2
a450d712-250b-4a37-9b6a-7e572dc11faa	faturas	triagem/1767483641427_francisco_pj.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-03 23:40:41.495722+00	2026-01-03 23:40:41.495722+00	2026-01-03 23:40:41.495722+00	{"eTag": "\\"3fd467f8573bb1eb1e73ccc58619e417\\"", "size": 182504, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-03T23:40:41.478Z", "contentLength": 182504, "httpStatusCode": 200}	4d4cc63e-aa5d-488d-af6d-210abb610bc5	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
c33c361a-9c74-4822-aa7f-a79f820c5052	faturas	triagem/1766856294057_bizu_forte.pdf	\N	2025-12-27 17:24:54.12231+00	2025-12-27 17:24:54.12231+00	2025-12-27 17:24:54.12231+00	{"eTag": "\\"9717777d08813969090363d775eaa88d\\"", "size": 181829, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T17:24:54.109Z", "contentLength": 181829, "httpStatusCode": 200}	90573210-bf55-4556-8245-d9ec0eb740a7	\N	{}	2
eef48fab-e3b8-4574-a1d4-cd38c6eebf07	faturas	triagem/1766856294179_cresse.pdf	\N	2025-12-27 17:24:54.218896+00	2025-12-27 17:24:54.218896+00	2025-12-27 17:24:54.218896+00	{"eTag": "\\"491fb9da933f702de76af94c27160b6d\\"", "size": 182162, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T17:24:54.205Z", "contentLength": 182162, "httpStatusCode": 200}	654b1387-b739-4120-b9ca-0260d526ee3c	\N	{}	2
04dd9bbf-cab5-4208-89e4-9b403fc4ae06	faturas	triagem/1766856294275_francisco_pf.pdf	\N	2025-12-27 17:24:54.311893+00	2025-12-27 17:24:54.311893+00	2025-12-27 17:24:54.311893+00	{"eTag": "\\"098bd0333a1f66480513bf13ea6bafe6\\"", "size": 182047, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T17:24:54.297Z", "contentLength": 182047, "httpStatusCode": 200}	f860a015-8662-4400-81a5-c62011b95e4f	\N	{}	2
053d6544-a4c1-4a43-8ae9-b9c5bc8bc5ad	faturas	triagem/1766856294353_francisco_pj.pdf	\N	2025-12-27 17:24:54.389647+00	2025-12-27 17:24:54.389647+00	2025-12-27 17:24:54.389647+00	{"eTag": "\\"308d4af5f58e93b3e142f47d5feccef6\\"", "size": 181898, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T17:24:54.377Z", "contentLength": 181898, "httpStatusCode": 200}	354a5b36-a422-474d-9ee4-82873f40e50f	\N	{}	2
268d15b3-7679-4d93-949d-837657532a96	faturas	triagem/1766856294425_kipper.pdf	\N	2025-12-27 17:24:54.464732+00	2025-12-27 17:24:54.464732+00	2025-12-27 17:24:54.464732+00	{"eTag": "\\"351aaddec06d24adfd09c6d83373a280\\"", "size": 181832, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T17:24:54.453Z", "contentLength": 181832, "httpStatusCode": 200}	6f033492-15f1-4180-b097-9ff25cec2aaa	\N	{}	2
7f0d9a01-d6b8-4187-aad0-4e201e01e922	faturas	triagem/1766856294602_miranda.pdf	\N	2025-12-27 17:24:54.639684+00	2025-12-27 17:24:54.639684+00	2025-12-27 17:24:54.639684+00	{"eTag": "\\"35803a60011d12fcb77acff40dbb2e51\\"", "size": 182003, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T17:24:54.625Z", "contentLength": 182003, "httpStatusCode": 200}	bb153986-ce5f-49d5-adcb-ab30094d3421	\N	{}	2
06caf5ae-586b-462c-99bb-1971081e263b	faturas	triagem/1767483641588_kipper.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-03 23:40:41.660768+00	2026-01-03 23:40:41.660768+00	2026-01-03 23:40:41.660768+00	{"eTag": "\\"d50a33487b3b2dc2c4a2323e07a51400\\"", "size": 182444, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-03T23:40:41.642Z", "contentLength": 182444, "httpStatusCode": 200}	7f208347-d5c0-4045-b259-0f68d67a0077	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
34d5e4ca-9e00-467b-9ff1-e3ffe7c45efb	faturas	triagem/1768043263967_cresse.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 11:07:44.166024+00	2026-01-10 11:07:44.166024+00	2026-01-10 11:07:44.166024+00	{"eTag": "\\"491fb9da933f702de76af94c27160b6d\\"", "size": 182162, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T11:07:44.147Z", "contentLength": 182162, "httpStatusCode": 200}	81aa00a3-4d84-431d-9a40-e50710e49f49	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
f05d1e1d-4bf7-4f5a-8318-7f900a9b88f1	faturas	triagem/1767483641783_landoski.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-03 23:40:41.868116+00	2026-01-03 23:40:41.868116+00	2026-01-03 23:40:41.868116+00	{"eTag": "\\"ea7da9655b547164a7c360846d867f32\\"", "size": 182608, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-03T23:40:41.846Z", "contentLength": 182608, "httpStatusCode": 200}	c9467f08-e3c1-476c-a60d-97250889ea69	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
9ac5ef38-9e62-499c-ab60-e7a70cc880ed	faturas	triagem/1768062775975_cresse.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 16:32:57.224911+00	2026-01-10 16:32:57.224911+00	2026-01-10 16:32:57.224911+00	{"eTag": "\\"491fb9da933f702de76af94c27160b6d\\"", "size": 182162, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T16:32:57.064Z", "contentLength": 182162, "httpStatusCode": 200}	12b8e8b3-0780-4f8e-a950-300b39c92ce3	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
1a204219-828f-4a4b-85ae-4588ae6b0d53	faturas	triagem/1767483642043_melo.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-03 23:40:42.195722+00	2026-01-03 23:40:42.195722+00	2026-01-03 23:40:42.195722+00	{"eTag": "\\"486cd01942727cd674a35ff3f297b19f\\"", "size": 182615, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-03T23:40:42.170Z", "contentLength": 182615, "httpStatusCode": 200}	78aac8fe-3a37-4f9e-866f-80acbe6d27de	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
308ba0b3-27b0-49df-b2af-3ce509497cfd	faturas	triagem/1767483642366_menezes.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-03 23:40:42.444821+00	2026-01-03 23:40:42.444821+00	2026-01-03 23:40:42.444821+00	{"eTag": "\\"bdfd9eeb62bb86bda36b1d77a9c814e5\\"", "size": 182648, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-03T23:40:42.414Z", "contentLength": 182648, "httpStatusCode": 200}	02f41108-3ea0-4953-9fe8-bddfc9ed86d3	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
13392b4b-c1cb-4177-88b7-7fd3b450a3fe	faturas	triagem/1767483642567_miranda.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-03 23:40:42.645447+00	2026-01-03 23:40:42.645447+00	2026-01-03 23:40:42.645447+00	{"eTag": "\\"e5336439e2f0961d9572fcc851fcbac9\\"", "size": 182473, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-03T23:40:42.622Z", "contentLength": 182473, "httpStatusCode": 200}	0159c32b-a5cf-4bd2-bdf1-342a2f6a0371	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
e0bc6bce-bd8e-484c-b2db-2f8f827af970	faturas	triagem/1767805756069_landoski.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-07 17:09:17.020471+00	2026-01-07 17:09:17.020471+00	2026-01-07 17:09:17.020471+00	{"eTag": "\\"ea7da9655b547164a7c360846d867f32\\"", "size": 182608, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-07T17:09:16.937Z", "contentLength": 182608, "httpStatusCode": 200}	8395a319-9c27-46e3-9578-0bf9e186204b	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
d0ca8949-e952-4303-a286-371e57495170	faturas	triagem/1767981252610_kipper.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 17:54:12.769396+00	2026-01-09 17:54:12.769396+00	2026-01-09 17:54:12.769396+00	{"eTag": "\\"d50a33487b3b2dc2c4a2323e07a51400\\"", "size": 182444, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T17:54:12.748Z", "contentLength": 182444, "httpStatusCode": 200}	aeb94a00-54b0-4374-97bd-713b3fc1e383	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
28decd07-38cb-4791-85de-dbdeebcf7edd	faturas	triagem/1767986349365_kipper.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 19:19:09.477112+00	2026-01-09 19:19:09.477112+00	2026-01-09 19:19:09.477112+00	{"eTag": "\\"d50a33487b3b2dc2c4a2323e07a51400\\"", "size": 182444, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T19:19:09.462Z", "contentLength": 182444, "httpStatusCode": 200}	5fc16771-9822-4dc5-9b50-519cb5332adc	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
c38bfb9f-b09d-4bd4-8b41-a9d31d956a2a	faturas	triagem/1767987277017_kipper.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 19:34:37.125278+00	2026-01-09 19:34:37.125278+00	2026-01-09 19:34:37.125278+00	{"eTag": "\\"d50a33487b3b2dc2c4a2323e07a51400\\"", "size": 182444, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T19:34:37.107Z", "contentLength": 182444, "httpStatusCode": 200}	79d4dc0d-86e7-4855-9a0d-98caf2ba60e0	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
4a4688e3-551f-4b20-9cf2-6f6634cf6881	faturas	triagem/1767987837552_kipper.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 19:43:57.643317+00	2026-01-09 19:43:57.643317+00	2026-01-09 19:43:57.643317+00	{"eTag": "\\"d50a33487b3b2dc2c4a2323e07a51400\\"", "size": 182444, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T19:43:57.630Z", "contentLength": 182444, "httpStatusCode": 200}	d3e9d428-63bb-4fc6-900d-9e8ab29569a0	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
f5ec6c2c-b7ac-4902-b5ab-7a043466ca6e	faturas	triagem/1767989921956_kipper.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 20:18:42.045471+00	2026-01-09 20:18:42.045471+00	2026-01-09 20:18:42.045471+00	{"eTag": "\\"d50a33487b3b2dc2c4a2323e07a51400\\"", "size": 182444, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T20:18:42.036Z", "contentLength": 182444, "httpStatusCode": 200}	21042aa6-f160-40e8-9311-872ddd414d4a	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
34e110be-6d7f-48bd-ab26-b477f1c1f7e5	faturas	triagem/1766856396840_bizu_forte.pdf	\N	2025-12-27 17:26:36.929234+00	2025-12-27 17:26:36.929234+00	2025-12-27 17:26:36.929234+00	{"eTag": "\\"3b3220970359a9b62a02b95eee281793\\"", "size": 181792, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T17:26:36.916Z", "contentLength": 181792, "httpStatusCode": 200}	49cfbdc4-0efd-443d-bbdd-2b9210002f23	\N	{}	2
1ee52581-7175-4c0e-ba6e-71c052931c1d	faturas	triagem/1766856396999_cresse8.pdf	\N	2025-12-27 17:26:37.041498+00	2025-12-27 17:26:37.041498+00	2025-12-27 17:26:37.041498+00	{"eTag": "\\"95d528b796df06d1d4eb3d154697b962\\"", "size": 182152, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T17:26:37.032Z", "contentLength": 182152, "httpStatusCode": 200}	a417f7ff-e402-4f93-a3d5-9d4c27264aaa	\N	{}	2
67b4a9ce-748a-4879-aa45-2a9835136776	faturas	triagem/1767719746485_bizuforte.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-06 17:15:49.659917+00	2026-01-06 17:15:49.659917+00	2026-01-06 17:15:49.659917+00	{"eTag": "\\"be4f815107538aa68badcad6a3cf0c84\\"", "size": 182627, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-06T17:15:49.429Z", "contentLength": 182627, "httpStatusCode": 200}	3ce5104d-f568-4e2f-9f3a-a806dc33b540	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
ef62b564-51f5-4721-a1ca-ec25ab1385f0	faturas	triagem/1766856397075_francisco_pf.pdf	\N	2025-12-27 17:26:37.114873+00	2025-12-27 17:26:37.114873+00	2025-12-27 17:26:37.114873+00	{"eTag": "\\"4349263b5bcd80518ca8a6c59e99fd58\\"", "size": 182128, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T17:26:37.104Z", "contentLength": 182128, "httpStatusCode": 200}	1091fcd6-8beb-4c3e-80a0-c8be86aef455	\N	{}	2
07878c55-bf56-430c-97cd-095cb33a0f5a	faturas	triagem/1768043515792_cresse.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 11:11:55.885918+00	2026-01-10 11:11:55.885918+00	2026-01-10 11:11:55.885918+00	{"eTag": "\\"7611906e10c4ba00005fdbb8ebf88b34\\"", "size": 182580, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T11:11:55.875Z", "contentLength": 182580, "httpStatusCode": 200}	3e25bd69-806c-4d97-a08f-ef6731d1f209	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
05aca26d-6a61-41c9-b6cb-13c22686943d	faturas	triagem/1766856397156_francisco_pj.pdf	\N	2025-12-27 17:26:37.19527+00	2025-12-27 17:26:37.19527+00	2025-12-27 17:26:37.19527+00	{"eTag": "\\"d7df6ab420707681b45fa4cbedb17b62\\"", "size": 182072, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T17:26:37.184Z", "contentLength": 182072, "httpStatusCode": 200}	bec9c963-2364-4efd-87d8-8e15ea56db28	\N	{}	2
145c3166-ea85-4d0b-9e60-3a2a977de544	faturas	triagem/1767719750113_cresse.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-06 17:15:50.408942+00	2026-01-06 17:15:50.408942+00	2026-01-06 17:15:50.408942+00	{"eTag": "\\"7611906e10c4ba00005fdbb8ebf88b34\\"", "size": 182580, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-06T17:15:50.389Z", "contentLength": 182580, "httpStatusCode": 200}	53e7e1cc-a568-4b0d-ba6f-b7a3fcc80417	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
2462fe79-6797-4ec0-acab-13b1044f46c8	faturas	triagem/1766856397243_kipper.pdf	\N	2025-12-27 17:26:37.295813+00	2025-12-27 17:26:37.295813+00	2025-12-27 17:26:37.295813+00	{"eTag": "\\"46fedcd9b6ea1390adb4779db0fb70d6\\"", "size": 181822, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T17:26:37.284Z", "contentLength": 181822, "httpStatusCode": 200}	64b36dba-4168-4c5b-bbf5-6666dee77edc	\N	{}	2
2c872fe1-5349-4c94-bf20-a95c17a39a67	faturas	triagem/1766856397326_landoski.pdf	\N	2025-12-27 17:26:37.366979+00	2025-12-27 17:26:37.366979+00	2025-12-27 17:26:37.366979+00	{"eTag": "\\"6a3468747316c627dbadc71e3d68d1a2\\"", "size": 182084, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T17:26:37.356Z", "contentLength": 182084, "httpStatusCode": 200}	26b99a7d-f9b9-42f8-9978-cb59fcd97907	\N	{}	2
d0428e0f-cd89-49d8-80ba-7f5fe6fda8ac	faturas	triagem/1766856397400_melo.pdf	\N	2025-12-27 17:26:37.435588+00	2025-12-27 17:26:37.435588+00	2025-12-27 17:26:37.435588+00	{"eTag": "\\"2525b931d1f03ea5e1904f5cd0201d51\\"", "size": 182106, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T17:26:37.424Z", "contentLength": 182106, "httpStatusCode": 200}	84f03b78-ef1e-4ea4-81b0-5678b23ecf4d	\N	{}	2
ec55f707-6028-447d-af4a-4b251cc532bb	faturas	triagem/1766856397470_miranda.pdf	\N	2025-12-27 17:26:37.514662+00	2025-12-27 17:26:37.514662+00	2025-12-27 17:26:37.514662+00	{"eTag": "\\"97cdf339941fed2c9bff31b86f9737da\\"", "size": 181967, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T17:26:37.496Z", "contentLength": 181967, "httpStatusCode": 200}	a9baeaf0-6520-4556-90d8-98cf8a474ed0	\N	{}	2
f497992f-7188-47f2-95cb-fbeb425e7846	faturas	triagem/1766856463038_bizu_forte.pdf	\N	2025-12-27 17:27:43.142981+00	2025-12-27 17:27:43.142981+00	2025-12-27 17:27:43.142981+00	{"eTag": "\\"b4179a0429eb4108ecc909294cf142c1\\"", "size": 182348, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T17:27:43.131Z", "contentLength": 182348, "httpStatusCode": 200}	2034048e-828d-45cd-8ce7-f9c7abfca903	\N	{}	2
7c56c859-60da-4d3f-a08e-e9155fcc93b9	faturas	triagem/1766856463216_cresse.pdf	\N	2025-12-27 17:27:43.259816+00	2025-12-27 17:27:43.259816+00	2025-12-27 17:27:43.259816+00	{"eTag": "\\"ee00ca7b92501f1a96ede32bfb66134f\\"", "size": 182549, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T17:27:43.243Z", "contentLength": 182549, "httpStatusCode": 200}	5b955d11-5378-4474-a3bb-f2b9ed797e96	\N	{}	2
0eb95085-a745-4675-a5e5-0c4ff260c38f	faturas	triagem/1766856463305_francisco_pf.pdf	\N	2025-12-27 17:27:43.363991+00	2025-12-27 17:27:43.363991+00	2025-12-27 17:27:43.363991+00	{"eTag": "\\"db66a1639b01a813fcb05b6d6816b076\\"", "size": 182321, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T17:27:43.339Z", "contentLength": 182321, "httpStatusCode": 200}	3118aceb-b0db-4ffa-b41e-f43a9ad94595	\N	{}	2
f567391c-39d9-44f5-a812-5a15afa21b17	faturas	triagem/1766856463437_francisco_pj.pdf	\N	2025-12-27 17:27:43.495206+00	2025-12-27 17:27:43.495206+00	2025-12-27 17:27:43.495206+00	{"eTag": "\\"7e183743c917bbcfb1a23bad776cdb71\\"", "size": 182419, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T17:27:43.471Z", "contentLength": 182419, "httpStatusCode": 200}	e57333af-f7f0-4dd8-90ab-62ea4330fd76	\N	{}	2
8707e36c-7099-41ab-9e6a-d3e811cf9b37	faturas	triagem/1766856427663_bizu_forte.pdf	\N	2025-12-27 17:27:07.732481+00	2025-12-27 17:27:07.732481+00	2025-12-27 17:27:07.732481+00	{"eTag": "\\"39267a15782d7e8f91c708c9235b7afd\\"", "size": 182090, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T17:27:07.725Z", "contentLength": 182090, "httpStatusCode": 200}	cae86cce-350a-49fc-8bd8-09e70af353c8	\N	{}	2
0577102b-ab65-4d2c-acbb-0da83c09ca73	faturas	triagem/1767719750503_francisco_pf.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-06 17:15:50.590624+00	2026-01-06 17:15:50.590624+00	2026-01-06 17:15:50.590624+00	{"eTag": "\\"3f7478a8cca67883333b1c98656ef8ad\\"", "size": 182687, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-06T17:15:50.573Z", "contentLength": 182687, "httpStatusCode": 200}	4a70a40e-4719-4333-b844-7fd8c0a80b76	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
9207c33b-1e9d-47b5-9f88-1f90fc743258	faturas	triagem/1766856427780_cresse.pdf	\N	2025-12-27 17:27:07.815404+00	2025-12-27 17:27:07.815404+00	2025-12-27 17:27:07.815404+00	{"eTag": "\\"8c1955d302e692a9551fbf291c9497fb\\"", "size": 182459, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T17:27:07.805Z", "contentLength": 182459, "httpStatusCode": 200}	3ff5bda0-db5e-42fb-bbb7-2403b842e4ea	\N	{}	2
2b0b5cbc-9dd8-45fa-9360-738009ea53a6	faturas	triagem/1766856427858_francisco_pf.pdf	\N	2025-12-27 17:27:07.897609+00	2025-12-27 17:27:07.897609+00	2025-12-27 17:27:07.897609+00	{"eTag": "\\"120bace29a2f07779ebd3c60cd5702be\\"", "size": 182295, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T17:27:07.889Z", "contentLength": 182295, "httpStatusCode": 200}	0be1d347-73eb-4824-8fe5-b57d771900e5	\N	{}	2
6d154677-39da-4f91-97ff-6dda252013d0	faturas	triagem/1767719750669_francisco_pj.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-06 17:15:50.735156+00	2026-01-06 17:15:50.735156+00	2026-01-06 17:15:50.735156+00	{"eTag": "\\"3fd467f8573bb1eb1e73ccc58619e417\\"", "size": 182504, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-06T17:15:50.717Z", "contentLength": 182504, "httpStatusCode": 200}	953ac70b-1f2d-4c6b-9c81-684a53014412	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
c2504b63-12d4-4be1-aa8a-afe1e051da3d	faturas	triagem/1766856427931_francisco_pj.pdf	\N	2025-12-27 17:27:07.969392+00	2025-12-27 17:27:07.969392+00	2025-12-27 17:27:07.969392+00	{"eTag": "\\"93686f7da638d4346324e9011a47c156\\"", "size": 182194, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T17:27:07.957Z", "contentLength": 182194, "httpStatusCode": 200}	344ebba7-1cdb-40b3-88b3-5efb5e30306b	\N	{}	2
9aaf93f9-9a6b-4f71-bb34-b5057fd7f5b5	faturas	triagem/1768044079953_cresse.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 11:21:20.074032+00	2026-01-10 11:21:20.074032+00	2026-01-10 11:21:20.074032+00	{"eTag": "\\"491fb9da933f702de76af94c27160b6d\\"", "size": 182162, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T11:21:20.063Z", "contentLength": 182162, "httpStatusCode": 200}	0c6da0ba-c66b-43fa-8be1-947d00b15cec	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
55d798ca-1caf-435e-a624-d127d0ddc906	faturas	triagem/1766856428028_kipper.pdf	\N	2025-12-27 17:27:08.066241+00	2025-12-27 17:27:08.066241+00	2025-12-27 17:27:08.066241+00	{"eTag": "\\"d4a5d0c390137143e33b01b94cbe3b8f\\"", "size": 182094, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T17:27:08.057Z", "contentLength": 182094, "httpStatusCode": 200}	50d556d8-6df9-4324-8e04-baa9f68e239d	\N	{}	2
17036a91-b8a7-407c-8884-704a1bd19c95	faturas	triagem/1767719750802_kipper.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-06 17:15:50.885333+00	2026-01-06 17:15:50.885333+00	2026-01-06 17:15:50.885333+00	{"eTag": "\\"d50a33487b3b2dc2c4a2323e07a51400\\"", "size": 182444, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-06T17:15:50.869Z", "contentLength": 182444, "httpStatusCode": 200}	25f23c69-b4bb-43ce-9bd8-cc9537f6e0a5	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
24135fb7-2135-4b00-85ef-5cd94597c5e3	faturas	triagem/1766856428103_landoski.pdf	\N	2025-12-27 17:27:08.151156+00	2025-12-27 17:27:08.151156+00	2025-12-27 17:27:08.151156+00	{"eTag": "\\"a1c4862abc1efac0b9714f77265c0359\\"", "size": 182349, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T17:27:08.129Z", "contentLength": 182349, "httpStatusCode": 200}	60151859-c40f-4ac2-aa56-ebf4aa517eee	\N	{}	2
896111ac-68ff-4c05-b953-831898a2a95d	faturas	triagem/1766856428185_melo.pdf	\N	2025-12-27 17:27:08.231886+00	2025-12-27 17:27:08.231886+00	2025-12-27 17:27:08.231886+00	{"eTag": "\\"61de69567cc42f5d5ba95aa81475a902\\"", "size": 182497, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T17:27:08.221Z", "contentLength": 182497, "httpStatusCode": 200}	0c0eca3a-3ae7-4f84-bab9-36de5fa54aae	\N	{}	2
de2f21df-4697-446a-97ce-31fa0e311d80	faturas	triagem/1767719750976_landoski.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-06 17:15:51.025672+00	2026-01-06 17:15:51.025672+00	2026-01-06 17:15:51.025672+00	{"eTag": "\\"ea7da9655b547164a7c360846d867f32\\"", "size": 182608, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-06T17:15:51.013Z", "contentLength": 182608, "httpStatusCode": 200}	a7540446-8a1e-4366-86bb-1f63b2fdc809	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
f3b619e7-ab70-463b-b3ae-28f6a0ad84a5	faturas	triagem/1766856428265_menezes.pdf	\N	2025-12-27 17:27:08.32009+00	2025-12-27 17:27:08.32009+00	2025-12-27 17:27:08.32009+00	{"eTag": "\\"680600a2ffe06d2048f281327cf4c4c8\\"", "size": 182469, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T17:27:08.309Z", "contentLength": 182469, "httpStatusCode": 200}	e85f4f18-4c67-466c-8887-215e293a4ce4	\N	{}	2
060a7565-7db4-4609-8c06-cb19d5b88df9	faturas	triagem/1766856428353_miranda.pdf	\N	2025-12-27 17:27:08.418449+00	2025-12-27 17:27:08.418449+00	2025-12-27 17:27:08.418449+00	{"eTag": "\\"e9ce439872ffb6141d01efe99caae36b\\"", "size": 182063, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T17:27:08.401Z", "contentLength": 182063, "httpStatusCode": 200}	f9e2f9f1-e652-4c60-b345-39c924bfc6ee	\N	{}	2
ced5a39d-54ad-4197-aba1-b54b6b385307	faturas	triagem/1767719751115_melo.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-06 17:15:51.161189+00	2026-01-06 17:15:51.161189+00	2026-01-06 17:15:51.161189+00	{"eTag": "\\"486cd01942727cd674a35ff3f297b19f\\"", "size": 182615, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-06T17:15:51.149Z", "contentLength": 182615, "httpStatusCode": 200}	d82726f1-5e7c-4b32-9f89-3540b85798e8	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
6d609c48-dcfe-48e6-8c9e-f807548fcac3	faturas	triagem/1766856463536_kipper.pdf	\N	2025-12-27 17:27:43.574528+00	2025-12-27 17:27:43.574528+00	2025-12-27 17:27:43.574528+00	{"eTag": "\\"40dbaee056f5dbbebe9b9865367ffbbd\\"", "size": 182118, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T17:27:43.559Z", "contentLength": 182118, "httpStatusCode": 200}	4712ac3b-e498-40af-8b5a-bbe00845b639	\N	{}	2
c066e451-9f9e-4764-b895-dd15d6e38830	faturas	triagem/1766856463623_landoski.pdf	\N	2025-12-27 17:27:43.658359+00	2025-12-27 17:27:43.658359+00	2025-12-27 17:27:43.658359+00	{"eTag": "\\"1fdf68f0c7c96f11e6c85f1e810c73be\\"", "size": 182371, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T17:27:43.647Z", "contentLength": 182371, "httpStatusCode": 200}	2418465a-4fa6-4882-92bd-5f7eaafe2a19	\N	{}	2
ee1e106e-c68f-4ab4-be14-cc8e94fa6697	faturas	triagem/1767719751246_menezes.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-06 17:15:51.295896+00	2026-01-06 17:15:51.295896+00	2026-01-06 17:15:51.295896+00	{"eTag": "\\"bdfd9eeb62bb86bda36b1d77a9c814e5\\"", "size": 182648, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-06T17:15:51.281Z", "contentLength": 182648, "httpStatusCode": 200}	4b0cdf5a-6c8f-47ef-96d9-5eeb339cdb80	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
ce8c79b8-90f2-43b8-9f4b-68fa17e1debc	faturas	triagem/1766856463704_melo.pdf	\N	2025-12-27 17:27:43.751019+00	2025-12-27 17:27:43.751019+00	2025-12-27 17:27:43.751019+00	{"eTag": "\\"bb34b0d2f6d71ccf15ef257f4615e75c\\"", "size": 182430, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T17:27:43.739Z", "contentLength": 182430, "httpStatusCode": 200}	a879b58a-22cd-4915-8240-b69b2bc743e6	\N	{}	2
361b8082-42be-41ee-bb2c-660c0db40651	faturas	triagem/1766856463791_menezes.pdf	\N	2025-12-27 17:27:43.831214+00	2025-12-27 17:27:43.831214+00	2025-12-27 17:27:43.831214+00	{"eTag": "\\"e9854b123bae27dba707709c56f7443c\\"", "size": 182392, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T17:27:43.815Z", "contentLength": 182392, "httpStatusCode": 200}	76a258e6-4389-4171-8d44-49cbf3b342da	\N	{}	2
46a808b2-d230-435c-9f67-49356592c88a	faturas	triagem/1767719751374_miranda.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-06 17:15:51.431558+00	2026-01-06 17:15:51.431558+00	2026-01-06 17:15:51.431558+00	{"eTag": "\\"e5336439e2f0961d9572fcc851fcbac9\\"", "size": 182473, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-06T17:15:51.417Z", "contentLength": 182473, "httpStatusCode": 200}	985bbe41-47df-4696-93dd-51a14e174e2c	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
b01d54df-880d-4585-9faf-a12ddbba9959	faturas	triagem/1766856463893_miranda.pdf	\N	2025-12-27 17:27:43.955453+00	2025-12-27 17:27:43.955453+00	2025-12-27 17:27:43.955453+00	{"eTag": "\\"528dfa3b894e49c1c995cf85a55dc476\\"", "size": 205214, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T17:27:43.935Z", "contentLength": 205214, "httpStatusCode": 200}	8b1653f4-6f8e-429b-a0d4-cf5ba77ba408	\N	{}	2
4bacf226-ccf0-4b4a-bd9d-680bdc5c1a33	faturas	triagem/1767805936786_kipper.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-07 17:12:17.005375+00	2026-01-07 17:12:17.005375+00	2026-01-07 17:12:17.005375+00	{"eTag": "\\"d50a33487b3b2dc2c4a2323e07a51400\\"", "size": 182444, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-07T17:12:16.978Z", "contentLength": 182444, "httpStatusCode": 200}	bf1f07d0-bbe9-4353-8310-9e04c53fb328	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
213a5313-a081-476f-aedf-bc33a014e04e	faturas	triagem/1766856668957_Bizu_forte.pdf	\N	2025-12-27 17:31:09.037872+00	2025-12-27 17:31:09.037872+00	2025-12-27 17:31:09.037872+00	{"eTag": "\\"584f405408eafd20df0454a6c0e730c6\\"", "size": 182289, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T17:31:09.025Z", "contentLength": 182289, "httpStatusCode": 200}	19474438-6bf1-4490-b9b6-b9298a12d57e	\N	{}	2
545e3833-75ca-4924-a9f2-48a3e918a081	faturas	triagem/1766856669113_Cresse.pdf	\N	2025-12-27 17:31:09.179363+00	2025-12-27 17:31:09.179363+00	2025-12-27 17:31:09.179363+00	{"eTag": "\\"ff7a3773725c537fc6cd72ae461a42ac\\"", "size": 182445, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T17:31:09.153Z", "contentLength": 182445, "httpStatusCode": 200}	e8dfee00-b8de-4fc9-92d3-95aef90f499e	\N	{}	2
113b014d-3788-48f0-b5cf-28957c70cf8f	faturas	triagem/1766856669249_Francisco_PF.pdf	\N	2025-12-27 17:31:09.3145+00	2025-12-27 17:31:09.3145+00	2025-12-27 17:31:09.3145+00	{"eTag": "\\"45d1f470c389dbac1883204a729d445a\\"", "size": 182677, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T17:31:09.297Z", "contentLength": 182677, "httpStatusCode": 200}	0130a927-c959-4dc4-a1ef-b959e3d6e14f	\N	{}	2
34bdfb6f-ba62-429c-ab6b-ee1fdb054246	faturas	triagem/1766856669368_Francisco_PJ.pdf	\N	2025-12-27 17:31:09.44541+00	2025-12-27 17:31:09.44541+00	2025-12-27 17:31:09.44541+00	{"eTag": "\\"7212cc61d43b0e02ce8e33fba320f071\\"", "size": 182406, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T17:31:09.425Z", "contentLength": 182406, "httpStatusCode": 200}	7d7aa5b4-144e-45a1-9eca-f7f4d40a806a	\N	{}	2
d8214bb4-c575-4e61-8b20-f128bd2a79a9	faturas	triagem/1766856669507_kipper.pdf	\N	2025-12-27 17:31:09.573166+00	2025-12-27 17:31:09.573166+00	2025-12-27 17:31:09.573166+00	{"eTag": "\\"e2747d168f1f3ff39c96bc849429476e\\"", "size": 182063, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T17:31:09.557Z", "contentLength": 182063, "httpStatusCode": 200}	80447bfc-2f55-4d51-ad63-0d21284cb076	\N	{}	2
ddebdfc9-9294-4e29-a1f3-1223bd81320a	faturas	triagem/1766856669648_Landoski.pdf	\N	2025-12-27 17:31:09.713148+00	2025-12-27 17:31:09.713148+00	2025-12-27 17:31:09.713148+00	{"eTag": "\\"9566ad69ccc4bd977831cc78e9689e6a\\"", "size": 182316, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T17:31:09.693Z", "contentLength": 182316, "httpStatusCode": 200}	93c074fd-672a-456b-a03f-6ef0beb9fd71	\N	{}	2
7c9ccdd7-f628-47c8-aaed-4f7562b52c40	faturas	triagem/1766856669763_Melo.pdf	\N	2025-12-27 17:31:09.819687+00	2025-12-27 17:31:09.819687+00	2025-12-27 17:31:09.819687+00	{"eTag": "\\"1b2c1a48219816a664fba5d0c6b99f47\\"", "size": 182460, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T17:31:09.805Z", "contentLength": 182460, "httpStatusCode": 200}	fba5e061-fef2-410b-a031-14b941b79eb8	\N	{}	2
e9abdfd2-b605-4764-acec-b7fc05b91e46	faturas	triagem/1768046677388_cresse.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 12:04:37.566647+00	2026-01-10 12:04:37.566647+00	2026-01-10 12:04:37.566647+00	{"eTag": "\\"491fb9da933f702de76af94c27160b6d\\"", "size": 182162, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T12:04:37.553Z", "contentLength": 182162, "httpStatusCode": 200}	defb8e1d-088b-492a-a40a-090d1018cda1	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
8565b96a-35e2-47a9-a464-24f69a4479a1	faturas	triagem/1766856669893_Menezes.pdf	\N	2025-12-27 17:31:09.943493+00	2025-12-27 17:31:09.943493+00	2025-12-27 17:31:09.943493+00	{"eTag": "\\"f1a11453063ea58e0eb6d2b290acf48a\\"", "size": 182584, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T17:31:09.929Z", "contentLength": 182584, "httpStatusCode": 200}	61921068-26f1-4a29-9129-9893923c9e3e	\N	{}	2
ef6a5153-acea-4b7d-9c89-725d35249ba7	faturas	triagem/1767725340170_kipper.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-06 18:49:01.952372+00	2026-01-06 18:49:01.952372+00	2026-01-06 18:49:01.952372+00	{"eTag": "\\"d50a33487b3b2dc2c4a2323e07a51400\\"", "size": 182444, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-06T18:49:01.721Z", "contentLength": 182444, "httpStatusCode": 200}	8b46f6b6-2aaa-4ebf-aa40-175004bd20ac	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
451ef878-ce3f-45e9-b32d-b202dd3896e0	faturas	triagem/1766856669992_Miranda.pdf	\N	2025-12-27 17:31:10.049775+00	2025-12-27 17:31:10.049775+00	2025-12-27 17:31:10.049775+00	{"eTag": "\\"60aaf831959fc90bf893aa51cc2bb6fd\\"", "size": 182369, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T17:31:10.029Z", "contentLength": 182369, "httpStatusCode": 200}	3799bb07-6ed3-4d1d-91ec-f8d70aa0cd43	\N	{}	2
cf189bdf-dadf-4a09-9435-f9cea6cb764c	faturas	triagem/1768062992596_cresse.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 16:36:32.693812+00	2026-01-10 16:36:32.693812+00	2026-01-10 16:36:32.693812+00	{"eTag": "\\"491fb9da933f702de76af94c27160b6d\\"", "size": 182162, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T16:36:32.682Z", "contentLength": 182162, "httpStatusCode": 200}	981cccf5-3c89-48b4-9e6c-4c9179d6ce01	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
27ed8938-b496-41b4-860e-3d18efba7cc9	faturas	triagem/1766861719312_Bizu_forte.pdf	\N	2025-12-27 18:55:20.647715+00	2025-12-27 18:55:20.647715+00	2025-12-27 18:55:20.647715+00	{"eTag": "\\"584f405408eafd20df0454a6c0e730c6\\"", "size": 182289, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T18:55:20.522Z", "contentLength": 182289, "httpStatusCode": 200}	5af19ccd-00cf-4c07-8f0b-d4c9586459d5	\N	{}	2
2babcaa2-9c97-469d-a87a-c61981a95538	faturas	triagem/1767725342436_landoski.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-06 18:49:02.69891+00	2026-01-06 18:49:02.69891+00	2026-01-06 18:49:02.69891+00	{"eTag": "\\"ea7da9655b547164a7c360846d867f32\\"", "size": 182608, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-06T18:49:02.649Z", "contentLength": 182608, "httpStatusCode": 200}	c54e3f1b-151a-4ad4-921c-4bece017f600	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
b0a36168-0b5f-406a-bf71-e8f6eca24e0b	faturas	triagem/1766861720836_Cresse.pdf	\N	2025-12-27 18:55:20.912577+00	2025-12-27 18:55:20.912577+00	2025-12-27 18:55:20.912577+00	{"eTag": "\\"ff7a3773725c537fc6cd72ae461a42ac\\"", "size": 182445, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T18:55:20.898Z", "contentLength": 182445, "httpStatusCode": 200}	a71d6f09-ee61-4e6b-b8d1-e8971f012b0b	\N	{}	2
9999745f-5b55-4de0-9408-8a0989db279b	faturas	triagem/1766861721187_Francisco_PF.pdf	\N	2025-12-27 18:55:21.467925+00	2025-12-27 18:55:21.467925+00	2025-12-27 18:55:21.467925+00	{"eTag": "\\"45d1f470c389dbac1883204a729d445a\\"", "size": 182677, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T18:55:21.398Z", "contentLength": 182677, "httpStatusCode": 200}	97d2f84a-0b7b-41bc-ad5b-c5625303e9a2	\N	{}	2
f7164295-ab20-4248-a769-22240ef68ce1	faturas	triagem/1767807206293_landoski.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-07 17:33:27.286438+00	2026-01-07 17:33:27.286438+00	2026-01-07 17:33:27.286438+00	{"eTag": "\\"ea7da9655b547164a7c360846d867f32\\"", "size": 182608, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-07T17:33:27.192Z", "contentLength": 182608, "httpStatusCode": 200}	2b85acdf-7624-47e4-9ef5-b37a1e4e7446	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
7ba00aa7-f323-4561-a84d-0444b8549dfd	faturas	triagem/1766861721639_Francisco_PJ.pdf	\N	2025-12-27 18:55:21.727245+00	2025-12-27 18:55:21.727245+00	2025-12-27 18:55:21.727245+00	{"eTag": "\\"7212cc61d43b0e02ce8e33fba320f071\\"", "size": 182406, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T18:55:21.706Z", "contentLength": 182406, "httpStatusCode": 200}	e1fe3c1d-199c-4113-b4fd-152aac7fb682	\N	{}	2
d2bbec4f-507d-4aa8-86da-7eb96bdb37cc	faturas	triagem/1766861721874_kipper.pdf	\N	2025-12-27 18:55:21.953023+00	2025-12-27 18:55:21.953023+00	2025-12-27 18:55:21.953023+00	{"eTag": "\\"e2747d168f1f3ff39c96bc849429476e\\"", "size": 182063, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T18:55:21.942Z", "contentLength": 182063, "httpStatusCode": 200}	38054ee4-b6db-4053-b122-570c7ad6790f	\N	{}	2
30665d6d-9e4f-4fab-8c85-362e07b01afd	faturas	triagem/1766861722045_Landoski.pdf	\N	2025-12-27 18:55:22.141552+00	2025-12-27 18:55:22.141552+00	2025-12-27 18:55:22.141552+00	{"eTag": "\\"9566ad69ccc4bd977831cc78e9689e6a\\"", "size": 182316, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T18:55:22.130Z", "contentLength": 182316, "httpStatusCode": 200}	979e1e64-aa6c-4468-8dce-b6d64f2c2322	\N	{}	2
0b5cded8-7dfc-4e63-bfe7-545676d158f6	faturas	triagem/1766861722224_Melo.pdf	\N	2025-12-27 18:55:22.283834+00	2025-12-27 18:55:22.283834+00	2025-12-27 18:55:22.283834+00	{"eTag": "\\"1b2c1a48219816a664fba5d0c6b99f47\\"", "size": 182460, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T18:55:22.270Z", "contentLength": 182460, "httpStatusCode": 200}	545e5abe-656e-4165-8b9b-d45a28e91bfd	\N	{}	2
5aa593e1-83cc-44dd-9b2e-444570cccca9	faturas	triagem/1766861722363_Menezes.pdf	\N	2025-12-27 18:55:22.440762+00	2025-12-27 18:55:22.440762+00	2025-12-27 18:55:22.440762+00	{"eTag": "\\"f1a11453063ea58e0eb6d2b290acf48a\\"", "size": 182584, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T18:55:22.402Z", "contentLength": 182584, "httpStatusCode": 200}	81c9c433-9216-4eaa-8194-93a6cb28cde2	\N	{}	2
d70ddd1b-680f-4d58-b1dd-a616be7924f1	faturas	triagem/1766861722497_Miranda.pdf	\N	2025-12-27 18:55:22.601222+00	2025-12-27 18:55:22.601222+00	2025-12-27 18:55:22.601222+00	{"eTag": "\\"60aaf831959fc90bf893aa51cc2bb6fd\\"", "size": 182369, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-27T18:55:22.582Z", "contentLength": 182369, "httpStatusCode": 200}	4c59d3db-569b-4ae2-9f52-09d50e9e55ac	\N	{}	2
cdd9082f-d1a6-4f69-8dce-f3c4b4b57918	faturas	triagem/1767023216233_Fatura_dezembro_R__417_12.pdf	\N	2025-12-29 15:46:58.50164+00	2025-12-29 15:46:58.50164+00	2025-12-29 15:46:58.50164+00	{"eTag": "\\"d91dccec83d3b36995873c876341dda8\\"", "size": 724293, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-29T15:46:58.168Z", "contentLength": 724293, "httpStatusCode": 200}	ab17c8a3-88dd-4c27-aeac-7b008127cd73	\N	{}	2
835a29dd-e293-4844-8c0f-c7df674e02c8	faturas	triagem/1767024869777_bizuforte.pdf	\N	2025-12-29 16:14:30.051679+00	2025-12-29 16:14:30.051679+00	2025-12-29 16:14:30.051679+00	{"eTag": "\\"be4f815107538aa68badcad6a3cf0c84\\"", "size": 182627, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-29T16:14:30.018Z", "contentLength": 182627, "httpStatusCode": 200}	c23042ec-8328-41b3-b775-c0353be31d1b	\N	{}	2
6e8bc707-8648-43f5-b0ce-82090c9ea76a	faturas	triagem/1767745913900_kipper.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-07 00:31:56.07175+00	2026-01-07 00:31:56.07175+00	2026-01-07 00:31:56.07175+00	{"eTag": "\\"d50a33487b3b2dc2c4a2323e07a51400\\"", "size": 182444, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-07T00:31:55.923Z", "contentLength": 182444, "httpStatusCode": 200}	6adbc857-4384-43e6-929f-673ca5aa4bfe	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
ce9e0829-b099-41a6-936a-027ec7e54243	faturas	triagem/1767025642427_cresse.pdf	\N	2025-12-29 16:27:22.659364+00	2025-12-29 16:27:22.659364+00	2025-12-29 16:27:22.659364+00	{"eTag": "\\"7611906e10c4ba00005fdbb8ebf88b34\\"", "size": 182580, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-29T16:27:22.638Z", "contentLength": 182580, "httpStatusCode": 200}	7c682ff3-b928-44f3-8bd9-1669e45ec34f	\N	{}	2
f55cce25-cc6c-4f2f-9ac4-48b7903a19f0	faturas	triagem/1767025642774_francisco_pf.pdf	\N	2025-12-29 16:27:22.835219+00	2025-12-29 16:27:22.835219+00	2025-12-29 16:27:22.835219+00	{"eTag": "\\"3f7478a8cca67883333b1c98656ef8ad\\"", "size": 182687, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-29T16:27:22.822Z", "contentLength": 182687, "httpStatusCode": 200}	4573122c-cdec-44ee-b54a-2b5d5234bfd0	\N	{}	2
408a13d1-2cd6-4d96-991b-b93cb031d0b9	faturas	triagem/1767807502683_landoski.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-07 17:38:22.809915+00	2026-01-07 17:38:22.809915+00	2026-01-07 17:38:22.809915+00	{"eTag": "\\"ea7da9655b547164a7c360846d867f32\\"", "size": 182608, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-07T17:38:22.796Z", "contentLength": 182608, "httpStatusCode": 200}	05f3892f-5eef-40a4-9f74-76264e6a6648	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
e613984a-5828-49c1-a984-3f4d204b4966	faturas	triagem/1767025642892_francisco_pj.pdf	\N	2025-12-29 16:27:22.965598+00	2025-12-29 16:27:22.965598+00	2025-12-29 16:27:22.965598+00	{"eTag": "\\"3fd467f8573bb1eb1e73ccc58619e417\\"", "size": 182504, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-29T16:27:22.950Z", "contentLength": 182504, "httpStatusCode": 200}	a6bfd919-1771-409c-88ec-c84bfba4b473	\N	{}	2
137d8069-6971-41b1-b7d2-6e8f3bea7f19	faturas	triagem/1767975739604_kipper.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 16:22:22.421907+00	2026-01-09 16:22:22.421907+00	2026-01-09 16:22:22.421907+00	{"eTag": "\\"d50a33487b3b2dc2c4a2323e07a51400\\"", "size": 182444, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T16:22:21.697Z", "contentLength": 182444, "httpStatusCode": 200}	441eb5dd-fd3d-4234-a820-01fb18dd5ba5	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
9865e583-e6fd-45df-b0c0-fe67c48b1246	faturas	triagem/1767025643038_kipper.pdf	\N	2025-12-29 16:27:23.092933+00	2025-12-29 16:27:23.092933+00	2025-12-29 16:27:23.092933+00	{"eTag": "\\"d50a33487b3b2dc2c4a2323e07a51400\\"", "size": 182444, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-29T16:27:23.082Z", "contentLength": 182444, "httpStatusCode": 200}	a24d0f61-b290-4984-87ac-6a0f4ac10989	\N	{}	2
0ccc7809-2467-4d49-b905-0b91d6d239ba	faturas	triagem/1767025643165_landoski.pdf	\N	2025-12-29 16:27:23.218688+00	2025-12-29 16:27:23.218688+00	2025-12-29 16:27:23.218688+00	{"eTag": "\\"ea7da9655b547164a7c360846d867f32\\"", "size": 182608, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-29T16:27:23.202Z", "contentLength": 182608, "httpStatusCode": 200}	336f5265-2ec5-41cf-a578-1027e7128856	\N	{}	2
5f8b36ed-7b04-4a13-b557-6e0603a3ad12	faturas	triagem/1767025643312_melo.pdf	\N	2025-12-29 16:27:23.38038+00	2025-12-29 16:27:23.38038+00	2025-12-29 16:27:23.38038+00	{"eTag": "\\"486cd01942727cd674a35ff3f297b19f\\"", "size": 182615, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-29T16:27:23.370Z", "contentLength": 182615, "httpStatusCode": 200}	0ebc946a-13b6-49cd-b783-5809823f7422	\N	{}	2
21f61b94-f615-4142-98d6-e7de98c4af3e	faturas	triagem/1767025643449_menezes.pdf	\N	2025-12-29 16:27:23.520308+00	2025-12-29 16:27:23.520308+00	2025-12-29 16:27:23.520308+00	{"eTag": "\\"bdfd9eeb62bb86bda36b1d77a9c814e5\\"", "size": 182648, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-29T16:27:23.502Z", "contentLength": 182648, "httpStatusCode": 200}	d2d43b77-900a-4b27-873a-a1f4bdf5d540	\N	{}	2
84cc8e8d-c628-40f0-ac2a-64c5088a4c57	faturas	triagem/1767025643645_miranda.pdf	\N	2025-12-29 16:27:23.697377+00	2025-12-29 16:27:23.697377+00	2025-12-29 16:27:23.697377+00	{"eTag": "\\"e5336439e2f0961d9572fcc851fcbac9\\"", "size": 182473, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-29T16:27:23.682Z", "contentLength": 182473, "httpStatusCode": 200}	3383926c-98d1-4356-b7fc-7b1837b0e348	\N	{}	2
726177ec-55bd-43e5-88ee-1c35e680fb8a	faturas	triagem/1767094533764_bizuforte.pdf	\N	2025-12-30 11:35:35.176185+00	2025-12-30 11:35:35.176185+00	2025-12-30 11:35:35.176185+00	{"eTag": "\\"be4f815107538aa68badcad6a3cf0c84\\"", "size": 182627, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T11:35:35.063Z", "contentLength": 182627, "httpStatusCode": 200}	3a52426e-d3e1-4218-a86b-cc540fc1946b	\N	{}	2
ceedb070-d83d-43a4-afd8-9134da86750b	faturas	triagem/1767094535367_cresse.pdf	\N	2025-12-30 11:35:35.443448+00	2025-12-30 11:35:35.443448+00	2025-12-30 11:35:35.443448+00	{"eTag": "\\"7611906e10c4ba00005fdbb8ebf88b34\\"", "size": 182580, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T11:35:35.431Z", "contentLength": 182580, "httpStatusCode": 200}	161efe17-46f2-4b74-8829-d378778fa938	\N	{}	2
f04d654e-f84e-4f40-b199-25c798df6249	faturas	triagem/1767094535508_francisco_pf.pdf	\N	2025-12-30 11:35:35.579232+00	2025-12-30 11:35:35.579232+00	2025-12-30 11:35:35.579232+00	{"eTag": "\\"3f7478a8cca67883333b1c98656ef8ad\\"", "size": 182687, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T11:35:35.563Z", "contentLength": 182687, "httpStatusCode": 200}	5740e409-3e8e-4e7d-80dc-9114a0cbdaaf	\N	{}	2
136e9db2-3451-4cd3-b982-4febf1c32483	faturas	triagem/1768046780217_cresse.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 12:06:20.300347+00	2026-01-10 12:06:20.300347+00	2026-01-10 12:06:20.300347+00	{"eTag": "\\"491fb9da933f702de76af94c27160b6d\\"", "size": 182162, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T12:06:20.286Z", "contentLength": 182162, "httpStatusCode": 200}	2f33f0ca-4c6e-426e-aed6-742642ebbd45	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
a1928a17-fded-4dee-84b0-9473f239a67a	faturas	triagem/1767094535654_francisco_pj.pdf	\N	2025-12-30 11:35:35.702415+00	2025-12-30 11:35:35.702415+00	2025-12-30 11:35:35.702415+00	{"eTag": "\\"3fd467f8573bb1eb1e73ccc58619e417\\"", "size": 182504, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T11:35:35.689Z", "contentLength": 182504, "httpStatusCode": 200}	57b7eaab-68bb-46f7-919e-c770b37927f3	\N	{}	2
e4d9edca-bd01-4751-a062-1317c17d1cd8	faturas	triagem/1767746691668_kipper.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-07 00:44:54.406781+00	2026-01-07 00:44:54.406781+00	2026-01-07 00:44:54.406781+00	{"eTag": "\\"d50a33487b3b2dc2c4a2323e07a51400\\"", "size": 182444, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-07T00:44:54.303Z", "contentLength": 182444, "httpStatusCode": 200}	14d600c9-08ea-4b45-937f-bf13cd103ab9	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
306c098a-e9d7-4c30-b756-07d56d26d0c9	faturas	triagem/1767094535765_kipper.pdf	\N	2025-12-30 11:35:35.817237+00	2025-12-30 11:35:35.817237+00	2025-12-30 11:35:35.817237+00	{"eTag": "\\"d50a33487b3b2dc2c4a2323e07a51400\\"", "size": 182444, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T11:35:35.801Z", "contentLength": 182444, "httpStatusCode": 200}	6db5514a-6220-42a1-bb45-5828871d1bd3	\N	{}	2
b7ab7114-a604-481e-a0f6-d3368c8cf043	faturas	triagem/1768063235807_cresse.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 16:40:35.980493+00	2026-01-10 16:40:35.980493+00	2026-01-10 16:40:35.980493+00	{"eTag": "\\"491fb9da933f702de76af94c27160b6d\\"", "size": 182162, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T16:40:35.968Z", "contentLength": 182162, "httpStatusCode": 200}	d6f708e1-1fea-4ce5-8960-2b01aab0bae7	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
4521d971-48e5-4bee-a33e-6bff1799b90a	faturas	triagem/1767094535881_landoski.pdf	\N	2025-12-30 11:35:35.933139+00	2025-12-30 11:35:35.933139+00	2025-12-30 11:35:35.933139+00	{"eTag": "\\"ea7da9655b547164a7c360846d867f32\\"", "size": 182608, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T11:35:35.921Z", "contentLength": 182608, "httpStatusCode": 200}	defe2f05-eed6-4d23-a72b-7ca53e69d5cb	\N	{}	2
8f951d1e-e376-4346-b837-252675d3e0fd	faturas	triagem/1767807894014_kipper.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-07 17:44:54.5662+00	2026-01-07 17:44:54.5662+00	2026-01-07 17:44:54.5662+00	{"eTag": "\\"d50a33487b3b2dc2c4a2323e07a51400\\"", "size": 182444, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-07T17:44:54.515Z", "contentLength": 182444, "httpStatusCode": 200}	20925035-ca41-4752-89bb-da89f03d15c7	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
6d36a62d-c8d7-4f8d-84ff-2f69b0daa3c3	faturas	triagem/1767094535990_melo.pdf	\N	2025-12-30 11:35:36.081387+00	2025-12-30 11:35:36.081387+00	2025-12-30 11:35:36.081387+00	{"eTag": "\\"486cd01942727cd674a35ff3f297b19f\\"", "size": 182615, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T11:35:36.065Z", "contentLength": 182615, "httpStatusCode": 200}	a9b1750e-6d12-4c4d-9986-aac0cd693184	\N	{}	2
232d63e9-bbcf-470a-baa7-f32aeb240563	faturas	triagem/1767094536147_menezes.pdf	\N	2025-12-30 11:35:36.193484+00	2025-12-30 11:35:36.193484+00	2025-12-30 11:35:36.193484+00	{"eTag": "\\"bdfd9eeb62bb86bda36b1d77a9c814e5\\"", "size": 182648, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T11:35:36.181Z", "contentLength": 182648, "httpStatusCode": 200}	64897c3d-e06b-4c01-bb63-8f3f052a92e8	\N	{}	2
9cbc02dd-9396-4568-96e0-16c7e8a3ab8c	faturas	triagem/1767094536265_miranda.pdf	\N	2025-12-30 11:35:36.327774+00	2025-12-30 11:35:36.327774+00	2025-12-30 11:35:36.327774+00	{"eTag": "\\"e5336439e2f0961d9572fcc851fcbac9\\"", "size": 182473, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T11:35:36.313Z", "contentLength": 182473, "httpStatusCode": 200}	2f286d1e-0dc5-46e0-82e8-fecf39450b0d	\N	{}	2
6def5446-ce99-4e1a-b2f2-2ca40a67f9d8	faturas	triagem/1767095045497_bizuforte.pdf	\N	2025-12-30 11:44:05.648992+00	2025-12-30 11:44:05.648992+00	2025-12-30 11:44:05.648992+00	{"eTag": "\\"be4f815107538aa68badcad6a3cf0c84\\"", "size": 182627, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T11:44:05.635Z", "contentLength": 182627, "httpStatusCode": 200}	ec62527b-225f-405c-bfcf-03173360295b	\N	{}	2
f3411d06-02cc-4d6b-99e4-ca01c702ce0b	faturas	triagem/1767095045752_landoski.pdf	\N	2025-12-30 11:44:05.795429+00	2025-12-30 11:44:05.795429+00	2025-12-30 11:44:05.795429+00	{"eTag": "\\"ea7da9655b547164a7c360846d867f32\\"", "size": 182608, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T11:44:05.785Z", "contentLength": 182608, "httpStatusCode": 200}	8c7ad75d-f68d-4a6a-b6cb-7b8ea42a074c	\N	{}	2
66896511-07cd-4a18-899f-48bd3abb7cbf	faturas	triagem/1767095347689_bizuforte.pdf	\N	2025-12-30 11:49:07.880451+00	2025-12-30 11:49:07.880451+00	2025-12-30 11:49:07.880451+00	{"eTag": "\\"be4f815107538aa68badcad6a3cf0c84\\"", "size": 182627, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T11:49:07.867Z", "contentLength": 182627, "httpStatusCode": 200}	2de37903-aaf4-4360-868c-13303b6380b6	\N	{}	2
03ad28d4-894a-4137-8f2e-f76b174e1da0	faturas	triagem/1767095347963_cresse.pdf	\N	2025-12-30 11:49:08.003894+00	2025-12-30 11:49:08.003894+00	2025-12-30 11:49:08.003894+00	{"eTag": "\\"7611906e10c4ba00005fdbb8ebf88b34\\"", "size": 182580, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T11:49:07.991Z", "contentLength": 182580, "httpStatusCode": 200}	ebef8ced-da13-44c8-9fbd-a488aee9d284	\N	{}	2
66e385cb-316e-4deb-afa4-1564f122773e	faturas	triagem/1767095348073_landoski.pdf	\N	2025-12-30 11:49:08.118178+00	2025-12-30 11:49:08.118178+00	2025-12-30 11:49:08.118178+00	{"eTag": "\\"ea7da9655b547164a7c360846d867f32\\"", "size": 182608, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T11:49:08.107Z", "contentLength": 182608, "httpStatusCode": 200}	3f35fd8c-7128-4ec8-81b3-5ac0553da683	\N	{}	2
019d6d6d-81f7-4c25-9211-a52ad3b27843	faturas	triagem/1767095435911_bizuforte.pdf	\N	2025-12-30 11:50:36.045453+00	2025-12-30 11:50:36.045453+00	2025-12-30 11:50:36.045453+00	{"eTag": "\\"be4f815107538aa68badcad6a3cf0c84\\"", "size": 182627, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T11:50:36.032Z", "contentLength": 182627, "httpStatusCode": 200}	9e3855f1-6175-43c4-b0dd-1a289a8128fe	\N	{}	2
ececa1bd-a5a7-49fd-ac07-e740c0010026	faturas	triagem/1767747057725_kipper.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-07 00:50:59.850062+00	2026-01-07 00:50:59.850062+00	2026-01-07 00:50:59.850062+00	{"eTag": "\\"d50a33487b3b2dc2c4a2323e07a51400\\"", "size": 182444, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-07T00:50:59.563Z", "contentLength": 182444, "httpStatusCode": 200}	ba3e4ae7-8089-4b6c-80de-f4d85693def1	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
6cd35e54-76c0-400b-b8f9-022c49a06a97	faturas	triagem/1767095436174_cresse.pdf	\N	2025-12-30 11:50:36.226312+00	2025-12-30 11:50:36.226312+00	2025-12-30 11:50:36.226312+00	{"eTag": "\\"7611906e10c4ba00005fdbb8ebf88b34\\"", "size": 182580, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T11:50:36.212Z", "contentLength": 182580, "httpStatusCode": 200}	571e1d4b-4c12-4fbc-9c93-7ff2e58e3855	\N	{}	2
8c935294-d9ff-4d0f-8675-7cf943629724	faturas	triagem/1767095436313_landoski.pdf	\N	2025-12-30 11:50:36.373258+00	2025-12-30 11:50:36.373258+00	2025-12-30 11:50:36.373258+00	{"eTag": "\\"ea7da9655b547164a7c360846d867f32\\"", "size": 182608, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T11:50:36.364Z", "contentLength": 182608, "httpStatusCode": 200}	6be7456e-4322-4316-8ec8-4a012d1de364	\N	{}	2
cbf2d1c1-639b-42d7-bb73-f84edf167b66	faturas	triagem/1767833746082_kipper.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-08 00:55:48.099508+00	2026-01-08 00:55:48.099508+00	2026-01-08 00:55:48.099508+00	{"eTag": "\\"d50a33487b3b2dc2c4a2323e07a51400\\"", "size": 182444, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-08T00:55:47.917Z", "contentLength": 182444, "httpStatusCode": 200}	657ea699-fc41-4f9d-84bb-d2fe54d1a2d2	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
20d99f6f-cdf7-4aa8-894a-2a9b607b5376	faturas	triagem/1767095580970_bizuforte.pdf	\N	2025-12-30 11:53:01.077342+00	2025-12-30 11:53:01.077342+00	2025-12-30 11:53:01.077342+00	{"eTag": "\\"be4f815107538aa68badcad6a3cf0c84\\"", "size": 182627, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T11:53:01.062Z", "contentLength": 182627, "httpStatusCode": 200}	74bed702-f050-4678-ba77-c25a50272377	\N	{}	2
0c6f1990-34f6-4ec7-a80f-d2872b5e4c72	faturas	triagem/1767977393374_kipper.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 16:49:53.708471+00	2026-01-09 16:49:53.708471+00	2026-01-09 16:49:53.708471+00	{"eTag": "\\"d50a33487b3b2dc2c4a2323e07a51400\\"", "size": 182444, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T16:49:53.666Z", "contentLength": 182444, "httpStatusCode": 200}	76834cd8-f31e-4f18-b55e-c5153403b3be	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
ffc7ca9e-f072-464f-adc3-7d1dc479956a	faturas	triagem/1767095581172_cresse.pdf	\N	2025-12-30 11:53:01.238223+00	2025-12-30 11:53:01.238223+00	2025-12-30 11:53:01.238223+00	{"eTag": "\\"7611906e10c4ba00005fdbb8ebf88b34\\"", "size": 182580, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T11:53:01.222Z", "contentLength": 182580, "httpStatusCode": 200}	66ef8b6a-072e-4ddb-9ce5-3f3aa93e7c69	\N	{}	2
faf24d1a-bcdf-4cf5-892a-cb59907f5375	faturas	triagem/1767981904316_kipper.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 18:05:04.416371+00	2026-01-09 18:05:04.416371+00	2026-01-09 18:05:04.416371+00	{"eTag": "\\"d50a33487b3b2dc2c4a2323e07a51400\\"", "size": 182444, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T18:05:04.405Z", "contentLength": 182444, "httpStatusCode": 200}	4729eadf-0d40-4a7c-97f8-84d282a8d488	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
bf9b64bb-6e7f-46cb-8c15-7bbb7dbc4b3c	faturas	triagem/1767095581312_landoski.pdf	\N	2025-12-30 11:53:01.384757+00	2025-12-30 11:53:01.384757+00	2025-12-30 11:53:01.384757+00	{"eTag": "\\"ea7da9655b547164a7c360846d867f32\\"", "size": 182608, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T11:53:01.366Z", "contentLength": 182608, "httpStatusCode": 200}	8af8c120-f92f-4840-b3c6-33dad97271b9	\N	{}	2
2f352b06-0055-466c-b207-4a9a7550cadc	faturas	triagem/1767095855009_kipper.pdf	\N	2025-12-30 11:57:35.107186+00	2025-12-30 11:57:35.107186+00	2025-12-30 11:57:35.107186+00	{"eTag": "\\"d50a33487b3b2dc2c4a2323e07a51400\\"", "size": 182444, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T11:57:35.099Z", "contentLength": 182444, "httpStatusCode": 200}	b36ed1d8-8e25-47e9-923a-1f630cbd239d	\N	{}	2
92d0a9c2-318c-484f-b729-0318b0f14928	faturas	triagem/1767096245481_cresse.pdf	\N	2025-12-30 12:04:05.685404+00	2025-12-30 12:04:05.685404+00	2025-12-30 12:04:05.685404+00	{"eTag": "\\"7611906e10c4ba00005fdbb8ebf88b34\\"", "size": 182580, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T12:04:05.666Z", "contentLength": 182580, "httpStatusCode": 200}	88611db6-7818-486b-b82a-2ab3901cd435	\N	{}	2
b81cdae2-71dc-4415-8cd2-f0311e5d613b	faturas	triagem/1767099463339_bizuforte.pdf	\N	2025-12-30 12:57:43.921703+00	2025-12-30 12:57:43.921703+00	2025-12-30 12:57:43.921703+00	{"eTag": "\\"be4f815107538aa68badcad6a3cf0c84\\"", "size": 182627, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T12:57:43.862Z", "contentLength": 182627, "httpStatusCode": 200}	ea407be2-a0ff-47b8-98fb-ac89f30b319f	\N	{}	2
e8b1f266-e0bb-45cd-85ea-f39d3a30e85c	faturas	triagem/1767099464111_cresse.pdf	\N	2025-12-30 12:57:44.191479+00	2025-12-30 12:57:44.191479+00	2025-12-30 12:57:44.191479+00	{"eTag": "\\"7611906e10c4ba00005fdbb8ebf88b34\\"", "size": 182580, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T12:57:44.174Z", "contentLength": 182580, "httpStatusCode": 200}	7d086dcc-e6fe-4cb9-8149-de2cde0caaa1	\N	{}	2
10971a6e-f11d-4d16-ac0a-1a7783a187f8	faturas	triagem/1767099464298_francisco_pf.pdf	\N	2025-12-30 12:57:44.343552+00	2025-12-30 12:57:44.343552+00	2025-12-30 12:57:44.343552+00	{"eTag": "\\"3f7478a8cca67883333b1c98656ef8ad\\"", "size": 182687, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T12:57:44.330Z", "contentLength": 182687, "httpStatusCode": 200}	8d11721a-bcf3-49c3-b89e-ca4eb57aa9bd	\N	{}	2
da2e2485-3008-486e-9322-90e086c197e0	faturas	triagem/1767099464421_francisco_pj.pdf	\N	2025-12-30 12:57:44.49009+00	2025-12-30 12:57:44.49009+00	2025-12-30 12:57:44.49009+00	{"eTag": "\\"3fd467f8573bb1eb1e73ccc58619e417\\"", "size": 182504, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T12:57:44.454Z", "contentLength": 182504, "httpStatusCode": 200}	c612ed42-6e5c-4b83-b138-e3d6a3cfc7b9	\N	{}	2
36be8d41-adbc-44d5-9abd-a69b2af848c7	faturas	triagem/1768054104818_cresse.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 14:08:25.986913+00	2026-01-10 14:08:25.986913+00	2026-01-10 14:08:25.986913+00	{"eTag": "\\"491fb9da933f702de76af94c27160b6d\\"", "size": 182162, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T14:08:25.749Z", "contentLength": 182162, "httpStatusCode": 200}	f8bd162d-90a7-4640-923c-e6af9a5f58de	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
c0ff2128-326f-4b29-899e-8cf8baae2064	faturas	triagem/1767099464552_kipper.pdf	\N	2025-12-30 12:57:44.620205+00	2025-12-30 12:57:44.620205+00	2025-12-30 12:57:44.620205+00	{"eTag": "\\"d50a33487b3b2dc2c4a2323e07a51400\\"", "size": 182444, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T12:57:44.606Z", "contentLength": 182444, "httpStatusCode": 200}	e8680c2f-23e4-4954-acb4-32063b1775a3	\N	{}	2
2403459d-6ab5-4e09-9cec-796aa13cd446	faturas	triagem/1767747700421_kipper.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-07 01:01:43.038179+00	2026-01-07 01:01:43.038179+00	2026-01-07 01:01:43.038179+00	{"eTag": "\\"d50a33487b3b2dc2c4a2323e07a51400\\"", "size": 182444, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-07T01:01:42.769Z", "contentLength": 182444, "httpStatusCode": 200}	52c1956a-f941-4c4d-bc88-10d01266bf48	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
e7fa3cdd-79ee-4da4-b6fb-05a28ea9e016	faturas	triagem/1767099464694_landoski.pdf	\N	2025-12-30 12:57:44.7454+00	2025-12-30 12:57:44.7454+00	2025-12-30 12:57:44.7454+00	{"eTag": "\\"ea7da9655b547164a7c360846d867f32\\"", "size": 182608, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T12:57:44.731Z", "contentLength": 182608, "httpStatusCode": 200}	c43b82f9-4804-4084-b54d-b6e3720f374e	\N	{}	2
718d6215-957d-4b77-beed-55b700c9883a	faturas	triagem/1768063369511_cresse.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 16:42:49.595016+00	2026-01-10 16:42:49.595016+00	2026-01-10 16:42:49.595016+00	{"eTag": "\\"491fb9da933f702de76af94c27160b6d\\"", "size": 182162, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T16:42:49.585Z", "contentLength": 182162, "httpStatusCode": 200}	6ee29598-b66f-472d-9096-4b1014351637	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
395a7881-5fd0-4544-9826-1ff89fe1b349	faturas	triagem/1767099464842_melo.pdf	\N	2025-12-30 12:57:44.889786+00	2025-12-30 12:57:44.889786+00	2025-12-30 12:57:44.889786+00	{"eTag": "\\"486cd01942727cd674a35ff3f297b19f\\"", "size": 182615, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T12:57:44.875Z", "contentLength": 182615, "httpStatusCode": 200}	1dc7aa84-22c7-42b7-853d-37afb1676e8f	\N	{}	2
8c2458d4-a6d2-4b8e-b782-dfae416f4e12	faturas	triagem/1767910927004_kipper.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-08 22:22:08.941364+00	2026-01-08 22:22:08.941364+00	2026-01-08 22:22:08.941364+00	{"eTag": "\\"d50a33487b3b2dc2c4a2323e07a51400\\"", "size": 182444, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-08T22:22:08.773Z", "contentLength": 182444, "httpStatusCode": 200}	a7e1922f-571d-47b4-8eaa-8da48939e958	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
4fbdb99b-8338-4591-845a-b0ac67592fbf	faturas	triagem/1767099464992_menezes.pdf	\N	2025-12-30 12:57:45.064296+00	2025-12-30 12:57:45.064296+00	2025-12-30 12:57:45.064296+00	{"eTag": "\\"bdfd9eeb62bb86bda36b1d77a9c814e5\\"", "size": 182648, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T12:57:45.051Z", "contentLength": 182648, "httpStatusCode": 200}	1ea80db4-4b31-4377-9ece-e4cae48d192f	\N	{}	2
572b2d61-503f-4036-884c-d95c6779260a	faturas	triagem/1767099465137_miranda.pdf	\N	2025-12-30 12:57:46.394043+00	2025-12-30 12:57:46.394043+00	2025-12-30 12:57:46.394043+00	{"eTag": "\\"e5336439e2f0961d9572fcc851fcbac9\\"", "size": 182473, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T12:57:46.323Z", "contentLength": 182473, "httpStatusCode": 200}	3f68160a-9da3-4809-a4ab-07354981be25	\N	{}	2
891fe3af-1b34-46b0-ba7e-07aa324f9d8d	faturas	triagem/1767101052793_bizu_forte.pdf	\N	2025-12-30 13:24:13.509166+00	2025-12-30 13:24:13.509166+00	2025-12-30 13:24:13.509166+00	{"eTag": "\\"b4179a0429eb4108ecc909294cf142c1\\"", "size": 182348, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T13:24:13.440Z", "contentLength": 182348, "httpStatusCode": 200}	3bd48d72-dd78-4a43-b438-a7c047b7f537	\N	{}	2
9533ff5e-df12-4dd6-9aff-2f210901dc8e	faturas	triagem/1767101053636_cresse.pdf	\N	2025-12-30 13:24:13.694206+00	2025-12-30 13:24:13.694206+00	2025-12-30 13:24:13.694206+00	{"eTag": "\\"ee00ca7b92501f1a96ede32bfb66134f\\"", "size": 182549, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T13:24:13.680Z", "contentLength": 182549, "httpStatusCode": 200}	d1af94f3-22fd-4c8b-8004-980097d4497e	\N	{}	2
90cbf5d0-54b6-475f-99ae-ce3ce4f7f76d	faturas	triagem/1767101053769_francisco_pf.pdf	\N	2025-12-30 13:24:13.813997+00	2025-12-30 13:24:13.813997+00	2025-12-30 13:24:13.813997+00	{"eTag": "\\"db66a1639b01a813fcb05b6d6816b076\\"", "size": 182321, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T13:24:13.800Z", "contentLength": 182321, "httpStatusCode": 200}	a9683211-47ca-4e93-b688-f5e6146dd61e	\N	{}	2
55e5a2f7-ad1a-41aa-a655-1ed2f7524fff	faturas	triagem/1767101053884_francisco_pj.pdf	\N	2025-12-30 13:24:13.938896+00	2025-12-30 13:24:13.938896+00	2025-12-30 13:24:13.938896+00	{"eTag": "\\"7e183743c917bbcfb1a23bad776cdb71\\"", "size": 182419, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T13:24:13.916Z", "contentLength": 182419, "httpStatusCode": 200}	5fbc2e14-4e4a-4218-a9d5-1c81d9f1e215	\N	{}	2
779d6686-ba0c-43ea-b5af-4d27a0b31a6d	faturas	triagem/1767101053984_kipper.pdf	\N	2025-12-30 13:24:14.048771+00	2025-12-30 13:24:14.048771+00	2025-12-30 13:24:14.048771+00	{"eTag": "\\"40dbaee056f5dbbebe9b9865367ffbbd\\"", "size": 182118, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T13:24:14.032Z", "contentLength": 182118, "httpStatusCode": 200}	14616ebd-8554-4859-a78f-90e54ba9ef92	\N	{}	2
69eaa0de-993a-4427-8cda-291289b43f1e	faturas	triagem/1767101054112_landoski.pdf	\N	2025-12-30 13:24:14.162952+00	2025-12-30 13:24:14.162952+00	2025-12-30 13:24:14.162952+00	{"eTag": "\\"1fdf68f0c7c96f11e6c85f1e810c73be\\"", "size": 182371, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T13:24:14.148Z", "contentLength": 182371, "httpStatusCode": 200}	537f2fb3-b82d-4fc1-82f5-b60443da0b62	\N	{}	2
6aef9576-73ab-4761-972b-0347a8ec817a	faturas	triagem/1767101054227_melo.pdf	\N	2025-12-30 13:24:14.303862+00	2025-12-30 13:24:14.303862+00	2025-12-30 13:24:14.303862+00	{"eTag": "\\"bb34b0d2f6d71ccf15ef257f4615e75c\\"", "size": 182430, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T13:24:14.280Z", "contentLength": 182430, "httpStatusCode": 200}	ffac3997-487b-4736-a44a-e6a403426a25	\N	{}	2
1db62163-9a5b-48ab-a79a-554693b574a1	faturas	triagem/1767101054400_menezes.pdf	\N	2025-12-30 13:24:14.473393+00	2025-12-30 13:24:14.473393+00	2025-12-30 13:24:14.473393+00	{"eTag": "\\"e9854b123bae27dba707709c56f7443c\\"", "size": 182392, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T13:24:14.452Z", "contentLength": 182392, "httpStatusCode": 200}	afba4c1b-f2ff-407d-bbb3-5225048b89ed	\N	{}	2
2a1d49c5-11ef-42f0-b374-9b0aa30c262a	faturas	triagem/1767748247125_kipper.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-07 01:10:47.646004+00	2026-01-07 01:10:47.646004+00	2026-01-07 01:10:47.646004+00	{"eTag": "\\"d50a33487b3b2dc2c4a2323e07a51400\\"", "size": 182444, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-07T01:10:47.595Z", "contentLength": 182444, "httpStatusCode": 200}	e704f388-ef0a-4d91-8a9b-18d605ee9edb	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
0ee8f5db-4373-4dba-9b49-14d65017873b	faturas	triagem/1767101054555_miranda.pdf	\N	2025-12-30 13:24:14.618586+00	2025-12-30 13:24:14.618586+00	2025-12-30 13:24:14.618586+00	{"eTag": "\\"528dfa3b894e49c1c995cf85a55dc476\\"", "size": 205214, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T13:24:14.600Z", "contentLength": 205214, "httpStatusCode": 200}	d4e2217f-1809-4db5-b8d3-3e831db3ecef	\N	{}	2
ea2d245d-6867-43fd-9b03-3a1448fe1ee8	faturas	triagem/1767101063612_Bizu_forte.pdf	\N	2025-12-30 13:24:23.709523+00	2025-12-30 13:24:23.709523+00	2025-12-30 13:24:23.709523+00	{"eTag": "\\"584f405408eafd20df0454a6c0e730c6\\"", "size": 182289, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T13:24:23.697Z", "contentLength": 182289, "httpStatusCode": 200}	32dccce9-628b-4653-a355-f066ad4ef44c	\N	{}	2
b3824c98-a7d4-4e58-b0ac-b4beae797354	faturas	triagem/1767911047267_kipper.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-08 22:24:07.412313+00	2026-01-08 22:24:07.412313+00	2026-01-08 22:24:07.412313+00	{"eTag": "\\"d50a33487b3b2dc2c4a2323e07a51400\\"", "size": 182444, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-08T22:24:07.372Z", "contentLength": 182444, "httpStatusCode": 200}	e109c5a1-805c-4579-9566-5c16600818f4	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
bd8d19be-b274-444e-9dd1-d2f5e9794f78	faturas	triagem/1767101063792_Cresse.pdf	\N	2025-12-30 13:24:23.859536+00	2025-12-30 13:24:23.859536+00	2025-12-30 13:24:23.859536+00	{"eTag": "\\"ff7a3773725c537fc6cd72ae461a42ac\\"", "size": 182445, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T13:24:23.845Z", "contentLength": 182445, "httpStatusCode": 200}	6411d520-2ade-49ab-9d89-19a0ddb99c78	\N	{}	2
88dc588e-a340-4143-9460-9b48c53114c1	faturas	triagem/1767977548074_kipper.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 16:52:28.190406+00	2026-01-09 16:52:28.190406+00	2026-01-09 16:52:28.190406+00	{"eTag": "\\"d50a33487b3b2dc2c4a2323e07a51400\\"", "size": 182444, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T16:52:28.177Z", "contentLength": 182444, "httpStatusCode": 200}	9682b355-118e-4243-bc17-6c5060bb3d95	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
c7b49da8-7a19-48eb-bb75-ba2a14ba1a1a	faturas	triagem/1767101063908_Francisco_PF.pdf	\N	2025-12-30 13:24:23.981963+00	2025-12-30 13:24:23.981963+00	2025-12-30 13:24:23.981963+00	{"eTag": "\\"45d1f470c389dbac1883204a729d445a\\"", "size": 182677, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T13:24:23.969Z", "contentLength": 182677, "httpStatusCode": 200}	bec5acfd-f946-4345-87a5-4c778baf0690	\N	{}	2
f5827f06-f49d-4433-b5bf-311e98549f7b	faturas	triagem/1767101064043_Francisco_PJ.pdf	\N	2025-12-30 13:24:24.109284+00	2025-12-30 13:24:24.109284+00	2025-12-30 13:24:24.109284+00	{"eTag": "\\"7212cc61d43b0e02ce8e33fba320f071\\"", "size": 182406, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T13:24:24.093Z", "contentLength": 182406, "httpStatusCode": 200}	c96680d4-de0d-472b-8ed1-9343425d5ab8	\N	{}	2
1ae27e1c-8f06-4ac5-98b2-c8f7247a5db2	faturas	triagem/1767101064179_kipper.pdf	\N	2025-12-30 13:24:24.24233+00	2025-12-30 13:24:24.24233+00	2025-12-30 13:24:24.24233+00	{"eTag": "\\"e2747d168f1f3ff39c96bc849429476e\\"", "size": 182063, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T13:24:24.217Z", "contentLength": 182063, "httpStatusCode": 200}	172fd897-f23d-452d-ba08-ceb8ad189bed	\N	{}	2
533bb8ad-8126-4d5f-b0ab-ab7f8690d0c2	faturas	triagem/1767101064357_Landoski.pdf	\N	2025-12-30 13:24:24.404136+00	2025-12-30 13:24:24.404136+00	2025-12-30 13:24:24.404136+00	{"eTag": "\\"9566ad69ccc4bd977831cc78e9689e6a\\"", "size": 182316, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T13:24:24.393Z", "contentLength": 182316, "httpStatusCode": 200}	6accd629-ce3d-4e6c-b2ce-90708a11a038	\N	{}	2
c3ce2731-c98d-423c-875b-2857e8087e73	faturas	triagem/1767101064476_Melo.pdf	\N	2025-12-30 13:24:24.519328+00	2025-12-30 13:24:24.519328+00	2025-12-30 13:24:24.519328+00	{"eTag": "\\"1b2c1a48219816a664fba5d0c6b99f47\\"", "size": 182460, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T13:24:24.509Z", "contentLength": 182460, "httpStatusCode": 200}	b5fa7a44-f718-46d5-b160-e4be902fc1bd	\N	{}	2
c25a2813-f8fa-41f9-96e3-664e7a3a7d8d	faturas	triagem/1767101064586_Menezes.pdf	\N	2025-12-30 13:24:24.657428+00	2025-12-30 13:24:24.657428+00	2025-12-30 13:24:24.657428+00	{"eTag": "\\"f1a11453063ea58e0eb6d2b290acf48a\\"", "size": 182584, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T13:24:24.621Z", "contentLength": 182584, "httpStatusCode": 200}	71904324-0bd7-41e8-9ac1-16b207dd502f	\N	{}	2
1310a21e-160f-4ab1-b79a-a6fe4f3220a0	faturas	triagem/1767101064722_Miranda.pdf	\N	2025-12-30 13:24:24.775187+00	2025-12-30 13:24:24.775187+00	2025-12-30 13:24:24.775187+00	{"eTag": "\\"60aaf831959fc90bf893aa51cc2bb6fd\\"", "size": 182369, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T13:24:24.761Z", "contentLength": 182369, "httpStatusCode": 200}	0a6bbcca-7cc6-4664-a7c0-3c451dc7ae2f	\N	{}	2
9c41f893-ba27-4fe7-8510-d7acd8085c02	faturas	triagem/1767101074580_bizu_forte.pdf	\N	2025-12-30 13:24:34.652996+00	2025-12-30 13:24:34.652996+00	2025-12-30 13:24:34.652996+00	{"eTag": "\\"39267a15782d7e8f91c708c9235b7afd\\"", "size": 182090, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T13:24:34.638Z", "contentLength": 182090, "httpStatusCode": 200}	5a2d4c9b-5586-4bb1-a4d4-f3e25b02759e	\N	{}	2
9033ab67-74c3-4777-8253-0db308469cc1	faturas	triagem/1768054190824_cresse.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 14:09:51.006255+00	2026-01-10 14:09:51.006255+00	2026-01-10 14:09:51.006255+00	{"eTag": "\\"491fb9da933f702de76af94c27160b6d\\"", "size": 182162, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T14:09:50.991Z", "contentLength": 182162, "httpStatusCode": 200}	810eda97-b6f9-4970-bc01-5e321b6dc737	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
a1f22b8c-bb35-4a41-8107-0e857e0e470d	faturas	triagem/1767101074740_cresse.pdf	\N	2025-12-30 13:24:34.798323+00	2025-12-30 13:24:34.798323+00	2025-12-30 13:24:34.798323+00	{"eTag": "\\"8c1955d302e692a9551fbf291c9497fb\\"", "size": 182459, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T13:24:34.786Z", "contentLength": 182459, "httpStatusCode": 200}	69cd40dd-d754-4790-9259-d09379e006fb	\N	{}	2
13e3f022-a247-4a31-89d9-99b1af2ba566	faturas	triagem/1767749288455_kipper.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-07 01:28:08.799339+00	2026-01-07 01:28:08.799339+00	2026-01-07 01:28:08.799339+00	{"eTag": "\\"d50a33487b3b2dc2c4a2323e07a51400\\"", "size": 182444, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-07T01:28:08.771Z", "contentLength": 182444, "httpStatusCode": 200}	120b5dc2-73c8-4b7e-8843-34f8acbffbbb	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
69957022-cf7c-4db7-bcc0-8cea28c2f344	faturas	triagem/1767101074895_francisco_pf.pdf	\N	2025-12-30 13:24:34.958934+00	2025-12-30 13:24:34.958934+00	2025-12-30 13:24:34.958934+00	{"eTag": "\\"120bace29a2f07779ebd3c60cd5702be\\"", "size": 182295, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T13:24:34.946Z", "contentLength": 182295, "httpStatusCode": 200}	7d4b2909-e334-4de3-a91d-ea77d691db65	\N	{}	2
9a25ede6-09d7-4da2-91c8-0bf4f4725a2b	faturas	triagem/1768063630127_cresse.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 16:47:10.219292+00	2026-01-10 16:47:10.219292+00	2026-01-10 16:47:10.219292+00	{"eTag": "\\"491fb9da933f702de76af94c27160b6d\\"", "size": 182162, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T16:47:10.201Z", "contentLength": 182162, "httpStatusCode": 200}	b1613c68-9eab-4373-bec0-7128f4d8d2ec	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
7530475f-c674-406a-9e19-5d7642dac330	faturas	triagem/1767101075020_francisco_pj.pdf	\N	2025-12-30 13:24:35.109023+00	2025-12-30 13:24:35.109023+00	2025-12-30 13:24:35.109023+00	{"eTag": "\\"93686f7da638d4346324e9011a47c156\\"", "size": 182194, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T13:24:35.090Z", "contentLength": 182194, "httpStatusCode": 200}	4932f150-5e6c-4ff4-b3d6-f834d9f76037	\N	{}	2
82f7b562-598d-4bcb-a09d-a433a683fabf	faturas	triagem/1767911310947_kipper.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-08 22:28:31.512526+00	2026-01-08 22:28:31.512526+00	2026-01-08 22:28:31.512526+00	{"eTag": "\\"d50a33487b3b2dc2c4a2323e07a51400\\"", "size": 182444, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-08T22:28:31.464Z", "contentLength": 182444, "httpStatusCode": 200}	c9eaeb77-8dda-4720-a82a-bc1e3cdc9f2f	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
c3c8e2d4-a5f7-40cc-b92e-0c9571be71a9	faturas	triagem/1767101075229_kipper.pdf	\N	2025-12-30 13:24:35.277329+00	2025-12-30 13:24:35.277329+00	2025-12-30 13:24:35.277329+00	{"eTag": "\\"d4a5d0c390137143e33b01b94cbe3b8f\\"", "size": 182094, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T13:24:35.266Z", "contentLength": 182094, "httpStatusCode": 200}	a177523b-d334-47f3-a1c9-dc71338acc19	\N	{}	2
00546ac0-b661-4d82-b421-433681a382ca	faturas	triagem/1767101075369_landoski.pdf	\N	2025-12-30 13:24:35.422435+00	2025-12-30 13:24:35.422435+00	2025-12-30 13:24:35.422435+00	{"eTag": "\\"a1c4862abc1efac0b9714f77265c0359\\"", "size": 182349, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T13:24:35.410Z", "contentLength": 182349, "httpStatusCode": 200}	5647cbf0-4e8c-40be-9e39-8e0eb4c02ca0	\N	{}	2
59bec5e6-01d0-4c4d-9e75-5722e847d6e0	faturas	triagem/1767101075482_melo.pdf	\N	2025-12-30 13:24:35.528797+00	2025-12-30 13:24:35.528797+00	2025-12-30 13:24:35.528797+00	{"eTag": "\\"61de69567cc42f5d5ba95aa81475a902\\"", "size": 182497, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T13:24:35.518Z", "contentLength": 182497, "httpStatusCode": 200}	01476591-4c13-4d8a-9107-005149a6b3e2	\N	{}	2
f85e507b-04ff-4763-82dd-071302950dec	faturas	triagem/1767101075614_menezes.pdf	\N	2025-12-30 13:24:35.664015+00	2025-12-30 13:24:35.664015+00	2025-12-30 13:24:35.664015+00	{"eTag": "\\"680600a2ffe06d2048f281327cf4c4c8\\"", "size": 182469, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T13:24:35.650Z", "contentLength": 182469, "httpStatusCode": 200}	54630a78-ac59-4a86-ab4d-0c601448e632	\N	{}	2
67d7132b-5be3-43eb-8125-895d5f7ff7f6	faturas	triagem/1767101075713_miranda.pdf	\N	2025-12-30 13:24:35.773644+00	2025-12-30 13:24:35.773644+00	2025-12-30 13:24:35.773644+00	{"eTag": "\\"e9ce439872ffb6141d01efe99caae36b\\"", "size": 182063, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T13:24:35.754Z", "contentLength": 182063, "httpStatusCode": 200}	001a5564-8765-48e1-8a63-dced400247c1	\N	{}	2
a8314e86-a5d7-4a04-94fb-44583a0fffdd	faturas	triagem/1767101088046_bizu_forte.pdf	\N	2025-12-30 13:24:48.13939+00	2025-12-30 13:24:48.13939+00	2025-12-30 13:24:48.13939+00	{"eTag": "\\"3b3220970359a9b62a02b95eee281793\\"", "size": 181792, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T13:24:48.123Z", "contentLength": 181792, "httpStatusCode": 200}	3641490c-240d-4989-b55c-baa2807e3a57	\N	{}	2
0dbee231-fe6e-47de-924d-7fce105353bf	faturas	triagem/1767101088198_cresse8.pdf	\N	2025-12-30 13:24:48.249421+00	2025-12-30 13:24:48.249421+00	2025-12-30 13:24:48.249421+00	{"eTag": "\\"95d528b796df06d1d4eb3d154697b962\\"", "size": 182152, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T13:24:48.235Z", "contentLength": 182152, "httpStatusCode": 200}	653fc4c8-9e50-401e-b9f9-ca3ab452cbe4	\N	{}	2
8e35ad5a-6432-4676-84c0-2a4c29cf99e3	faturas	triagem/1767101088319_francisco_pf.pdf	\N	2025-12-30 13:24:48.388206+00	2025-12-30 13:24:48.388206+00	2025-12-30 13:24:48.388206+00	{"eTag": "\\"4349263b5bcd80518ca8a6c59e99fd58\\"", "size": 182128, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T13:24:48.363Z", "contentLength": 182128, "httpStatusCode": 200}	0c4e3a27-5685-4dfa-9b09-1de3105ed201	\N	{}	2
f9ccda96-f7b7-43b0-bbcf-a134193ad7ad	faturas	triagem/1767101088433_francisco_pj.pdf	\N	2025-12-30 13:24:48.493176+00	2025-12-30 13:24:48.493176+00	2025-12-30 13:24:48.493176+00	{"eTag": "\\"d7df6ab420707681b45fa4cbedb17b62\\"", "size": 182072, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T13:24:48.479Z", "contentLength": 182072, "httpStatusCode": 200}	d5a61e22-7c3c-4198-bcf0-48c863f70049	\N	{}	2
e3a0cfbf-2acc-483f-a45a-f28410cbc540	faturas	triagem/1767803574640_kipper.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-07 16:32:55.788724+00	2026-01-07 16:32:55.788724+00	2026-01-07 16:32:55.788724+00	{"eTag": "\\"d50a33487b3b2dc2c4a2323e07a51400\\"", "size": 182444, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-07T16:32:55.673Z", "contentLength": 182444, "httpStatusCode": 200}	ba5cfdfd-7602-4545-976c-1d6c29c9bd51	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
65e97ea2-c70d-4dde-a31c-aba2e8488031	faturas	triagem/1767101088545_kipper.pdf	\N	2025-12-30 13:24:48.592757+00	2025-12-30 13:24:48.592757+00	2025-12-30 13:24:48.592757+00	{"eTag": "\\"46fedcd9b6ea1390adb4779db0fb70d6\\"", "size": 181822, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T13:24:48.579Z", "contentLength": 181822, "httpStatusCode": 200}	b5070b92-3724-47c6-9faf-e18c24489546	\N	{}	2
a45e35d4-7aea-4888-9f68-02e3e0087f85	faturas	triagem/1767101088663_landoski.pdf	\N	2025-12-30 13:24:48.719627+00	2025-12-30 13:24:48.719627+00	2025-12-30 13:24:48.719627+00	{"eTag": "\\"6a3468747316c627dbadc71e3d68d1a2\\"", "size": 182084, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T13:24:48.703Z", "contentLength": 182084, "httpStatusCode": 200}	0504e073-76ec-4c18-9af0-d6bbe92f2ea6	\N	{}	2
1160311d-5c97-42a2-8c52-faa04f7e711c	faturas	triagem/1767911418661_kipper.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-08 22:30:18.816369+00	2026-01-08 22:30:18.816369+00	2026-01-08 22:30:18.816369+00	{"eTag": "\\"d50a33487b3b2dc2c4a2323e07a51400\\"", "size": 182444, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-08T22:30:18.800Z", "contentLength": 182444, "httpStatusCode": 200}	fd7c7f02-a411-41c1-9a91-69eeadd433bf	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
ccd88f11-ce86-40f5-952b-9dad1793f016	faturas	triagem/1767101089011_melo.pdf	\N	2025-12-30 13:24:49.213865+00	2025-12-30 13:24:49.213865+00	2025-12-30 13:24:49.213865+00	{"eTag": "\\"2525b931d1f03ea5e1904f5cd0201d51\\"", "size": 182106, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T13:24:49.167Z", "contentLength": 182106, "httpStatusCode": 200}	8d552db8-f28c-4cd7-83ce-d4e8338a93c8	\N	{}	2
6441879d-3f4c-4087-9497-3b332026ed3d	faturas	triagem/1767980564004_kipper.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 17:42:44.752178+00	2026-01-09 17:42:44.752178+00	2026-01-09 17:42:44.752178+00	{"eTag": "\\"d50a33487b3b2dc2c4a2323e07a51400\\"", "size": 182444, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T17:42:44.665Z", "contentLength": 182444, "httpStatusCode": 200}	4adb9bd4-695b-4c5e-b80c-030461256abc	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
c6d36a58-c838-4929-8a18-11aaffe5026f	faturas	triagem/1767101089342_miranda.pdf	\N	2025-12-30 13:24:49.497727+00	2025-12-30 13:24:49.497727+00	2025-12-30 13:24:49.497727+00	{"eTag": "\\"97cdf339941fed2c9bff31b86f9737da\\"", "size": 181967, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T13:24:49.483Z", "contentLength": 181967, "httpStatusCode": 200}	de657719-ff34-4c0e-8034-4823b23263b7	\N	{}	2
8fdcff4f-3e2b-4bfb-8052-cd1446bf77c5	faturas	triagem/1767986118921_kipper.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 19:15:19.834602+00	2026-01-09 19:15:19.834602+00	2026-01-09 19:15:19.834602+00	{"eTag": "\\"d50a33487b3b2dc2c4a2323e07a51400\\"", "size": 182444, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T19:15:19.739Z", "contentLength": 182444, "httpStatusCode": 200}	0fa3c2ec-41a6-4183-b28f-1d232313a4a6	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
8695d506-b78f-4fe8-8e1f-1f4330e16d25	faturas	triagem/1767101098617_bizu_forte.pdf	\N	2025-12-30 13:24:58.693264+00	2025-12-30 13:24:58.693264+00	2025-12-30 13:24:58.693264+00	{"eTag": "\\"9717777d08813969090363d775eaa88d\\"", "size": 181829, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T13:24:58.684Z", "contentLength": 181829, "httpStatusCode": 200}	247e0b6c-546f-49c7-8063-b9e1fbf575e5	\N	{}	2
67fd8c6a-84e4-48cd-b8e8-05422d0b6f4d	faturas	triagem/1767101098747_cresse.pdf	\N	2025-12-30 13:24:58.792997+00	2025-12-30 13:24:58.792997+00	2025-12-30 13:24:58.792997+00	{"eTag": "\\"491fb9da933f702de76af94c27160b6d\\"", "size": 182162, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T13:24:58.784Z", "contentLength": 182162, "httpStatusCode": 200}	d0535ad8-6f2c-4803-bbf8-624d6b484eb2	\N	{}	2
c39f3c1b-22a9-4961-a488-90b15ba90faf	faturas	triagem/1767101098833_francisco_pf.pdf	\N	2025-12-30 13:24:58.88516+00	2025-12-30 13:24:58.88516+00	2025-12-30 13:24:58.88516+00	{"eTag": "\\"098bd0333a1f66480513bf13ea6bafe6\\"", "size": 182047, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T13:24:58.872Z", "contentLength": 182047, "httpStatusCode": 200}	6164868c-d7e9-48a2-8d74-51aba2ca0d9d	\N	{}	2
9389bdf2-30aa-4645-95c5-138acb787b03	faturas	triagem/1767101098927_francisco_pj.pdf	\N	2025-12-30 13:24:58.974427+00	2025-12-30 13:24:58.974427+00	2025-12-30 13:24:58.974427+00	{"eTag": "\\"308d4af5f58e93b3e142f47d5feccef6\\"", "size": 181898, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T13:24:58.960Z", "contentLength": 181898, "httpStatusCode": 200}	f5c12fc1-5dd8-4b41-8ffb-bddd0b698c93	\N	{}	2
1568be5c-74e1-4fb7-a162-0f5f65a7b752	faturas	triagem/1767101099017_kipper.pdf	\N	2025-12-30 13:24:59.061776+00	2025-12-30 13:24:59.061776+00	2025-12-30 13:24:59.061776+00	{"eTag": "\\"351aaddec06d24adfd09c6d83373a280\\"", "size": 181832, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T13:24:59.048Z", "contentLength": 181832, "httpStatusCode": 200}	e95d3bdd-9d75-4056-bede-48701a1868d7	\N	{}	2
3417b508-a2f1-40ac-a4a1-5ca6318b0019	faturas	triagem/1767101099188_landoski.pdf	\N	2025-12-30 13:24:59.258977+00	2025-12-30 13:24:59.258977+00	2025-12-30 13:24:59.258977+00	{"eTag": "\\"d0755db54b5b76309a89ae9360e7645f\\"", "size": 182089, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T13:24:59.244Z", "contentLength": 182089, "httpStatusCode": 200}	615e7a2d-dbc7-4948-88a0-961caeb2f5fe	\N	{}	2
7d39d921-c9d6-4d71-adcc-36e80fd0f6eb	faturas	triagem/1767101099308_miranda.pdf	\N	2025-12-30 13:24:59.355047+00	2025-12-30 13:24:59.355047+00	2025-12-30 13:24:59.355047+00	{"eTag": "\\"35803a60011d12fcb77acff40dbb2e51\\"", "size": 182003, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T13:24:59.344Z", "contentLength": 182003, "httpStatusCode": 200}	b93b2f84-b622-4ed6-ba0a-40283c6261bb	\N	{}	2
4ac98c7b-3fb7-4e9c-afbc-48fc857ac5f4	faturas	triagem/1768054753754_cresse.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 14:19:13.939337+00	2026-01-10 14:19:13.939337+00	2026-01-10 14:19:13.939337+00	{"eTag": "\\"491fb9da933f702de76af94c27160b6d\\"", "size": 182162, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T14:19:13.920Z", "contentLength": 182162, "httpStatusCode": 200}	909c30df-5a7d-4141-978f-b3dd099dd71e	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
e650138b-b344-4382-ac18-ba6141d7b5dc	faturas	triagem/1767101110617_bizu_forte.pdf	\N	2025-12-30 13:25:10.730043+00	2025-12-30 13:25:10.730043+00	2025-12-30 13:25:10.730043+00	{"eTag": "\\"ebc017e8deb33a4aa669893a10930ef8\\"", "size": 177605, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T13:25:10.708Z", "contentLength": 177605, "httpStatusCode": 200}	461b5ec6-fbf7-473f-b7a1-7e1ed914fa65	\N	{}	2
8db6b324-ce23-4ca5-952c-95560b3d2b22	faturas	triagem/1767804162442_landoski.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-07 16:42:42.752394+00	2026-01-07 16:42:42.752394+00	2026-01-07 16:42:42.752394+00	{"eTag": "\\"ea7da9655b547164a7c360846d867f32\\"", "size": 182608, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-07T16:42:42.721Z", "contentLength": 182608, "httpStatusCode": 200}	f3f219f5-11db-4b70-8050-d18091b7504c	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
0c5a8a14-660d-4242-8aa4-3c0cc72c3af3	faturas	triagem/1767101110811_cresse.pdf	\N	2025-12-30 13:25:10.863118+00	2025-12-30 13:25:10.863118+00	2025-12-30 13:25:10.863118+00	{"eTag": "\\"29d2ae248666696fe64dc89f16093ac4\\"", "size": 177637, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T13:25:10.852Z", "contentLength": 177637, "httpStatusCode": 200}	78209ae4-2a0b-47c3-adb9-6ede55351b97	\N	{}	2
96e4741d-b20b-40b6-9c46-168c11952677	faturas	triagem/1768063988373_cresse.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 16:53:08.462361+00	2026-01-10 16:53:08.462361+00	2026-01-10 16:53:08.462361+00	{"eTag": "\\"491fb9da933f702de76af94c27160b6d\\"", "size": 182162, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T16:53:08.451Z", "contentLength": 182162, "httpStatusCode": 200}	b4217094-630c-4687-908f-fd6825987f73	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
af9eda63-8c66-465f-b041-10d300bc45c6	faturas	triagem/1767101110902_francisco_pf.pdf	\N	2025-12-30 13:25:10.974287+00	2025-12-30 13:25:10.974287+00	2025-12-30 13:25:10.974287+00	{"eTag": "\\"16c79c4fc123f2c2e8fe9b9e7fc7d55f\\"", "size": 177570, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T13:25:10.960Z", "contentLength": 177570, "httpStatusCode": 200}	83e1b5cd-14f6-4618-a8a3-c5d25d70bf87	\N	{}	2
dad9114d-7c40-4cfd-a1f3-51e923b89bcc	faturas	triagem/1767914022673_kipper.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-08 23:13:52.435442+00	2026-01-08 23:13:52.435442+00	2026-01-08 23:13:52.435442+00	{"eTag": "\\"d50a33487b3b2dc2c4a2323e07a51400\\"", "size": 182444, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-08T23:13:51.933Z", "contentLength": 182444, "httpStatusCode": 200}	570fdff0-6fa0-476e-96c1-21c5a2763d1e	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
db830165-dd86-490f-ad7b-251be835c585	faturas	triagem/1767101111036_francisco_pj.pdf	\N	2025-12-30 13:25:11.083794+00	2025-12-30 13:25:11.083794+00	2025-12-30 13:25:11.083794+00	{"eTag": "\\"60dc9b85c02a7c431e60370fb1d4d643\\"", "size": 177445, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T13:25:11.072Z", "contentLength": 177445, "httpStatusCode": 200}	ce9bdce5-9f81-42a2-b156-c679c396b0cc	\N	{}	2
7d836cda-e3a7-4855-b988-1f4d3c9b7a1e	faturas	triagem/1767101111142_kipper.pdf	\N	2025-12-30 13:25:11.190278+00	2025-12-30 13:25:11.190278+00	2025-12-30 13:25:11.190278+00	{"eTag": "\\"59b086cb2a5b390cc6f2813fbb9f7bd5\\"", "size": 177580, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T13:25:11.176Z", "contentLength": 177580, "httpStatusCode": 200}	80f748cb-f37d-400f-b357-81dc4b584372	\N	{}	2
165dcaa0-5748-4ed9-8cea-ec52cb203e57	faturas	triagem/1767101111236_landoski.pdf	\N	2025-12-30 13:25:11.300264+00	2025-12-30 13:25:11.300264+00	2025-12-30 13:25:11.300264+00	{"eTag": "\\"b20a2356ff8deb6bdc68a6d4f574a2ba\\"", "size": 177583, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T13:25:11.284Z", "contentLength": 177583, "httpStatusCode": 200}	9143d683-6fdc-45f0-89e5-c9c18f4e2a48	\N	{}	2
404860c5-d219-4490-9f5a-e95cd1d24475	faturas	triagem/1767101111378_miranda.pdf	\N	2025-12-30 13:25:11.439974+00	2025-12-30 13:25:11.439974+00	2025-12-30 13:25:11.439974+00	{"eTag": "\\"a34c966d9bf7b1706412b03f2f6888cd\\"", "size": 177473, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T13:25:11.420Z", "contentLength": 177473, "httpStatusCode": 200}	d63e4c06-64ae-44f6-8b85-ab276e8d059c	\N	{}	2
52462777-6a0b-46cb-a7f9-254fea2db3a2	faturas	triagem/1767101123940_bizu_forte.pdf	\N	2025-12-30 13:25:24.008658+00	2025-12-30 13:25:24.008658+00	2025-12-30 13:25:24.008658+00	{"eTag": "\\"80853473f4a5114d4f2a7436965de0f4\\"", "size": 177404, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T13:25:23.997Z", "contentLength": 177404, "httpStatusCode": 200}	dbf8d8d1-c854-4b07-9c4a-c208596f4204	\N	{}	2
8f2d0a7a-d071-470c-8cde-ec9c8f5d75f2	faturas	triagem/1767101124064_cresse.pdf	\N	2025-12-30 13:25:24.11911+00	2025-12-30 13:25:24.11911+00	2025-12-30 13:25:24.11911+00	{"eTag": "\\"142cdbcd4c36f5eb29c55d12e9ad9e48\\"", "size": 177521, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T13:25:24.105Z", "contentLength": 177521, "httpStatusCode": 200}	8e8c1f3f-4b23-40fa-8025-22259fc37e8e	\N	{}	2
5648efb2-6be0-4d40-af40-2ad43b781e33	faturas	triagem/1767101124161_francisco_pf.pdf	\N	2025-12-30 13:25:24.223957+00	2025-12-30 13:25:24.223957+00	2025-12-30 13:25:24.223957+00	{"eTag": "\\"13e291ade247632417985f791d8be182\\"", "size": 177271, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T13:25:24.205Z", "contentLength": 177271, "httpStatusCode": 200}	e34b7547-7fe6-46ed-be65-2d2a26fc66a3	\N	{}	2
774aa935-512d-49f7-852d-8fe5a546679e	faturas	triagem/1767101124261_francisco_pj.pdf	\N	2025-12-30 13:25:24.303092+00	2025-12-30 13:25:24.303092+00	2025-12-30 13:25:24.303092+00	{"eTag": "\\"b8e9a5bf694458dfbd596461e70264c5\\"", "size": 177111, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T13:25:24.293Z", "contentLength": 177111, "httpStatusCode": 200}	6dec5fe9-622f-43ed-8856-57e48870f4ad	\N	{}	2
f3895540-3861-4735-be28-26bfd248aa7e	faturas	triagem/1767101124336_kipper.pdf	\N	2025-12-30 13:25:24.395829+00	2025-12-30 13:25:24.395829+00	2025-12-30 13:25:24.395829+00	{"eTag": "\\"f5f8a02ff4517e052008e1abf39dadbd\\"", "size": 177269, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T13:25:24.385Z", "contentLength": 177269, "httpStatusCode": 200}	0e0b996d-5e40-4ff1-9206-be6700711195	\N	{}	2
f0f45455-5b63-4d58-a176-19c80c66b37d	faturas	triagem/1767101124446_landoski.pdf	\N	2025-12-30 13:25:24.537868+00	2025-12-30 13:25:24.537868+00	2025-12-30 13:25:24.537868+00	{"eTag": "\\"af9741746f03a59d4e8352db926befef\\"", "size": 177432, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-12-30T13:25:24.509Z", "contentLength": 177432, "httpStatusCode": 200}	a40c6eee-8d5f-4c57-b9c5-d2c763a6f42e	\N	{}	2
1af73a78-a631-4a16-8633-edad1bc533f5	faturas	triagem/1767804941888_kipper.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-07 16:55:43.45346+00	2026-01-07 16:55:43.45346+00	2026-01-07 16:55:43.45346+00	{"eTag": "\\"d50a33487b3b2dc2c4a2323e07a51400\\"", "size": 182444, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-07T16:55:43.268Z", "contentLength": 182444, "httpStatusCode": 200}	1693e6c1-3302-4aaa-a97a-0697860f0eff	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
2e63bfd7-a3a3-4637-8908-57a51f8fba07	faturas	triagem/1767980957353_kipper.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 17:49:17.795877+00	2026-01-09 17:49:17.795877+00	2026-01-09 17:49:17.795877+00	{"eTag": "\\"d50a33487b3b2dc2c4a2323e07a51400\\"", "size": 182444, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T17:49:17.750Z", "contentLength": 182444, "httpStatusCode": 200}	24a1bcbd-231c-4991-acd1-c79bd576a7d2	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
8d0a2290-8714-440f-8d3e-631b23270c84	faturas	triagem/1767986270564_kipper.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 19:17:50.823113+00	2026-01-09 19:17:50.823113+00	2026-01-09 19:17:50.823113+00	{"eTag": "\\"d50a33487b3b2dc2c4a2323e07a51400\\"", "size": 182444, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T19:17:50.753Z", "contentLength": 182444, "httpStatusCode": 200}	3a5cc57f-46c3-4fd9-bdc2-d3e9e76ef57a	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
ac956c34-eb88-4172-86cb-d7aaabc0cfcf	faturas	triagem/1767986499027_kipper.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 19:21:39.128013+00	2026-01-09 19:21:39.128013+00	2026-01-09 19:21:39.128013+00	{"eTag": "\\"d50a33487b3b2dc2c4a2323e07a51400\\"", "size": 182444, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T19:21:39.117Z", "contentLength": 182444, "httpStatusCode": 200}	6261e1f3-e270-46f0-af27-70029d79de58	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
766f290a-6222-44e4-b10d-55df74f5b631	faturas	triagem/1768055013168_cresse.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 14:23:33.260671+00	2026-01-10 14:23:33.260671+00	2026-01-10 14:23:33.260671+00	{"eTag": "\\"491fb9da933f702de76af94c27160b6d\\"", "size": 182162, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T14:23:33.249Z", "contentLength": 182162, "httpStatusCode": 200}	7661e912-7fee-41ab-8b10-9984ff53c9ae	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
073f2e49-3319-4503-85d1-fd9ac06894d1	faturas	triagem/1767987604724_kipper.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 19:40:04.80487+00	2026-01-09 19:40:04.80487+00	2026-01-09 19:40:04.80487+00	{"eTag": "\\"d50a33487b3b2dc2c4a2323e07a51400\\"", "size": 182444, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T19:40:04.793Z", "contentLength": 182444, "httpStatusCode": 200}	3977d2a8-042f-48ab-b1cf-0b007057cdef	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
4c037850-3d43-43cc-b629-d7d8466fcabc	faturas	triagem/1767987929056_kipper.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 19:45:29.149274+00	2026-01-09 19:45:29.149274+00	2026-01-09 19:45:29.149274+00	{"eTag": "\\"d50a33487b3b2dc2c4a2323e07a51400\\"", "size": 182444, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T19:45:29.137Z", "contentLength": 182444, "httpStatusCode": 200}	4a0b72f4-4d57-4852-a708-ddfd59a77068	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
653966dc-56f6-40d6-a79e-7fd3e30df7a6	faturas	triagem/1768058056232_cresse.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 15:14:17.536829+00	2026-01-10 15:14:17.536829+00	2026-01-10 15:14:17.536829+00	{"eTag": "\\"491fb9da933f702de76af94c27160b6d\\"", "size": 182162, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T15:14:17.338Z", "contentLength": 182162, "httpStatusCode": 200}	3b4b252b-d402-4fe0-a9f2-9d5f982f4858	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
7cdb2494-d84e-4321-8172-2440a1ee41f1	faturas	triagem/1767990092960_landoski.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 20:21:33.059493+00	2026-01-09 20:21:33.059493+00	2026-01-09 20:21:33.059493+00	{"eTag": "\\"ea7da9655b547164a7c360846d867f32\\"", "size": 182608, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T20:21:33.048Z", "contentLength": 182608, "httpStatusCode": 200}	68547d3f-1876-4e12-b90a-ae54177fd5a2	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
603c4d28-1f00-441d-8e4a-3e80efa1d987	faturas	triagem/1767990550245_bizuforte.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 20:29:10.368376+00	2026-01-09 20:29:10.368376+00	2026-01-09 20:29:10.368376+00	{"eTag": "\\"be4f815107538aa68badcad6a3cf0c84\\"", "size": 182627, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T20:29:10.353Z", "contentLength": 182627, "httpStatusCode": 200}	a4f34b94-9768-4b45-a363-4ba8de16d45b	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
7a9246bd-d1a0-4076-9265-420913010e61	faturas	triagem/1767990550462_cresse.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 20:29:10.511208+00	2026-01-09 20:29:10.511208+00	2026-01-09 20:29:10.511208+00	{"eTag": "\\"7611906e10c4ba00005fdbb8ebf88b34\\"", "size": 182580, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T20:29:10.493Z", "contentLength": 182580, "httpStatusCode": 200}	58fa1f53-e6d6-4d74-8206-2ffae8b04b76	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
9a51e8e5-b914-4493-802b-0925d84d6a24	faturas	triagem/1767990550593_francisco_pf.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 20:29:10.644235+00	2026-01-09 20:29:10.644235+00	2026-01-09 20:29:10.644235+00	{"eTag": "\\"3f7478a8cca67883333b1c98656ef8ad\\"", "size": 182687, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T20:29:10.625Z", "contentLength": 182687, "httpStatusCode": 200}	fb378f2e-714c-44b6-ab92-8d33252d0579	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
09d9bd52-e194-42ee-81c6-7304a47787cf	faturas	triagem/1767990550681_francisco_pj.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 20:29:10.774847+00	2026-01-09 20:29:10.774847+00	2026-01-09 20:29:10.774847+00	{"eTag": "\\"3fd467f8573bb1eb1e73ccc58619e417\\"", "size": 182504, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T20:29:10.749Z", "contentLength": 182504, "httpStatusCode": 200}	340a437e-dd0c-4e27-b601-9900bab81f04	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
71bbfae0-72db-4593-9757-baf1ca2fe4aa	faturas	triagem/1768055363843_cresse.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 14:29:23.940063+00	2026-01-10 14:29:23.940063+00	2026-01-10 14:29:23.940063+00	{"eTag": "\\"491fb9da933f702de76af94c27160b6d\\"", "size": 182162, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T14:29:23.927Z", "contentLength": 182162, "httpStatusCode": 200}	2c171aeb-dc7c-4736-8237-87699bea9078	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
b08298b9-c965-41ac-b228-345c4f5205d7	faturas	triagem/1767990550837_melo.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 20:29:10.952425+00	2026-01-09 20:29:10.952425+00	2026-01-09 20:29:10.952425+00	{"eTag": "\\"486cd01942727cd674a35ff3f297b19f\\"", "size": 182615, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T20:29:10.925Z", "contentLength": 182615, "httpStatusCode": 200}	6b9a5863-81c6-4227-9efb-16f5f9f55654	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
f34df752-5b3f-433d-a874-5a06b6c155f4	faturas	triagem/1767990551021_menezes.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 20:29:11.062098+00	2026-01-09 20:29:11.062098+00	2026-01-09 20:29:11.062098+00	{"eTag": "\\"bdfd9eeb62bb86bda36b1d77a9c814e5\\"", "size": 182648, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T20:29:11.049Z", "contentLength": 182648, "httpStatusCode": 200}	0397b778-9550-4d28-831a-58f45c73f5a1	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
cb74f408-115e-4b7e-9022-cb09b030456b	faturas	triagem/1768058203579_cresse.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 15:16:44.449563+00	2026-01-10 15:16:44.449563+00	2026-01-10 15:16:44.449563+00	{"eTag": "\\"491fb9da933f702de76af94c27160b6d\\"", "size": 182162, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T15:16:44.373Z", "contentLength": 182162, "httpStatusCode": 200}	e25031ac-86cf-4bcc-b1e4-dfb97dbda763	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
7be61c4c-1591-4bad-83ed-bd1a3a0c7658	faturas	triagem/1767990551114_miranda.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 20:29:11.159302+00	2026-01-09 20:29:11.159302+00	2026-01-09 20:29:11.159302+00	{"eTag": "\\"e5336439e2f0961d9572fcc851fcbac9\\"", "size": 182473, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T20:29:11.145Z", "contentLength": 182473, "httpStatusCode": 200}	4d3ccf5b-c04d-4ab7-ac9c-b617723bfac3	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
4fab9fa8-4f60-43a6-9f4e-7ab5a5e9777e	faturas	triagem/1768064975387_cresse.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 17:09:35.552756+00	2026-01-10 17:09:35.552756+00	2026-01-10 17:09:35.552756+00	{"eTag": "\\"491fb9da933f702de76af94c27160b6d\\"", "size": 182162, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T17:09:35.543Z", "contentLength": 182162, "httpStatusCode": 200}	43b046df-3439-4f55-8db3-e15cb3933711	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
d1614dcb-1756-457e-ad8a-ebbad41783bb	faturas	triagem/1767990644561_menezes.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 20:30:44.662499+00	2026-01-09 20:30:44.662499+00	2026-01-09 20:30:44.662499+00	{"eTag": "\\"bdfd9eeb62bb86bda36b1d77a9c814e5\\"", "size": 182648, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T20:30:44.651Z", "contentLength": 182648, "httpStatusCode": 200}	201655b0-c891-4926-a078-df51e7766701	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
e0e5106e-7b4a-447d-99e8-16236b5299d6	faturas	triagem/1768067309609_cresse.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 17:48:29.842273+00	2026-01-10 17:48:29.842273+00	2026-01-10 17:48:29.842273+00	{"eTag": "\\"7611906e10c4ba00005fdbb8ebf88b34\\"", "size": 182580, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T17:48:29.819Z", "contentLength": 182580, "httpStatusCode": 200}	19fc67e3-ac44-4775-83f8-38ba4e300b35	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
a33b7b6f-534c-4b8b-b812-1f2d8d5f2047	faturas	triagem/1767990959999_Bizu_forte.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 20:36:00.094172+00	2026-01-09 20:36:00.094172+00	2026-01-09 20:36:00.094172+00	{"eTag": "\\"584f405408eafd20df0454a6c0e730c6\\"", "size": 182289, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T20:36:00.085Z", "contentLength": 182289, "httpStatusCode": 200}	afb89cc2-bb13-4458-965f-19832f71a72f	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
25f30dd0-167b-415b-b5d7-b8f25a84fbe5	faturas	triagem/1767990960180_Cresse.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 20:36:00.231567+00	2026-01-09 20:36:00.231567+00	2026-01-09 20:36:00.231567+00	{"eTag": "\\"ff7a3773725c537fc6cd72ae461a42ac\\"", "size": 182445, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T20:36:00.221Z", "contentLength": 182445, "httpStatusCode": 200}	9b6aa0f3-5cf3-440e-a477-73ea04c4f704	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
f7405af6-581f-4480-bf22-12fe27c0baca	faturas	triagem/1767990960310_Francisco_PF.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 20:36:00.353179+00	2026-01-09 20:36:00.353179+00	2026-01-09 20:36:00.353179+00	{"eTag": "\\"45d1f470c389dbac1883204a729d445a\\"", "size": 182677, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T20:36:00.341Z", "contentLength": 182677, "httpStatusCode": 200}	ccd4a414-9e6e-4673-bb9a-04e22e7594de	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
fa6936c8-7236-448a-98a6-62327be1669c	faturas	triagem/1767990960470_Francisco_PJ.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 20:36:00.54003+00	2026-01-09 20:36:00.54003+00	2026-01-09 20:36:00.54003+00	{"eTag": "\\"7212cc61d43b0e02ce8e33fba320f071\\"", "size": 182406, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T20:36:00.517Z", "contentLength": 182406, "httpStatusCode": 200}	798d9658-8807-4041-b3f1-93992eb46820	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
cd2ab9f3-82bf-4e12-9a01-ebeffc1f4037	faturas	triagem/1767990960601_kipper.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 20:36:00.682929+00	2026-01-09 20:36:00.682929+00	2026-01-09 20:36:00.682929+00	{"eTag": "\\"e2747d168f1f3ff39c96bc849429476e\\"", "size": 182063, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T20:36:00.645Z", "contentLength": 182063, "httpStatusCode": 200}	e9e9754e-fc9c-4c3e-81cb-752531fdc013	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
2c3bccf1-b58f-43ae-9431-2a84934c7050	faturas	triagem/1767990960737_Landoski.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 20:36:00.798021+00	2026-01-09 20:36:00.798021+00	2026-01-09 20:36:00.798021+00	{"eTag": "\\"9566ad69ccc4bd977831cc78e9689e6a\\"", "size": 182316, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T20:36:00.781Z", "contentLength": 182316, "httpStatusCode": 200}	db24ca73-eb87-40ee-be81-a117093617fe	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
d5d326cb-569b-4e96-9e6f-e785292da845	faturas	triagem/1767990960850_Melo.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 20:36:00.898356+00	2026-01-09 20:36:00.898356+00	2026-01-09 20:36:00.898356+00	{"eTag": "\\"1b2c1a48219816a664fba5d0c6b99f47\\"", "size": 182460, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T20:36:00.885Z", "contentLength": 182460, "httpStatusCode": 200}	26aeb1ae-80f3-4153-b6a6-4d574c5207e0	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
1d42ac48-01ce-4629-b17e-08006331b5e0	faturas	triagem/1768055570352_cresse.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 14:32:50.512764+00	2026-01-10 14:32:50.512764+00	2026-01-10 14:32:50.512764+00	{"eTag": "\\"491fb9da933f702de76af94c27160b6d\\"", "size": 182162, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T14:32:50.501Z", "contentLength": 182162, "httpStatusCode": 200}	585736eb-4b7d-4edf-9581-6ede18d056d4	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
1118adcb-67d9-4281-8363-762841fb2396	faturas	triagem/1767990960938_Menezes.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 20:36:00.984229+00	2026-01-09 20:36:00.984229+00	2026-01-09 20:36:00.984229+00	{"eTag": "\\"f1a11453063ea58e0eb6d2b290acf48a\\"", "size": 182584, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T20:36:00.973Z", "contentLength": 182584, "httpStatusCode": 200}	395f02a8-e65e-46b5-9400-d16de7aebeb1	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
de79d5d3-d603-4978-8674-440c95a91499	faturas	triagem/1767990961036_Miranda.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 20:36:01.100323+00	2026-01-09 20:36:01.100323+00	2026-01-09 20:36:01.100323+00	{"eTag": "\\"60aaf831959fc90bf893aa51cc2bb6fd\\"", "size": 182369, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T20:36:01.077Z", "contentLength": 182369, "httpStatusCode": 200}	a49a7034-5d25-4fb5-9f03-511ffb9d463d	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
3627d1ac-a69c-42f9-a926-0fc5618e1eb9	faturas	triagem/1768058347303_cresse.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 15:19:08.016355+00	2026-01-10 15:19:08.016355+00	2026-01-10 15:19:08.016355+00	{"eTag": "\\"491fb9da933f702de76af94c27160b6d\\"", "size": 182162, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T15:19:07.958Z", "contentLength": 182162, "httpStatusCode": 200}	664574a2-9a37-4b5b-9c2c-dfe3f19949f5	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
9e2dde1e-764a-422f-a375-0f230b8c3784	faturas	triagem/1767991230725_bizu_forte.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 20:40:30.888702+00	2026-01-09 20:40:30.888702+00	2026-01-09 20:40:30.888702+00	{"eTag": "\\"b4179a0429eb4108ecc909294cf142c1\\"", "size": 182348, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T20:40:30.876Z", "contentLength": 182348, "httpStatusCode": 200}	a3cd4094-6d2c-40b8-9319-aa51af5cbb5a	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
e4e79ad6-6402-4fd5-99ff-49a5f7a44d90	faturas	triagem/1767991230986_cresse.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 20:40:31.030199+00	2026-01-09 20:40:31.030199+00	2026-01-09 20:40:31.030199+00	{"eTag": "\\"ee00ca7b92501f1a96ede32bfb66134f\\"", "size": 182549, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T20:40:31.020Z", "contentLength": 182549, "httpStatusCode": 200}	3f4bd65a-3267-4922-a057-616ce3697667	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
288b6fd8-0d77-4d3b-994a-204570c2f38b	faturas	triagem/1768065596046_cresse.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 17:19:56.467074+00	2026-01-10 17:19:56.467074+00	2026-01-10 17:19:56.467074+00	{"eTag": "\\"491fb9da933f702de76af94c27160b6d\\"", "size": 182162, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T17:19:56.431Z", "contentLength": 182162, "httpStatusCode": 200}	8d3f9cd6-1e40-4ea8-bc66-18c24c844228	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
909c9698-3d55-4178-aaa4-8c23bc3c123b	faturas	triagem/1767991231110_francisco_pf.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 20:40:31.151742+00	2026-01-09 20:40:31.151742+00	2026-01-09 20:40:31.151742+00	{"eTag": "\\"db66a1639b01a813fcb05b6d6816b076\\"", "size": 182321, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T20:40:31.140Z", "contentLength": 182321, "httpStatusCode": 200}	73c569a0-d019-42ba-b19f-e9b39a32e4dc	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
4707f53d-0cb2-4495-9e55-ba59ac46e852	faturas	triagem/1767991231255_francisco_pj.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 20:40:31.322241+00	2026-01-09 20:40:31.322241+00	2026-01-09 20:40:31.322241+00	{"eTag": "\\"7e183743c917bbcfb1a23bad776cdb71\\"", "size": 182419, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T20:40:31.304Z", "contentLength": 182419, "httpStatusCode": 200}	aeaf63c1-ca0d-434a-92cb-2b2597ac8809	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
c65205bb-fcc5-4061-a2e9-0731884b88e9	faturas	triagem/1767991231371_kipper.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 20:40:31.410448+00	2026-01-09 20:40:31.410448+00	2026-01-09 20:40:31.410448+00	{"eTag": "\\"40dbaee056f5dbbebe9b9865367ffbbd\\"", "size": 182118, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T20:40:31.396Z", "contentLength": 182118, "httpStatusCode": 200}	0fed643a-eef3-4d1a-85ee-d6774551645b	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
067d12ab-4f0b-44b3-b771-3f1f1be2d21d	faturas	triagem/1767991231452_landoski.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 20:40:31.491466+00	2026-01-09 20:40:31.491466+00	2026-01-09 20:40:31.491466+00	{"eTag": "\\"1fdf68f0c7c96f11e6c85f1e810c73be\\"", "size": 182371, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T20:40:31.480Z", "contentLength": 182371, "httpStatusCode": 200}	c355cb16-f410-4e9a-a2dd-d58da6de4f56	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
a9d06495-fe90-451f-ad40-854fb60117cf	faturas	triagem/1767991231529_melo.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 20:40:31.572097+00	2026-01-09 20:40:31.572097+00	2026-01-09 20:40:31.572097+00	{"eTag": "\\"bb34b0d2f6d71ccf15ef257f4615e75c\\"", "size": 182430, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T20:40:31.564Z", "contentLength": 182430, "httpStatusCode": 200}	6b30a340-4042-49ce-8400-4684bb7ff0f8	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
ba60afb5-aa08-4775-b225-3b8be10b9595	faturas	triagem/1767991231608_menezes.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 20:40:31.646024+00	2026-01-09 20:40:31.646024+00	2026-01-09 20:40:31.646024+00	{"eTag": "\\"e9854b123bae27dba707709c56f7443c\\"", "size": 182392, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T20:40:31.636Z", "contentLength": 182392, "httpStatusCode": 200}	b1ac265f-7301-4028-8f88-1f44f20df665	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
58d77958-c96d-46b4-baec-263be31f6adf	faturas	triagem/1768058622041_cresse.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 15:23:42.135963+00	2026-01-10 15:23:42.135963+00	2026-01-10 15:23:42.135963+00	{"eTag": "\\"491fb9da933f702de76af94c27160b6d\\"", "size": 182162, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T15:23:42.121Z", "contentLength": 182162, "httpStatusCode": 200}	3f30778c-2492-4be8-9a03-9c2a3a0a20d7	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
84ff547f-1a43-45d4-bd81-7b3870bb8448	faturas	triagem/1767991231682_miranda.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 20:40:31.717366+00	2026-01-09 20:40:31.717366+00	2026-01-09 20:40:31.717366+00	{"eTag": "\\"528dfa3b894e49c1c995cf85a55dc476\\"", "size": 205214, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T20:40:31.708Z", "contentLength": 205214, "httpStatusCode": 200}	7a41fd84-4661-4808-886f-3f4bfcbc7919	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
3a7053ec-30e3-47fc-af53-f44297aa18c7	faturas	triagem/1767991347762_bizu_forte.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 20:42:27.857004+00	2026-01-09 20:42:27.857004+00	2026-01-09 20:42:27.857004+00	{"eTag": "\\"39267a15782d7e8f91c708c9235b7afd\\"", "size": 182090, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T20:42:27.843Z", "contentLength": 182090, "httpStatusCode": 200}	754b5a48-19c9-4874-815f-f019066892ef	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
6df0e469-46d3-4a89-9589-0d779922768f	faturas	triagem/1768065700843_cresse.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 17:21:40.941163+00	2026-01-10 17:21:40.941163+00	2026-01-10 17:21:40.941163+00	{"eTag": "\\"7611906e10c4ba00005fdbb8ebf88b34\\"", "size": 182580, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T17:21:40.928Z", "contentLength": 182580, "httpStatusCode": 200}	c8f6e504-b682-474b-aa4b-06ed50b80d44	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
0c79bd7f-726a-4a61-8e4a-981b6f919895	faturas	triagem/1767991347938_cresse.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 20:42:27.984861+00	2026-01-09 20:42:27.984861+00	2026-01-09 20:42:27.984861+00	{"eTag": "\\"8c1955d302e692a9551fbf291c9497fb\\"", "size": 182459, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T20:42:27.975Z", "contentLength": 182459, "httpStatusCode": 200}	713769f6-9f08-43ff-8a5c-f116e14376fa	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
892fa92f-45d4-46fb-82b7-ee23513a8ab1	faturas	triagem/1768070151344_cresse.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 18:35:51.444151+00	2026-01-10 18:35:51.444151+00	2026-01-10 18:35:51.444151+00	{"eTag": "\\"7611906e10c4ba00005fdbb8ebf88b34\\"", "size": 182580, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T18:35:51.432Z", "contentLength": 182580, "httpStatusCode": 200}	600e6acb-bf8d-4048-b3ab-0b4db11f0ede	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
b2143e92-497b-43e0-92ae-a1d254ed64a7	faturas	triagem/1767991348153_francisco_pf.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 20:42:28.219981+00	2026-01-09 20:42:28.219981+00	2026-01-09 20:42:28.219981+00	{"eTag": "\\"120bace29a2f07779ebd3c60cd5702be\\"", "size": 182295, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T20:42:28.207Z", "contentLength": 182295, "httpStatusCode": 200}	231ad8dc-9a91-4f9e-8088-0a08dbe9e389	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
aec718fa-76a7-4d75-a74f-ce0b5c603660	faturas	triagem/1767991348318_francisco_pj.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 20:42:28.353328+00	2026-01-09 20:42:28.353328+00	2026-01-09 20:42:28.353328+00	{"eTag": "\\"93686f7da638d4346324e9011a47c156\\"", "size": 182194, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T20:42:28.343Z", "contentLength": 182194, "httpStatusCode": 200}	6f180c69-8138-4eb1-83aa-00449b40736c	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
ebe4c53c-66e7-44ea-93a6-e7edd4118f19	faturas	triagem/1767991348391_kipper.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 20:42:28.489458+00	2026-01-09 20:42:28.489458+00	2026-01-09 20:42:28.489458+00	{"eTag": "\\"d4a5d0c390137143e33b01b94cbe3b8f\\"", "size": 182094, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T20:42:28.471Z", "contentLength": 182094, "httpStatusCode": 200}	4700dc33-7744-4f5a-8b60-aac717b00cc6	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
566d05b4-0bf8-4ca5-9382-1f318aaf6940	faturas	triagem/1767991348535_landoski.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 20:42:28.576898+00	2026-01-09 20:42:28.576898+00	2026-01-09 20:42:28.576898+00	{"eTag": "\\"a1c4862abc1efac0b9714f77265c0359\\"", "size": 182349, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T20:42:28.563Z", "contentLength": 182349, "httpStatusCode": 200}	ad5a7679-2998-4d50-81ff-bcd96b57cf13	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
9c86d134-51dd-4722-9ac7-3ffb7dce6054	faturas	triagem/1767991348613_melo.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 20:42:28.647301+00	2026-01-09 20:42:28.647301+00	2026-01-09 20:42:28.647301+00	{"eTag": "\\"61de69567cc42f5d5ba95aa81475a902\\"", "size": 182497, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T20:42:28.635Z", "contentLength": 182497, "httpStatusCode": 200}	04c0c09b-896c-4cac-a5c8-2ab91e10a637	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
f12caf66-3707-4cbc-9406-dda7b2cb597b	faturas	triagem/1767991348681_menezes.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 20:42:28.725531+00	2026-01-09 20:42:28.725531+00	2026-01-09 20:42:28.725531+00	{"eTag": "\\"680600a2ffe06d2048f281327cf4c4c8\\"", "size": 182469, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T20:42:28.715Z", "contentLength": 182469, "httpStatusCode": 200}	0cc4a9f1-050c-4cee-8737-15d24188992e	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
ff50b551-c769-4169-aea4-1ee3645657be	faturas	triagem/1767991348775_miranda.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 20:42:28.81352+00	2026-01-09 20:42:28.81352+00	2026-01-09 20:42:28.81352+00	{"eTag": "\\"e9ce439872ffb6141d01efe99caae36b\\"", "size": 182063, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T20:42:28.803Z", "contentLength": 182063, "httpStatusCode": 200}	5983a82b-6013-498c-9165-e487f8ef357d	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
d5523e69-3b62-4970-a102-935f0fd847fd	faturas	triagem/1768059804283_cresse.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 15:43:24.37489+00	2026-01-10 15:43:24.37489+00	2026-01-10 15:43:24.37489+00	{"eTag": "\\"491fb9da933f702de76af94c27160b6d\\"", "size": 182162, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T15:43:24.362Z", "contentLength": 182162, "httpStatusCode": 200}	e330796e-5117-468d-93e0-bf402e24c222	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
2364a61f-56f9-4171-b18a-4a7d36b22727	faturas	triagem/1767991447245_bizu_forte.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 20:44:07.417098+00	2026-01-09 20:44:07.417098+00	2026-01-09 20:44:07.417098+00	{"eTag": "\\"3b3220970359a9b62a02b95eee281793\\"", "size": 181792, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T20:44:07.399Z", "contentLength": 181792, "httpStatusCode": 200}	844793f4-236e-440e-827d-4d351ca1bbad	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
3f32a5f6-1f91-40d8-80ea-f176914f299d	faturas	triagem/1767991447525_cresse8.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 20:44:07.589845+00	2026-01-09 20:44:07.589845+00	2026-01-09 20:44:07.589845+00	{"eTag": "\\"95d528b796df06d1d4eb3d154697b962\\"", "size": 182152, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T20:44:07.568Z", "contentLength": 182152, "httpStatusCode": 200}	2010b655-9a5f-43b8-ad9e-326bca1bc122	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
a7a05cd0-0e45-4976-b51b-3ef45c3e3731	faturas	triagem/1768066022170_cresse.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 17:27:02.261806+00	2026-01-10 17:27:02.261806+00	2026-01-10 17:27:02.261806+00	{"eTag": "\\"7611906e10c4ba00005fdbb8ebf88b34\\"", "size": 182580, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T17:27:02.248Z", "contentLength": 182580, "httpStatusCode": 200}	b334154c-f3f0-4cc6-b03b-6ad64cb58d17	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
23bdb187-f374-4682-ac72-0a61e90ad0a8	faturas	triagem/1767991447736_francisco_pf.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 20:44:07.823214+00	2026-01-09 20:44:07.823214+00	2026-01-09 20:44:07.823214+00	{"eTag": "\\"4349263b5bcd80518ca8a6c59e99fd58\\"", "size": 182128, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T20:44:07.800Z", "contentLength": 182128, "httpStatusCode": 200}	d08bb812-bf26-48cf-8c71-101a0b93c59a	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
3a8eb342-d74f-42f2-9f04-f52c1af27761	faturas	triagem/1768070151786_kipper.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 18:35:51.86995+00	2026-01-10 18:35:51.86995+00	2026-01-10 18:35:51.86995+00	{"eTag": "\\"d50a33487b3b2dc2c4a2323e07a51400\\"", "size": 182444, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T18:35:51.848Z", "contentLength": 182444, "httpStatusCode": 200}	180ba3aa-5403-47d4-97d2-9e0c56a2a97b	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
91f51649-bf28-45c9-8e39-b76808e217da	faturas	triagem/1767991447931_francisco_pj.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 20:44:07.970194+00	2026-01-09 20:44:07.970194+00	2026-01-09 20:44:07.970194+00	{"eTag": "\\"d7df6ab420707681b45fa4cbedb17b62\\"", "size": 182072, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T20:44:07.956Z", "contentLength": 182072, "httpStatusCode": 200}	4f1c3b0b-ada9-4211-997b-565e24902c13	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
5888fda9-9748-4519-8d69-477fafef805e	faturas	triagem/1768071336870_ABR_cresse.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 18:55:36.981012+00	2026-01-10 18:55:36.981012+00	2026-01-10 18:55:36.981012+00	{"eTag": "\\"7f597cdb5332d5b6fb3e696d0e01f775\\"", "size": 177326, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T18:55:36.970Z", "contentLength": 177326, "httpStatusCode": 200}	8616021d-fec8-48d6-b549-01865eced8f0	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
f54730b8-887c-46ef-afeb-df06eea50b2d	faturas	triagem/1767991448002_kipper.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 20:44:08.039666+00	2026-01-09 20:44:08.039666+00	2026-01-09 20:44:08.039666+00	{"eTag": "\\"46fedcd9b6ea1390adb4779db0fb70d6\\"", "size": 181822, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T20:44:08.028Z", "contentLength": 181822, "httpStatusCode": 200}	6f973afb-a265-493d-9191-39e2bcd37e3e	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
f6efea27-64c1-4d01-95ac-30c71b4cad49	faturas	triagem/1767991448071_landoski.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 20:44:08.113857+00	2026-01-09 20:44:08.113857+00	2026-01-09 20:44:08.113857+00	{"eTag": "\\"6a3468747316c627dbadc71e3d68d1a2\\"", "size": 182084, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T20:44:08.104Z", "contentLength": 182084, "httpStatusCode": 200}	681894a1-6806-4c1a-aa13-1b382ca3c9cd	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
2ecbc900-a1a9-4c2d-917d-71a2e733c740	faturas	triagem/1767991448150_melo.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 20:44:08.187975+00	2026-01-09 20:44:08.187975+00	2026-01-09 20:44:08.187975+00	{"eTag": "\\"2525b931d1f03ea5e1904f5cd0201d51\\"", "size": 182106, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T20:44:08.176Z", "contentLength": 182106, "httpStatusCode": 200}	3939180b-3f33-45a5-9597-a3cb3281b33c	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
7714198e-f2ab-4c5c-8341-a2277540a6d5	faturas	triagem/1767991448232_miranda.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 20:44:08.278063+00	2026-01-09 20:44:08.278063+00	2026-01-09 20:44:08.278063+00	{"eTag": "\\"97cdf339941fed2c9bff31b86f9737da\\"", "size": 181967, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T20:44:08.264Z", "contentLength": 181967, "httpStatusCode": 200}	6cdbce13-cf35-4637-85b3-3bc7cee2b6f9	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
b87f4121-e37a-4e22-861a-42ee0256cfa2	faturas	triagem/1767991561455_bizu_forte.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 20:46:01.613121+00	2026-01-09 20:46:01.613121+00	2026-01-09 20:46:01.613121+00	{"eTag": "\\"9717777d08813969090363d775eaa88d\\"", "size": 181829, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T20:46:01.597Z", "contentLength": 181829, "httpStatusCode": 200}	6828faaf-3006-48be-a209-f34197de2a39	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
39bbe59f-c77f-4f67-9a46-08c509a874b3	faturas	triagem/1767991561728_cresse.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 20:46:01.783208+00	2026-01-09 20:46:01.783208+00	2026-01-09 20:46:01.783208+00	{"eTag": "\\"491fb9da933f702de76af94c27160b6d\\"", "size": 182162, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T20:46:01.769Z", "contentLength": 182162, "httpStatusCode": 200}	ca098115-a398-47fb-8f09-80fcc13164c6	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
7d7ccb82-0830-4b2c-9287-33971e34a086	faturas	triagem/1768059924041_cresse.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 15:45:24.138295+00	2026-01-10 15:45:24.138295+00	2026-01-10 15:45:24.138295+00	{"eTag": "\\"491fb9da933f702de76af94c27160b6d\\"", "size": 182162, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T15:45:24.126Z", "contentLength": 182162, "httpStatusCode": 200}	a1373694-13d5-4123-be26-bf6895d4284d	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
f24ed54d-4191-4e32-a51b-a4f62cce648e	faturas	triagem/1767991561913_francisco_pf.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 20:46:01.959451+00	2026-01-09 20:46:01.959451+00	2026-01-09 20:46:01.959451+00	{"eTag": "\\"098bd0333a1f66480513bf13ea6bafe6\\"", "size": 182047, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T20:46:01.945Z", "contentLength": 182047, "httpStatusCode": 200}	46078039-5618-4de6-b856-252d46f831fa	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
4228b4ed-9f53-42d8-a151-584dfcf8e157	faturas	triagem/1767991562068_francisco_pj.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 20:46:02.111674+00	2026-01-09 20:46:02.111674+00	2026-01-09 20:46:02.111674+00	{"eTag": "\\"308d4af5f58e93b3e142f47d5feccef6\\"", "size": 181898, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T20:46:02.101Z", "contentLength": 181898, "httpStatusCode": 200}	a478b226-f5ab-4d9f-a741-8a487c45c826	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
e82e9d70-1470-4ab7-b58a-90da52ef0adf	faturas	triagem/1768066524749_cresse.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 17:35:24.877962+00	2026-01-10 17:35:24.877962+00	2026-01-10 17:35:24.877962+00	{"eTag": "\\"7611906e10c4ba00005fdbb8ebf88b34\\"", "size": 182580, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T17:35:24.864Z", "contentLength": 182580, "httpStatusCode": 200}	ed03efdd-151f-4974-aadb-4c96e23819d6	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
63879201-5f12-46d4-9629-65891e872bbd	faturas	triagem/1767991562144_kipper.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 20:46:02.197255+00	2026-01-09 20:46:02.197255+00	2026-01-09 20:46:02.197255+00	{"eTag": "\\"351aaddec06d24adfd09c6d83373a280\\"", "size": 181832, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T20:46:02.185Z", "contentLength": 181832, "httpStatusCode": 200}	6dc7d9ab-7453-4f04-a838-5637e2ec27d2	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
05b35064-bd84-4b6c-aecc-28f79a481833	faturas	triagem/1767991562247_landoski.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 20:46:02.283843+00	2026-01-09 20:46:02.283843+00	2026-01-09 20:46:02.283843+00	{"eTag": "\\"d0755db54b5b76309a89ae9360e7645f\\"", "size": 182089, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T20:46:02.273Z", "contentLength": 182089, "httpStatusCode": 200}	97bdc1f4-d020-4055-b217-772c499fa01b	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
a9883c51-da78-4954-9723-00bf2418821f	faturas	triagem/1768070616647_cresse.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 18:43:36.990813+00	2026-01-10 18:43:36.990813+00	2026-01-10 18:43:36.990813+00	{"eTag": "\\"491fb9da933f702de76af94c27160b6d\\"", "size": 182162, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T18:43:36.968Z", "contentLength": 182162, "httpStatusCode": 200}	51854959-042a-450b-b853-a7eb91b0753b	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
d2412e94-938b-429c-bb03-e2e82c948a28	faturas	triagem/1767991562327_miranda.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 20:46:02.369442+00	2026-01-09 20:46:02.369442+00	2026-01-09 20:46:02.369442+00	{"eTag": "\\"35803a60011d12fcb77acff40dbb2e51\\"", "size": 182003, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T20:46:02.357Z", "contentLength": 182003, "httpStatusCode": 200}	65c1c36d-3431-482b-a0e7-64140a0e6967	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
3bdb3d6f-8aa0-48b0-a74f-38a41a208b4b	faturas	triagem/1767991660687_bizu_forte.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 20:47:40.822234+00	2026-01-09 20:47:40.822234+00	2026-01-09 20:47:40.822234+00	{"eTag": "\\"ebc017e8deb33a4aa669893a10930ef8\\"", "size": 177605, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T20:47:40.809Z", "contentLength": 177605, "httpStatusCode": 200}	5d7feca4-a27b-4cc8-9fcf-4055f77c1eb5	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
2886bd7d-bf6e-4d4c-ab64-1da301811dc5	faturas	triagem/1767991660896_cresse.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 20:47:40.941026+00	2026-01-09 20:47:40.941026+00	2026-01-09 20:47:40.941026+00	{"eTag": "\\"29d2ae248666696fe64dc89f16093ac4\\"", "size": 177637, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T20:47:40.929Z", "contentLength": 177637, "httpStatusCode": 200}	4dffa09b-480d-42bb-8462-953bdbeac339	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
89b63c96-fc11-4e6b-873d-dd50986241b0	faturas	triagem/1767991661039_francisco_pf.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 20:47:41.099363+00	2026-01-09 20:47:41.099363+00	2026-01-09 20:47:41.099363+00	{"eTag": "\\"16c79c4fc123f2c2e8fe9b9e7fc7d55f\\"", "size": 177570, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T20:47:41.077Z", "contentLength": 177570, "httpStatusCode": 200}	8c09b133-b8c0-45d4-82a3-e11079a78222	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
db714a1c-8cc9-4275-b56d-ca640f35e39a	faturas	triagem/1767991661186_francisco_pj.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 20:47:41.239788+00	2026-01-09 20:47:41.239788+00	2026-01-09 20:47:41.239788+00	{"eTag": "\\"60dc9b85c02a7c431e60370fb1d4d643\\"", "size": 177445, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T20:47:41.229Z", "contentLength": 177445, "httpStatusCode": 200}	db45feef-5c12-455b-8719-55cfde45aadb	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
b82d3190-e176-40a8-8de7-d15518e6bac6	faturas	triagem/1767991661279_kipper.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 20:47:41.332569+00	2026-01-09 20:47:41.332569+00	2026-01-09 20:47:41.332569+00	{"eTag": "\\"59b086cb2a5b390cc6f2813fbb9f7bd5\\"", "size": 177580, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T20:47:41.317Z", "contentLength": 177580, "httpStatusCode": 200}	19d94934-f583-416b-a0e0-cbac3a34e027	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
850ce928-ffb0-4d6b-86aa-7303e6b9d373	faturas	triagem/1768060168577_cresse.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 15:49:28.661423+00	2026-01-10 15:49:28.661423+00	2026-01-10 15:49:28.661423+00	{"eTag": "\\"491fb9da933f702de76af94c27160b6d\\"", "size": 182162, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T15:49:28.651Z", "contentLength": 182162, "httpStatusCode": 200}	16f0407e-247b-4776-be0c-3f7b51083b72	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
13a44271-484a-4380-9aa9-66bb9b9321f2	faturas	triagem/1767991661389_landoski.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 20:47:41.438356+00	2026-01-09 20:47:41.438356+00	2026-01-09 20:47:41.438356+00	{"eTag": "\\"b20a2356ff8deb6bdc68a6d4f574a2ba\\"", "size": 177583, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T20:47:41.425Z", "contentLength": 177583, "httpStatusCode": 200}	4e689dbb-5963-423d-9b22-d0daa92bf669	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
991b377b-7443-4924-b07a-4c2e12a81f80	faturas	triagem/1767991661485_miranda.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 20:47:41.535235+00	2026-01-09 20:47:41.535235+00	2026-01-09 20:47:41.535235+00	{"eTag": "\\"a34c966d9bf7b1706412b03f2f6888cd\\"", "size": 177473, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T20:47:41.521Z", "contentLength": 177473, "httpStatusCode": 200}	77a32fd9-a5a1-4ed9-9cd0-ae334f16a4fc	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
c7e5e076-7f77-40d0-b5c9-0bdac32c298d	faturas	triagem/1768067161656_cresse.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 17:46:01.751532+00	2026-01-10 17:46:01.751532+00	2026-01-10 17:46:01.751532+00	{"eTag": "\\"7611906e10c4ba00005fdbb8ebf88b34\\"", "size": 182580, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T17:46:01.743Z", "contentLength": 182580, "httpStatusCode": 200}	59730ddb-797b-4d55-964f-e9cbdeced6a0	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
7f94f8cd-3412-4831-b600-4ebfff899346	faturas	triagem/1767991744907_bizu_forte.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 20:49:05.016682+00	2026-01-09 20:49:05.016682+00	2026-01-09 20:49:05.016682+00	{"eTag": "\\"80853473f4a5114d4f2a7436965de0f4\\"", "size": 177404, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T20:49:05.003Z", "contentLength": 177404, "httpStatusCode": 200}	2e0b618c-9f00-4b84-9f3b-f788e829b313	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
ad3f019d-0522-4b2d-b5fa-838fa0c58587	faturas	triagem/1767991745103_cresse.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 20:49:05.143425+00	2026-01-09 20:49:05.143425+00	2026-01-09 20:49:05.143425+00	{"eTag": "\\"142cdbcd4c36f5eb29c55d12e9ad9e48\\"", "size": 177521, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T20:49:05.131Z", "contentLength": 177521, "httpStatusCode": 200}	afb0a52f-ab50-4fc6-8794-a9fd285e8028	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
0e65d685-5b06-4f66-ad25-99982717b7bc	faturas	triagem/1768070779875_cresse.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 18:46:19.957983+00	2026-01-10 18:46:19.957983+00	2026-01-10 18:46:19.957983+00	{"eTag": "\\"491fb9da933f702de76af94c27160b6d\\"", "size": 182162, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T18:46:19.949Z", "contentLength": 182162, "httpStatusCode": 200}	35b67926-9e5a-4c4b-b0f3-401138782581	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
d2139de6-e295-4f68-9ab4-91a696e825ef	faturas	triagem/1767991745246_francisco_pf.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 20:49:05.301588+00	2026-01-09 20:49:05.301588+00	2026-01-09 20:49:05.301588+00	{"eTag": "\\"13e291ade247632417985f791d8be182\\"", "size": 177271, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T20:49:05.283Z", "contentLength": 177271, "httpStatusCode": 200}	99b47fba-43b5-4f36-9f50-b48693b77372	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
005e036e-da5d-4315-8907-7f1684ceba88	faturas	triagem/1767991745400_kipper.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 20:49:05.449945+00	2026-01-09 20:49:05.449945+00	2026-01-09 20:49:05.449945+00	{"eTag": "\\"f5f8a02ff4517e052008e1abf39dadbd\\"", "size": 177269, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T20:49:05.439Z", "contentLength": 177269, "httpStatusCode": 200}	61ef5a87-25af-42e5-a2a0-8f20fb73c49d	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
7011d41f-4844-48f5-99e3-9c27edcae638	faturas	triagem/1767991745485_landoski.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 20:49:05.523562+00	2026-01-09 20:49:05.523562+00	2026-01-09 20:49:05.523562+00	{"eTag": "\\"af9741746f03a59d4e8352db926befef\\"", "size": 177432, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T20:49:05.511Z", "contentLength": 177432, "httpStatusCode": 200}	08bd77bc-2b5f-417f-8cec-45100e6e8415	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
c5c89067-2da4-45ca-b82d-29b1bfceecae	faturas	triagem/1767991757672_cresse.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 20:49:17.759437+00	2026-01-09 20:49:17.759437+00	2026-01-09 20:49:17.759437+00	{"eTag": "\\"7f597cdb5332d5b6fb3e696d0e01f775\\"", "size": 177326, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T20:49:17.749Z", "contentLength": 177326, "httpStatusCode": 200}	366b2a41-80f8-4f8c-ad6a-c5db63308c03	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
c4275fb7-dea1-4de5-aa1d-6db1043b9276	faturas	triagem/1767991772953_cresse.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-09 20:49:33.023266+00	2026-01-09 20:49:33.023266+00	2026-01-09 20:49:33.023266+00	{"eTag": "\\"9498cd57a92c1ae79b0b12af53ec7545\\"", "size": 177272, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-09T20:49:33.012Z", "contentLength": 177272, "httpStatusCode": 200}	6ff3e9a0-0980-4750-ad92-ed4086574228	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
9630ee8b-0fe5-48fb-bd61-0b8af983f6b7	faturas	triagem/1768062548692_cresse.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 16:29:08.810834+00	2026-01-10 16:29:08.810834+00	2026-01-10 16:29:08.810834+00	{"eTag": "\\"491fb9da933f702de76af94c27160b6d\\"", "size": 182162, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T16:29:08.797Z", "contentLength": 182162, "httpStatusCode": 200}	e3a7fdff-1e6a-4082-8c5c-c21dfe37e356	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
af5dfd69-3e18-4d76-9d47-2bb70daf799f	faturas	triagem/1768067253573_cresse.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 17:47:33.966474+00	2026-01-10 17:47:33.966474+00	2026-01-10 17:47:33.966474+00	{"eTag": "\\"7611906e10c4ba00005fdbb8ebf88b34\\"", "size": 182580, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T17:47:33.932Z", "contentLength": 182580, "httpStatusCode": 200}	b48356ac-a46b-4198-aa6e-5206afebeeda	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
cd0c5e8e-2ecc-468a-a271-164c5b72a594	faturas	triagem/1768070797159_cresse.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 18:46:37.226835+00	2026-01-10 18:46:37.226835+00	2026-01-10 18:46:37.226835+00	{"eTag": "\\"7611906e10c4ba00005fdbb8ebf88b34\\"", "size": 182580, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T18:46:37.214Z", "contentLength": 182580, "httpStatusCode": 200}	cd7cc466-75e7-4a2f-9d4a-69ec70edc98c	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
93e13405-988d-4d76-8ba9-ff6ed38663b7	faturas	triagem/1768071337081_AGO_bizu_forte.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 18:55:37.119632+00	2026-01-10 18:55:37.119632+00	2026-01-10 18:55:37.119632+00	{"eTag": "\\"3b3220970359a9b62a02b95eee281793\\"", "size": 181792, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T18:55:37.110Z", "contentLength": 181792, "httpStatusCode": 200}	c21cae38-43bc-4741-8e00-7781eb6cad1c	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
54524cf0-706f-4dbc-8358-5f1cd1da2624	faturas	triagem/1768071337162_AGO_cresse8.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 18:55:37.201635+00	2026-01-10 18:55:37.201635+00	2026-01-10 18:55:37.201635+00	{"eTag": "\\"95d528b796df06d1d4eb3d154697b962\\"", "size": 182152, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T18:55:37.194Z", "contentLength": 182152, "httpStatusCode": 200}	7b860067-de93-4126-b79d-d5584634ac81	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
2ffe32f4-08f9-4763-b9f4-bac6b34b77ca	faturas	triagem/1768071337250_AGO_francisco_pf.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 18:55:37.350869+00	2026-01-10 18:55:37.350869+00	2026-01-10 18:55:37.350869+00	{"eTag": "\\"4349263b5bcd80518ca8a6c59e99fd58\\"", "size": 182128, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T18:55:37.326Z", "contentLength": 182128, "httpStatusCode": 200}	a68d9cb7-aec2-4cfc-bea7-25e790d503dd	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
16876d18-d2fa-4bb0-aae6-8a44fe048488	faturas	triagem/1768071337448_AGO_francisco_pj.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 18:55:37.524697+00	2026-01-10 18:55:37.524697+00	2026-01-10 18:55:37.524697+00	{"eTag": "\\"d7df6ab420707681b45fa4cbedb17b62\\"", "size": 182072, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T18:55:37.514Z", "contentLength": 182072, "httpStatusCode": 200}	2a7ce989-fa83-40e6-b9af-47103216bdd8	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
078fa053-ab33-4c83-806c-dafe0850795e	faturas	triagem/1768071337592_AGO_kipper.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 18:55:37.640456+00	2026-01-10 18:55:37.640456+00	2026-01-10 18:55:37.640456+00	{"eTag": "\\"46fedcd9b6ea1390adb4779db0fb70d6\\"", "size": 181822, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T18:55:37.630Z", "contentLength": 181822, "httpStatusCode": 200}	d6b3c657-bad6-4d6c-ac43-cd1497e2e8f1	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
36f7b9a4-ae73-4c4a-adea-b506083b379d	faturas	triagem/1768071337682_AGO_landoski.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 18:55:37.732849+00	2026-01-10 18:55:37.732849+00	2026-01-10 18:55:37.732849+00	{"eTag": "\\"6a3468747316c627dbadc71e3d68d1a2\\"", "size": 182084, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T18:55:37.722Z", "contentLength": 182084, "httpStatusCode": 200}	6f9a739a-9589-4f01-b7a0-55157f085d0b	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
1b5a5cb2-3bce-45ef-bd22-dbb578651b5e	faturas	triagem/1768071337775_AGO_melo.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 18:55:37.812073+00	2026-01-10 18:55:37.812073+00	2026-01-10 18:55:37.812073+00	{"eTag": "\\"2525b931d1f03ea5e1904f5cd0201d51\\"", "size": 182106, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T18:55:37.802Z", "contentLength": 182106, "httpStatusCode": 200}	9fe4979b-8a40-4be6-ac5c-33611596cc73	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
dbfbb9f4-6c24-4d17-a1b0-e87f4a54a05a	faturas	triagem/1768071337853_AGO_miranda.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 18:55:37.892641+00	2026-01-10 18:55:37.892641+00	2026-01-10 18:55:37.892641+00	{"eTag": "\\"97cdf339941fed2c9bff31b86f9737da\\"", "size": 181967, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T18:55:37.882Z", "contentLength": 181967, "httpStatusCode": 200}	4a2590f7-76d5-484d-bceb-273d109bdb66	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
5667af30-7a21-4b09-b1df-5d13823e8166	faturas	triagem/1768071337943_DEZ_miranda.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 18:55:37.994206+00	2026-01-10 18:55:37.994206+00	2026-01-10 18:55:37.994206+00	{"eTag": "\\"e5336439e2f0961d9572fcc851fcbac9\\"", "size": 182473, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T18:55:37.982Z", "contentLength": 182473, "httpStatusCode": 200}	b1eda293-4482-4602-b6ff-212c042c8306	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
49699795-2cf0-4e78-b0b2-9d8b68cbed4d	faturas	triagem/1768071338038_JUL_bizu_forte.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 18:55:38.09169+00	2026-01-10 18:55:38.09169+00	2026-01-10 18:55:38.09169+00	{"eTag": "\\"9717777d08813969090363d775eaa88d\\"", "size": 181829, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T18:55:38.082Z", "contentLength": 181829, "httpStatusCode": 200}	d04354f3-0b60-4a28-823c-a068a52abdc8	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
590d6ef7-6024-4fe0-af46-dfbbff00efc7	faturas	triagem/1768071338147_JUL_cresse.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 18:55:38.185043+00	2026-01-10 18:55:38.185043+00	2026-01-10 18:55:38.185043+00	{"eTag": "\\"491fb9da933f702de76af94c27160b6d\\"", "size": 182162, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T18:55:38.178Z", "contentLength": 182162, "httpStatusCode": 200}	16f9e735-2b82-4edd-84f9-74c687d9a3a5	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
035c6815-d77c-4abb-b143-97455744957d	faturas	triagem/1768071338236_JUL_francisco_pf.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 18:55:38.281222+00	2026-01-10 18:55:38.281222+00	2026-01-10 18:55:38.281222+00	{"eTag": "\\"098bd0333a1f66480513bf13ea6bafe6\\"", "size": 182047, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T18:55:38.274Z", "contentLength": 182047, "httpStatusCode": 200}	c85aef2d-1028-4af7-b3b3-30ff6ecf586c	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
05af4ee6-2b5a-43b9-89ec-a85cb9415866	faturas	triagem/1768071338325_JUL_francisco_pj.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 18:55:38.366939+00	2026-01-10 18:55:38.366939+00	2026-01-10 18:55:38.366939+00	{"eTag": "\\"308d4af5f58e93b3e142f47d5feccef6\\"", "size": 181898, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T18:55:38.354Z", "contentLength": 181898, "httpStatusCode": 200}	46aadb47-6297-4fff-8fa0-558d9a8439aa	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
ee953da7-5dc6-40ad-93bf-cb3266ce9663	faturas	triagem/1768071338450_JUL_kipper.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 18:55:38.498803+00	2026-01-10 18:55:38.498803+00	2026-01-10 18:55:38.498803+00	{"eTag": "\\"351aaddec06d24adfd09c6d83373a280\\"", "size": 181832, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T18:55:38.490Z", "contentLength": 181832, "httpStatusCode": 200}	d09f9e34-8d19-4240-9739-ab6ebf4ae9b7	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
2e9773fa-562a-45a5-b90e-4ba04a6cc51c	faturas	triagem/1768071338554_JUL_landoski.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 18:55:38.602172+00	2026-01-10 18:55:38.602172+00	2026-01-10 18:55:38.602172+00	{"eTag": "\\"d0755db54b5b76309a89ae9360e7645f\\"", "size": 182089, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T18:55:38.594Z", "contentLength": 182089, "httpStatusCode": 200}	fe443cee-4a6f-471e-8232-1f90ea29e60e	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
16ca8ee0-54f8-4522-96e5-53fe293484ed	faturas	triagem/1768071338647_JUL_miranda.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 18:55:38.684403+00	2026-01-10 18:55:38.684403+00	2026-01-10 18:55:38.684403+00	{"eTag": "\\"35803a60011d12fcb77acff40dbb2e51\\"", "size": 182003, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T18:55:38.670Z", "contentLength": 182003, "httpStatusCode": 200}	b7607f7d-a0f2-4378-91d1-ba445986daf1	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
5033028c-4932-4f92-b08a-ab086ab86831	faturas	triagem/1768071338728_JUN_bizu_forte.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 18:55:38.774358+00	2026-01-10 18:55:38.774358+00	2026-01-10 18:55:38.774358+00	{"eTag": "\\"ebc017e8deb33a4aa669893a10930ef8\\"", "size": 177605, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T18:55:38.758Z", "contentLength": 177605, "httpStatusCode": 200}	2f5bb4a5-679b-4b87-8752-517c89ffab10	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
5fd4067d-ef5c-449d-a227-5ef6c50ef4fc	faturas	triagem/1768071338819_JUN_cresse.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 18:55:38.856846+00	2026-01-10 18:55:38.856846+00	2026-01-10 18:55:38.856846+00	{"eTag": "\\"29d2ae248666696fe64dc89f16093ac4\\"", "size": 177637, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T18:55:38.846Z", "contentLength": 177637, "httpStatusCode": 200}	a96e60f9-25ea-4630-8bcb-91fd872e901e	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
a905d227-0f51-4856-86b2-ee10b63fdb9a	faturas	triagem/1768071338902_JUN_francisco_pf.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 18:55:38.942302+00	2026-01-10 18:55:38.942302+00	2026-01-10 18:55:38.942302+00	{"eTag": "\\"16c79c4fc123f2c2e8fe9b9e7fc7d55f\\"", "size": 177570, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T18:55:38.930Z", "contentLength": 177570, "httpStatusCode": 200}	d0250e80-1bc3-483d-a3d0-70b0208ade41	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
cda536a5-96cf-4244-afc3-c6535c044bf4	faturas	triagem/1768071338984_JUN_francisco_pj.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 18:55:39.065187+00	2026-01-10 18:55:39.065187+00	2026-01-10 18:55:39.065187+00	{"eTag": "\\"60dc9b85c02a7c431e60370fb1d4d643\\"", "size": 177445, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T18:55:39.042Z", "contentLength": 177445, "httpStatusCode": 200}	48838096-9f46-46b5-992e-2f90f3099f70	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
882e5205-ab62-4805-9ce0-433ff93513a5	faturas	triagem/1768071339127_JUN_kipper.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 18:55:39.17045+00	2026-01-10 18:55:39.17045+00	2026-01-10 18:55:39.17045+00	{"eTag": "\\"59b086cb2a5b390cc6f2813fbb9f7bd5\\"", "size": 177580, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T18:55:39.154Z", "contentLength": 177580, "httpStatusCode": 200}	3775484a-ff92-4c0f-9c44-2e6edb76a816	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
a1f756ec-451a-4ea2-bcda-f19bdcc76618	faturas	triagem/1768071339217_JUN_landoski.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 18:55:39.267408+00	2026-01-10 18:55:39.267408+00	2026-01-10 18:55:39.267408+00	{"eTag": "\\"b20a2356ff8deb6bdc68a6d4f574a2ba\\"", "size": 177583, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T18:55:39.250Z", "contentLength": 177583, "httpStatusCode": 200}	e916d9a9-f314-404a-b833-8b1410ff8272	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
63509267-9e23-4faa-81f8-c04e4ca7fc6a	faturas	triagem/1768071339306_JUN_miranda.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 18:55:39.350198+00	2026-01-10 18:55:39.350198+00	2026-01-10 18:55:39.350198+00	{"eTag": "\\"a34c966d9bf7b1706412b03f2f6888cd\\"", "size": 177473, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T18:55:39.334Z", "contentLength": 177473, "httpStatusCode": 200}	ce504618-2fd6-42b5-9261-eb973d856629	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
6179c156-7e73-4581-840a-3c7caba1f784	faturas	triagem/1768071339389_MAIO_bizu_forte.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 18:55:39.455609+00	2026-01-10 18:55:39.455609+00	2026-01-10 18:55:39.455609+00	{"eTag": "\\"80853473f4a5114d4f2a7436965de0f4\\"", "size": 177404, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T18:55:39.426Z", "contentLength": 177404, "httpStatusCode": 200}	42b537f2-a6ff-4c73-b2ce-8e3a83dc0948	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
b2d5b50e-43f5-408c-87d4-e6e14b43167d	faturas	triagem/1768071339525_MAIO_cresse.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 18:55:39.585191+00	2026-01-10 18:55:39.585191+00	2026-01-10 18:55:39.585191+00	{"eTag": "\\"142cdbcd4c36f5eb29c55d12e9ad9e48\\"", "size": 177521, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T18:55:39.570Z", "contentLength": 177521, "httpStatusCode": 200}	9f101acd-5c20-4fe2-9594-e3cf27dff4a3	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
7faf1a41-7c5e-4a1d-9d95-45f6b38fc82e	faturas	triagem/1768071339842_MAIO_landoski.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 18:55:39.910375+00	2026-01-10 18:55:39.910375+00	2026-01-10 18:55:39.910375+00	{"eTag": "\\"af9741746f03a59d4e8352db926befef\\"", "size": 177432, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T18:55:39.898Z", "contentLength": 177432, "httpStatusCode": 200}	1851323a-11ca-4531-963d-11fcb6548529	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
f5b55b9d-2f16-4a57-8796-8b214fc62ad0	faturas	triagem/1768071339638_MAIO_francisco_pf.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 18:55:39.702762+00	2026-01-10 18:55:39.702762+00	2026-01-10 18:55:39.702762+00	{"eTag": "\\"13e291ade247632417985f791d8be182\\"", "size": 177271, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T18:55:39.686Z", "contentLength": 177271, "httpStatusCode": 200}	86c059a9-89a5-47d2-9df2-692decd8ffd5	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
cec3f338-cecb-4a3c-916a-e7218268596f	faturas	triagem/1768071339754_MAIO_kipper.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 18:55:39.796495+00	2026-01-10 18:55:39.796495+00	2026-01-10 18:55:39.796495+00	{"eTag": "\\"f5f8a02ff4517e052008e1abf39dadbd\\"", "size": 177269, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T18:55:39.778Z", "contentLength": 177269, "httpStatusCode": 200}	32c21675-9b31-49fe-a9c2-007078cf8523	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
aa511885-6014-4bbe-bda7-c86dffe401aa	faturas	triagem/1768071340033_NOV_Bizu_forte.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 18:55:40.093759+00	2026-01-10 18:55:40.093759+00	2026-01-10 18:55:40.093759+00	{"eTag": "\\"584f405408eafd20df0454a6c0e730c6\\"", "size": 182289, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T18:55:40.078Z", "contentLength": 182289, "httpStatusCode": 200}	4f0a514b-225a-4f29-bfb1-bfdaf21f7091	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
db9dca44-9992-4136-bf29-fada7f4e1eb9	faturas	triagem/1768071340136_NOV_Cresse.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 18:55:40.187953+00	2026-01-10 18:55:40.187953+00	2026-01-10 18:55:40.187953+00	{"eTag": "\\"ff7a3773725c537fc6cd72ae461a42ac\\"", "size": 182445, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T18:55:40.174Z", "contentLength": 182445, "httpStatusCode": 200}	6643c6eb-ad69-4eba-b93c-490b0c7afb07	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
5e0fd836-f32e-4d67-b8c6-4a17152bfdf3	faturas	triagem/1768071339952_MAR_cresse.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 18:55:39.987592+00	2026-01-10 18:55:39.987592+00	2026-01-10 18:55:39.987592+00	{"eTag": "\\"9498cd57a92c1ae79b0b12af53ec7545\\"", "size": 177272, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T18:55:39.974Z", "contentLength": 177272, "httpStatusCode": 200}	d7391c72-5093-406f-b72b-582af6ca2ad1	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
fe486920-38e4-4d39-a035-6bc3c31d42da	faturas	triagem/1768071340240_NOV_Francisco_PF.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 18:55:40.28635+00	2026-01-10 18:55:40.28635+00	2026-01-10 18:55:40.28635+00	{"eTag": "\\"45d1f470c389dbac1883204a729d445a\\"", "size": 182677, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T18:55:40.266Z", "contentLength": 182677, "httpStatusCode": 200}	db8722af-d606-4fcb-8f8e-4786b185281d	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
0ea8aabd-8f99-4f5b-9e13-5eef52b6babe	faturas	triagem/1768071340341_NOV_Francisco_PJ.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 18:55:40.384881+00	2026-01-10 18:55:40.384881+00	2026-01-10 18:55:40.384881+00	{"eTag": "\\"7212cc61d43b0e02ce8e33fba320f071\\"", "size": 182406, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T18:55:40.370Z", "contentLength": 182406, "httpStatusCode": 200}	6df6114d-abef-4e02-9381-4d5621ee535d	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
a3dddd3b-32ec-4a19-9637-38d5cdca897e	faturas	triagem/1768071340425_NOV_kipper.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 18:55:40.471408+00	2026-01-10 18:55:40.471408+00	2026-01-10 18:55:40.471408+00	{"eTag": "\\"e2747d168f1f3ff39c96bc849429476e\\"", "size": 182063, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T18:55:40.454Z", "contentLength": 182063, "httpStatusCode": 200}	fc189e2a-01db-4aa2-8e76-18f6ce6ed034	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
828b9a1a-d02e-411d-8ba1-fbdd37d39778	faturas	triagem/1768071340527_NOV_Landoski.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 18:55:40.576375+00	2026-01-10 18:55:40.576375+00	2026-01-10 18:55:40.576375+00	{"eTag": "\\"9566ad69ccc4bd977831cc78e9689e6a\\"", "size": 182316, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T18:55:40.562Z", "contentLength": 182316, "httpStatusCode": 200}	9490990e-715d-4cc4-abdf-cfc11b9600ae	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
0d5b8198-1d75-445a-bfb5-986b0c39c6bc	faturas	triagem/1768071340614_NOV_Melo.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 18:55:40.663016+00	2026-01-10 18:55:40.663016+00	2026-01-10 18:55:40.663016+00	{"eTag": "\\"1b2c1a48219816a664fba5d0c6b99f47\\"", "size": 182460, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T18:55:40.642Z", "contentLength": 182460, "httpStatusCode": 200}	6097e400-6932-4598-bd13-b21e065645c6	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
20427271-b726-4d12-8f43-1199505b179d	faturas	triagem/1768071340719_NOV_Menezes.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 18:55:40.771605+00	2026-01-10 18:55:40.771605+00	2026-01-10 18:55:40.771605+00	{"eTag": "\\"f1a11453063ea58e0eb6d2b290acf48a\\"", "size": 182584, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T18:55:40.754Z", "contentLength": 182584, "httpStatusCode": 200}	93cffc67-1aed-4e3d-9acc-7a223ed94fd7	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
ebf3d42c-5f72-4685-bfc9-468aa0632043	faturas	triagem/1768071340826_NOV_Miranda.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 18:55:40.891641+00	2026-01-10 18:55:40.891641+00	2026-01-10 18:55:40.891641+00	{"eTag": "\\"60aaf831959fc90bf893aa51cc2bb6fd\\"", "size": 182369, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T18:55:40.874Z", "contentLength": 182369, "httpStatusCode": 200}	520a6ff1-ba7a-4dc7-9245-216af115f902	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
63967c18-22a0-4358-9760-53194e0ca179	faturas	triagem/1768071340944_OUT_bizu_forte.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 18:55:40.988712+00	2026-01-10 18:55:40.988712+00	2026-01-10 18:55:40.988712+00	{"eTag": "\\"b4179a0429eb4108ecc909294cf142c1\\"", "size": 182348, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T18:55:40.974Z", "contentLength": 182348, "httpStatusCode": 200}	996c804d-322c-4f42-b19e-4d6ff1078319	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
6729db7e-4b5e-4b25-be2b-af82ff89c32e	faturas	triagem/1768071341033_OUT_cresse.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 18:55:41.084512+00	2026-01-10 18:55:41.084512+00	2026-01-10 18:55:41.084512+00	{"eTag": "\\"ee00ca7b92501f1a96ede32bfb66134f\\"", "size": 182549, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T18:55:41.070Z", "contentLength": 182549, "httpStatusCode": 200}	783ee570-d71f-43ca-9f6e-603226d7527f	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
ab642887-9649-488d-9e2c-96d7c8f35d3b	faturas	triagem/1768071341126_OUT_francisco_pf.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 18:55:41.176372+00	2026-01-10 18:55:41.176372+00	2026-01-10 18:55:41.176372+00	{"eTag": "\\"db66a1639b01a813fcb05b6d6816b076\\"", "size": 182321, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T18:55:41.162Z", "contentLength": 182321, "httpStatusCode": 200}	bf29f062-d5e1-4066-ba19-d9a6627f44ca	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
133dd8ef-6a7d-443c-8409-80423e5417c9	faturas	triagem/1768071341223_OUT_francisco_pj.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 18:55:41.275046+00	2026-01-10 18:55:41.275046+00	2026-01-10 18:55:41.275046+00	{"eTag": "\\"7e183743c917bbcfb1a23bad776cdb71\\"", "size": 182419, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T18:55:41.262Z", "contentLength": 182419, "httpStatusCode": 200}	1bf01856-6fe8-4436-896f-65da26858219	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
a32a4013-3ba1-472f-ac47-8fa5604ca71b	faturas	triagem/1768071341315_OUT_kipper.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 18:55:41.378154+00	2026-01-10 18:55:41.378154+00	2026-01-10 18:55:41.378154+00	{"eTag": "\\"40dbaee056f5dbbebe9b9865367ffbbd\\"", "size": 182118, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T18:55:41.358Z", "contentLength": 182118, "httpStatusCode": 200}	3cd7ddac-ff1d-42e5-bf98-b1ed69589f49	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
d740850b-717e-4d98-b5f5-a7332f232958	faturas	triagem/1768071341415_OUT_landoski.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 18:55:41.458159+00	2026-01-10 18:55:41.458159+00	2026-01-10 18:55:41.458159+00	{"eTag": "\\"1fdf68f0c7c96f11e6c85f1e810c73be\\"", "size": 182371, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T18:55:41.446Z", "contentLength": 182371, "httpStatusCode": 200}	d956e07b-7b0a-41ce-ad97-1b187223906d	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
bffff207-e686-4e10-ac8a-33dea90b4a69	faturas	triagem/1768071341495_OUT_melo.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 18:55:41.557817+00	2026-01-10 18:55:41.557817+00	2026-01-10 18:55:41.557817+00	{"eTag": "\\"bb34b0d2f6d71ccf15ef257f4615e75c\\"", "size": 182430, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T18:55:41.542Z", "contentLength": 182430, "httpStatusCode": 200}	518ad475-ee85-4c5c-9f22-4ffd0f5ca9c0	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
a30c05e5-35c9-4a42-8d4a-d92f298ee5fb	faturas	triagem/1768071341602_OUT_menezes.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 18:55:41.658957+00	2026-01-10 18:55:41.658957+00	2026-01-10 18:55:41.658957+00	{"eTag": "\\"e9854b123bae27dba707709c56f7443c\\"", "size": 182392, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T18:55:41.638Z", "contentLength": 182392, "httpStatusCode": 200}	2f219cd2-18de-49d3-82e6-700e3e22cf04	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
e6c0a6b6-cba6-4fde-a77e-4115f46f1713	faturas	triagem/1768071341706_OUT_miranda.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 18:55:41.756111+00	2026-01-10 18:55:41.756111+00	2026-01-10 18:55:41.756111+00	{"eTag": "\\"528dfa3b894e49c1c995cf85a55dc476\\"", "size": 205214, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T18:55:41.742Z", "contentLength": 205214, "httpStatusCode": 200}	54c16924-59a3-4dc5-8274-fb106c27b42c	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
3e909fb6-ec8e-4633-b435-649f853356fc	faturas	triagem/1768071341800_SET_bizu_forte.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 18:55:41.838023+00	2026-01-10 18:55:41.838023+00	2026-01-10 18:55:41.838023+00	{"eTag": "\\"39267a15782d7e8f91c708c9235b7afd\\"", "size": 182090, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T18:55:41.826Z", "contentLength": 182090, "httpStatusCode": 200}	91956a8e-b2bf-43ab-89d2-61b66360789d	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
309ac189-7020-4e4d-a896-bdf4f911317a	faturas	triagem/1768071341884_SET_cresse.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 18:55:41.949278+00	2026-01-10 18:55:41.949278+00	2026-01-10 18:55:41.949278+00	{"eTag": "\\"8c1955d302e692a9551fbf291c9497fb\\"", "size": 182459, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T18:55:41.930Z", "contentLength": 182459, "httpStatusCode": 200}	f24a0621-78e1-4a49-8e73-636431103a0e	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
7c7dc13e-aec2-451d-a881-83e4dba9662b	faturas	triagem/1768071341999_SET_francisco_pf.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 18:55:42.049951+00	2026-01-10 18:55:42.049951+00	2026-01-10 18:55:42.049951+00	{"eTag": "\\"120bace29a2f07779ebd3c60cd5702be\\"", "size": 182295, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T18:55:42.034Z", "contentLength": 182295, "httpStatusCode": 200}	b1e83b48-7358-4184-a591-ddf4b96a81d5	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
7ca24435-1268-4b1f-b210-c3396c785986	faturas	triagem/1768071342100_SET_francisco_pj.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 18:55:42.144876+00	2026-01-10 18:55:42.144876+00	2026-01-10 18:55:42.144876+00	{"eTag": "\\"93686f7da638d4346324e9011a47c156\\"", "size": 182194, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T18:55:42.130Z", "contentLength": 182194, "httpStatusCode": 200}	4d68cd90-037c-4ab9-8c5a-f131efe1b7b0	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
c4e161ad-be74-40f3-9239-de38bd861279	faturas	triagem/1768071342199_SET_kipper.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 18:55:42.256518+00	2026-01-10 18:55:42.256518+00	2026-01-10 18:55:42.256518+00	{"eTag": "\\"d4a5d0c390137143e33b01b94cbe3b8f\\"", "size": 182094, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T18:55:42.238Z", "contentLength": 182094, "httpStatusCode": 200}	39ee7756-1e8b-45f3-9fad-37a8519f25ff	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
daad7bd6-991d-4547-94f4-1627f3344d0e	faturas	triagem/1768071342306_SET_landoski.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 18:55:42.351595+00	2026-01-10 18:55:42.351595+00	2026-01-10 18:55:42.351595+00	{"eTag": "\\"a1c4862abc1efac0b9714f77265c0359\\"", "size": 182349, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T18:55:42.338Z", "contentLength": 182349, "httpStatusCode": 200}	fed8d2db-c945-4aa8-b441-fab3acbc21c7	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
08429dbf-e970-4c2e-91a6-c4c2d9fdf9f0	faturas	triagem/1768071342399_SET_melo.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 18:55:42.43988+00	2026-01-10 18:55:42.43988+00	2026-01-10 18:55:42.43988+00	{"eTag": "\\"61de69567cc42f5d5ba95aa81475a902\\"", "size": 182497, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T18:55:42.426Z", "contentLength": 182497, "httpStatusCode": 200}	d882131a-84f5-4c32-8cf5-1d7cd6c0645f	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
504d9714-2186-4728-8299-a291435483cc	faturas	triagem/1768071342478_SET_menezes.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 18:55:42.525587+00	2026-01-10 18:55:42.525587+00	2026-01-10 18:55:42.525587+00	{"eTag": "\\"680600a2ffe06d2048f281327cf4c4c8\\"", "size": 182469, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T18:55:42.506Z", "contentLength": 182469, "httpStatusCode": 200}	216dd661-a20a-4c4d-b4dd-65f2e4856aae	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
b5d15ed3-3c53-4abe-a3ba-766fe19d2a40	faturas	triagem/1768071342564_SET_miranda.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 18:55:42.612775+00	2026-01-10 18:55:42.612775+00	2026-01-10 18:55:42.612775+00	{"eTag": "\\"e9ce439872ffb6141d01efe99caae36b\\"", "size": 182063, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T18:55:42.602Z", "contentLength": 182063, "httpStatusCode": 200}	5fb1f5b1-86a3-48ef-a074-ee19ac18cfcf	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
bc859835-0f0b-4603-b395-dacb0c5acf3b	faturas	triagem/1768072498874_DEZ_bizuforte.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 19:14:58.965709+00	2026-01-10 19:14:58.965709+00	2026-01-10 19:14:58.965709+00	{"eTag": "\\"be4f815107538aa68badcad6a3cf0c84\\"", "size": 182627, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T19:14:58.954Z", "contentLength": 182627, "httpStatusCode": 200}	61edaea0-3126-4183-8f47-c489faaa0279	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
3db01070-42fe-45cb-9e25-eeca773a79e1	faturas	triagem/1768072499051_DEZ_cresse.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 19:14:59.089208+00	2026-01-10 19:14:59.089208+00	2026-01-10 19:14:59.089208+00	{"eTag": "\\"7611906e10c4ba00005fdbb8ebf88b34\\"", "size": 182580, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T19:14:59.078Z", "contentLength": 182580, "httpStatusCode": 200}	31797cdb-86d0-4c66-b744-33c922641e33	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
c5e1bd9f-3af8-4c60-b699-e919304f96b0	faturas	triagem/1768072499162_DEZ_francisco_pf.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 19:14:59.201502+00	2026-01-10 19:14:59.201502+00	2026-01-10 19:14:59.201502+00	{"eTag": "\\"3f7478a8cca67883333b1c98656ef8ad\\"", "size": 182687, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T19:14:59.190Z", "contentLength": 182687, "httpStatusCode": 200}	b6beab06-48f6-413f-a7c2-b66343182b04	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
1789d8c5-db28-42b6-a52d-0265f2faceb5	faturas	triagem/1768072499285_DEZ_francisco_pj.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 19:14:59.336452+00	2026-01-10 19:14:59.336452+00	2026-01-10 19:14:59.336452+00	{"eTag": "\\"3fd467f8573bb1eb1e73ccc58619e417\\"", "size": 182504, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T19:14:59.326Z", "contentLength": 182504, "httpStatusCode": 200}	f5b836ef-abad-45ae-b920-4080bd5e605c	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
5728b67e-cf68-4161-87d5-d4a6f1fb9b37	faturas	triagem/1768072499442_DEZ_kipper.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 19:14:59.510337+00	2026-01-10 19:14:59.510337+00	2026-01-10 19:14:59.510337+00	{"eTag": "\\"d50a33487b3b2dc2c4a2323e07a51400\\"", "size": 182444, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T19:14:59.486Z", "contentLength": 182444, "httpStatusCode": 200}	cccfca77-b89e-4d85-8079-3517b460d81f	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
28affee5-4490-4798-a341-0df735262be2	faturas	triagem/1768072499599_DEZ_landoski.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 19:14:59.634634+00	2026-01-10 19:14:59.634634+00	2026-01-10 19:14:59.634634+00	{"eTag": "\\"ea7da9655b547164a7c360846d867f32\\"", "size": 182608, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T19:14:59.626Z", "contentLength": 182608, "httpStatusCode": 200}	4121f143-f122-46b0-a412-a043f0cf39ba	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
2f80549b-8f85-4e0f-aeb6-b83e4c6fa1ea	faturas	triagem/1768072499698_DEZ_melo.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 19:14:59.735673+00	2026-01-10 19:14:59.735673+00	2026-01-10 19:14:59.735673+00	{"eTag": "\\"486cd01942727cd674a35ff3f297b19f\\"", "size": 182615, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T19:14:59.726Z", "contentLength": 182615, "httpStatusCode": 200}	34b2945b-d6a5-4bdb-afcd-528c5b35223c	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
0bc81325-4a2e-4c58-8f8d-cff18989eb39	faturas	triagem/1768072499804_DEZ_menezes.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-10 19:14:59.845823+00	2026-01-10 19:14:59.845823+00	2026-01-10 19:14:59.845823+00	{"eTag": "\\"bdfd9eeb62bb86bda36b1d77a9c814e5\\"", "size": 182648, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-10T19:14:59.834Z", "contentLength": 182648, "httpStatusCode": 200}	35133268-d998-46cb-bc19-ad8d2820a6d3	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
1cbcbaf3-b359-435f-86ae-7a75a16e4976	faturas	triagem/1768782108466_JAN_miranda.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-19 00:21:49.537021+00	2026-01-19 00:21:49.537021+00	2026-01-19 00:21:49.537021+00	{"eTag": "\\"7db006b6ebdb09b3188310b5c7dd9bf2\\"", "size": 310068, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-19T00:21:49.470Z", "contentLength": 310068, "httpStatusCode": 200}	18c8b17d-55b2-4a39-b5be-4b25e0eddb80	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
7e04a628-e5a8-44bd-a2c2-3ea8101022e6	faturas	triagem/1768782682291_JAN_miranda.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-19 00:31:22.536748+00	2026-01-19 00:31:22.536748+00	2026-01-19 00:31:22.536748+00	{"eTag": "\\"7db006b6ebdb09b3188310b5c7dd9bf2\\"", "size": 310068, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-19T00:31:22.506Z", "contentLength": 310068, "httpStatusCode": 200}	c59c6632-4356-4739-a291-b315944ac8b3	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
dc2d53ed-0c0c-4f8e-9326-876cfd0bf85b	faturas	triagem/1768784217362_JAN_miranda.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-19 00:57:00.01712+00	2026-01-19 00:57:00.01712+00	2026-01-19 00:57:00.01712+00	{"eTag": "\\"7db006b6ebdb09b3188310b5c7dd9bf2\\"", "size": 310068, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-19T00:56:59.777Z", "contentLength": 310068, "httpStatusCode": 200}	a0b7fd0e-7d57-489b-a25e-bb5419cd1da3	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
0f6a58cb-7c18-43d2-b94e-44366bcc00af	faturas	triagem/1768784421851_JAN_miranda.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-19 01:00:23.811921+00	2026-01-19 01:00:23.811921+00	2026-01-19 01:00:23.811921+00	{"eTag": "\\"7db006b6ebdb09b3188310b5c7dd9bf2\\"", "size": 310068, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-19T01:00:23.750Z", "contentLength": 310068, "httpStatusCode": 200}	198dec82-df55-4cea-981c-4aa59e6f9642	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
d31a46ea-4815-4259-bce9-9e76026b1a32	faturas	triagem/1768784737898_JAN_miranda.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-19 01:05:38.038713+00	2026-01-19 01:05:38.038713+00	2026-01-19 01:05:38.038713+00	{"eTag": "\\"7db006b6ebdb09b3188310b5c7dd9bf2\\"", "size": 310068, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-19T01:05:38.020Z", "contentLength": 310068, "httpStatusCode": 200}	4a4de913-c983-4107-85e2-bb4b45501154	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
7f7a828f-46f4-4264-a5a8-e8fdf6c87280	faturas	triagem/1768784955648_JAN_miranda.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-19 01:09:16.336501+00	2026-01-19 01:09:16.336501+00	2026-01-19 01:09:16.336501+00	{"eTag": "\\"7db006b6ebdb09b3188310b5c7dd9bf2\\"", "size": 310068, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-19T01:09:16.262Z", "contentLength": 310068, "httpStatusCode": 200}	e2ea3141-2a0d-4ead-92f7-94ccaa12fb45	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
753d681e-18f2-4871-ace4-5f87e96c27de	faturas	triagem/1768785777036_JAN_miranda.pdf	353dc6dd-22af-4527-b9a5-71ce76e909a8	2026-01-19 01:22:57.442792+00	2026-01-19 01:22:57.442792+00	2026-01-19 01:22:57.442792+00	{"eTag": "\\"7db006b6ebdb09b3188310b5c7dd9bf2\\"", "size": 310068, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-01-19T01:22:57.408Z", "contentLength": 310068, "httpStatusCode": 200}	b110b943-d832-48cf-bdc1-b0598748d108	353dc6dd-22af-4527-b9a5-71ce76e909a8	{}	2
\.


--
-- Data for Name: prefixes; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.prefixes (bucket_id, name, created_at, updated_at) FROM stdin;
faturas	triagem	2025-12-23 23:19:56.357915+00	2025-12-23 23:19:56.357915+00
\.


--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads (id, in_progress_size, upload_signature, bucket_id, key, version, owner_id, created_at, user_metadata) FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads_parts (id, upload_id, size, part_number, bucket_id, key, etag, owner_id, version, created_at) FROM stdin;
\.


--
-- Data for Name: vector_indexes; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.vector_indexes (id, name, bucket_id, data_type, dimension, distance_metric, metadata_configuration, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: hooks; Type: TABLE DATA; Schema: supabase_functions; Owner: supabase_functions_admin
--

COPY supabase_functions.hooks (id, hook_table_id, hook_name, created_at, request_id) FROM stdin;
1	25060	webhook_extract	2026-01-07 00:31:56.273275+00	1
2	25060	webhook_extract	2026-01-07 00:44:54.538188+00	2
3	25060	webhook_extract	2026-01-07 00:51:00.040199+00	3
4	25060	webhook_extract	2026-01-07 01:01:43.596351+00	4
5	25060	webhook_extract	2026-01-07 01:10:47.840916+00	5
6	25060	webhook_extract	2026-01-07 01:28:08.877382+00	6
7	25060	webhook_extract	2026-01-07 16:32:55.936244+00	7
8	25060	webhook_extract	2026-01-07 16:42:43.463318+00	8
9	25060	webhook_extract	2026-01-07 16:55:43.594259+00	9
10	25060	webhook_extract	2026-01-07 17:09:17.316281+00	10
11	25060	webhook_extract	2026-01-07 17:12:17.113803+00	11
12	25060	webhook_extract	2026-01-07 17:33:27.440846+00	12
13	25060	webhook_extract	2026-01-07 17:38:22.943623+00	13
14	25060	webhook_extract	2026-01-07 17:44:54.648292+00	14
15	25060	webhook_extract	2026-01-08 00:55:48.688271+00	15
16	25060	webhook_extract	2026-01-08 22:22:09.178994+00	16
17	25060	webhook_extract	2026-01-08 22:24:07.526234+00	17
18	25060	webhook_extract	2026-01-08 22:28:31.640763+00	18
19	25060	webhook_extract	2026-01-08 22:30:18.903826+00	19
20	25060	webhook_extract	2026-01-08 23:13:52.98864+00	20
21	25060	webhook_extract	2026-01-09 16:22:23.416586+00	1
22	25060	webhook_extract	2026-01-09 16:49:53.848811+00	2
23	25060	webhook_extract	2026-01-09 16:52:28.292236+00	3
24	25060	webhook_extract	2026-01-09 17:42:44.896077+00	1
25	25060	webhook_extract	2026-01-09 17:49:18.024315+00	2
26	25060	webhook_extract	2026-01-09 17:54:12.822183+00	3
27	25060	webhook_extract	2026-01-09 18:05:04.459938+00	4
28	25060	webhook_extract	2026-01-09 19:15:20.154986+00	5
29	25060	webhook_extract	2026-01-09 19:17:50.955055+00	6
30	25060	webhook_extract	2026-01-09 19:19:09.525419+00	7
31	25060	webhook_extract	2026-01-09 19:21:39.204715+00	8
32	25060	webhook_extract	2026-01-09 19:34:37.195551+00	9
33	25060	webhook_extract	2026-01-09 19:40:04.865454+00	10
34	25060	webhook_extract	2026-01-09 19:43:57.704776+00	11
35	25060	webhook_extract	2026-01-09 19:45:29.226937+00	12
36	25060	webhook_extract	2026-01-09 20:18:42.114403+00	13
37	25060	webhook_extract	2026-01-09 20:21:33.127158+00	14
38	25060	webhook_extract	2026-01-09 20:29:10.438066+00	15
39	25060	webhook_extract	2026-01-09 20:29:10.577408+00	16
40	25060	webhook_extract	2026-01-09 20:29:10.671752+00	17
41	25060	webhook_extract	2026-01-09 20:29:10.827679+00	18
42	25060	webhook_extract	2026-01-09 20:29:11.007354+00	19
43	25060	webhook_extract	2026-01-09 20:29:11.103013+00	20
44	25060	webhook_extract	2026-01-09 20:29:11.19265+00	21
45	25060	webhook_extract	2026-01-09 20:30:44.72918+00	22
46	25060	webhook_extract	2026-01-09 20:36:00.156725+00	23
47	25060	webhook_extract	2026-01-09 20:36:00.291724+00	24
48	25060	webhook_extract	2026-01-09 20:36:00.448181+00	25
49	25060	webhook_extract	2026-01-09 20:36:00.587019+00	26
50	25060	webhook_extract	2026-01-09 20:36:00.721684+00	27
51	25060	webhook_extract	2026-01-09 20:36:00.840057+00	28
52	25060	webhook_extract	2026-01-09 20:36:00.927584+00	29
53	25060	webhook_extract	2026-01-09 20:36:01.024251+00	30
54	25060	webhook_extract	2026-01-09 20:36:01.148846+00	31
55	25060	webhook_extract	2026-01-09 20:40:30.966131+00	32
56	25060	webhook_extract	2026-01-09 20:40:31.088542+00	33
57	25060	webhook_extract	2026-01-09 20:40:31.235532+00	34
58	25060	webhook_extract	2026-01-09 20:40:31.359623+00	35
59	25060	webhook_extract	2026-01-09 20:40:31.443044+00	36
60	25060	webhook_extract	2026-01-09 20:40:31.51949+00	37
61	25060	webhook_extract	2026-01-09 20:40:31.598361+00	38
62	25060	webhook_extract	2026-01-09 20:40:31.67153+00	39
63	25060	webhook_extract	2026-01-09 20:40:31.744941+00	40
64	25060	webhook_extract	2026-01-09 20:42:27.915842+00	41
65	25060	webhook_extract	2026-01-09 20:42:28.066274+00	42
66	25060	webhook_extract	2026-01-09 20:42:28.298838+00	43
67	25060	webhook_extract	2026-01-09 20:42:28.380117+00	44
68	25060	webhook_extract	2026-01-09 20:42:28.522029+00	45
69	25060	webhook_extract	2026-01-09 20:42:28.602971+00	46
70	25060	webhook_extract	2026-01-09 20:42:28.671675+00	47
71	25060	webhook_extract	2026-01-09 20:42:28.764615+00	48
72	25060	webhook_extract	2026-01-09 20:42:28.839424+00	49
73	25060	webhook_extract	2026-01-09 20:44:07.500746+00	50
74	25060	webhook_extract	2026-01-09 20:44:07.699503+00	51
75	25060	webhook_extract	2026-01-09 20:44:07.915094+00	52
76	25060	webhook_extract	2026-01-09 20:44:07.993542+00	53
77	25060	webhook_extract	2026-01-09 20:44:08.063146+00	54
78	25060	webhook_extract	2026-01-09 20:44:08.141108+00	55
79	25060	webhook_extract	2026-01-09 20:44:08.221224+00	56
80	25060	webhook_extract	2026-01-09 20:44:08.304213+00	57
81	25060	webhook_extract	2026-01-09 20:46:01.700053+00	58
82	25060	webhook_extract	2026-01-09 20:46:01.881858+00	59
83	25060	webhook_extract	2026-01-09 20:46:02.051165+00	60
84	25060	webhook_extract	2026-01-09 20:46:02.136119+00	61
85	25060	webhook_extract	2026-01-09 20:46:02.237816+00	62
86	25060	webhook_extract	2026-01-09 20:46:02.31737+00	63
87	25060	webhook_extract	2026-01-09 20:46:02.395345+00	64
88	25060	webhook_extract	2026-01-09 20:47:40.880139+00	65
89	25060	webhook_extract	2026-01-09 20:47:41.013399+00	66
90	25060	webhook_extract	2026-01-09 20:47:41.171432+00	67
91	25060	webhook_extract	2026-01-09 20:47:41.270262+00	68
92	25060	webhook_extract	2026-01-09 20:47:41.380106+00	69
93	25060	webhook_extract	2026-01-09 20:47:41.473886+00	70
94	25060	webhook_extract	2026-01-09 20:47:41.568864+00	71
95	25060	webhook_extract	2026-01-09 20:49:05.08757+00	72
96	25060	webhook_extract	2026-01-09 20:49:05.223952+00	73
97	25060	webhook_extract	2026-01-09 20:49:05.377558+00	74
98	25060	webhook_extract	2026-01-09 20:49:05.476871+00	75
99	25060	webhook_extract	2026-01-09 20:49:05.559409+00	76
100	25060	webhook_extract	2026-01-09 20:49:17.812891+00	77
101	25060	webhook_extract	2026-01-09 20:49:33.056157+00	78
102	25060	webhook_extract	2026-01-10 10:52:27.869266+00	79
103	25060	webhook_extract	2026-01-10 11:05:23.750283+00	80
104	25060	webhook_extract	2026-01-10 11:07:44.245107+00	81
105	25060	webhook_extract	2026-01-10 11:11:55.946201+00	82
106	25060	webhook_extract	2026-01-10 11:21:20.108589+00	83
107	25060	webhook_extract	2026-01-10 12:04:37.614588+00	84
108	25060	webhook_extract	2026-01-10 12:06:20.362705+00	85
109	25060	webhook_extract	2026-01-10 14:08:26.15809+00	86
110	25060	webhook_extract	2026-01-10 14:09:51.509328+00	87
111	25060	webhook_extract	2026-01-10 14:19:14.020473+00	88
112	25060	webhook_extract	2026-01-10 14:23:33.324244+00	89
113	25060	webhook_extract	2026-01-10 14:29:24.007563+00	90
114	25060	webhook_extract	2026-01-10 14:32:50.608649+00	91
147	25060	webhook_extract	2026-01-10 15:14:17.999909+00	1
148	25060	webhook_extract	2026-01-10 15:16:44.977809+00	2
149	25060	webhook_extract	2026-01-10 15:19:09.423735+00	3
150	25060	webhook_extract	2026-01-10 15:23:42.195733+00	4
151	25060	webhook_extract	2026-01-10 15:43:24.442811+00	5
152	25060	webhook_extract	2026-01-10 15:45:24.203953+00	6
153	25060	webhook_extract	2026-01-10 15:49:28.73229+00	7
154	25060	webhook_extract	2026-01-10 16:29:08.879683+00	8
155	25060	webhook_extract	2026-01-10 16:32:57.715329+00	9
156	25060	webhook_extract	2026-01-10 16:36:32.761054+00	10
157	25060	webhook_extract	2026-01-10 16:40:36.050787+00	11
158	25060	webhook_extract	2026-01-10 16:42:49.65379+00	12
159	25060	webhook_extract	2026-01-10 16:47:10.290248+00	13
160	25060	webhook_extract	2026-01-10 16:53:08.524375+00	14
161	25060	webhook_extract	2026-01-10 17:09:35.625144+00	15
162	25060	webhook_extract	2026-01-10 17:19:56.656789+00	16
163	25060	webhook_extract	2026-01-10 17:21:40.981648+00	17
164	25060	webhook_extract	2026-01-10 17:27:02.328938+00	18
165	25060	webhook_extract	2026-01-10 17:35:24.943891+00	19
166	25060	webhook_extract	2026-01-10 17:46:01.813584+00	20
167	25060	webhook_extract	2026-01-10 17:47:34.197971+00	21
168	25060	webhook_extract	2026-01-10 17:48:30.025923+00	22
169	25060	webhook_extract	2026-01-10 18:35:51.758248+00	23
170	25060	webhook_extract	2026-01-10 18:35:51.936007+00	24
171	25060	webhook_extract	2026-01-10 18:43:37.144415+00	25
172	25060	webhook_extract	2026-01-10 18:46:20.016307+00	26
173	25060	webhook_extract	2026-01-10 18:46:37.276527+00	27
174	25060	webhook_extract	2026-01-10 18:55:37.054743+00	28
175	25060	webhook_extract	2026-01-10 18:55:37.14941+00	29
176	25060	webhook_extract	2026-01-10 18:55:37.232307+00	30
177	25060	webhook_extract	2026-01-10 18:55:37.431948+00	31
178	25060	webhook_extract	2026-01-10 18:55:37.570766+00	32
179	25060	webhook_extract	2026-01-10 18:55:37.669517+00	33
180	25060	webhook_extract	2026-01-10 18:55:37.763625+00	34
181	25060	webhook_extract	2026-01-10 18:55:37.841869+00	35
182	25060	webhook_extract	2026-01-10 18:55:37.928626+00	36
183	25060	webhook_extract	2026-01-10 18:55:38.024661+00	37
184	25060	webhook_extract	2026-01-10 18:55:38.134064+00	38
185	25060	webhook_extract	2026-01-10 18:55:38.221401+00	39
186	25060	webhook_extract	2026-01-10 18:55:38.312382+00	40
187	25060	webhook_extract	2026-01-10 18:55:38.4331+00	41
188	25060	webhook_extract	2026-01-10 18:55:38.538903+00	42
189	25060	webhook_extract	2026-01-10 18:55:38.636018+00	43
190	25060	webhook_extract	2026-01-10 18:55:38.713714+00	44
191	25060	webhook_extract	2026-01-10 18:55:38.809311+00	45
192	25060	webhook_extract	2026-01-10 18:55:38.886402+00	46
193	25060	webhook_extract	2026-01-10 18:55:38.971431+00	47
194	25060	webhook_extract	2026-01-10 18:55:39.114143+00	48
195	25060	webhook_extract	2026-01-10 18:55:39.20441+00	49
196	25060	webhook_extract	2026-01-10 18:55:39.296677+00	50
197	25060	webhook_extract	2026-01-10 18:55:39.379571+00	51
198	25060	webhook_extract	2026-01-10 18:55:39.512431+00	52
199	25060	webhook_extract	2026-01-10 18:55:39.623281+00	53
200	25060	webhook_extract	2026-01-10 18:55:39.740868+00	54
201	25060	webhook_extract	2026-01-10 18:55:39.830824+00	55
202	25060	webhook_extract	2026-01-10 18:55:39.941783+00	56
203	25060	webhook_extract	2026-01-10 18:55:40.023783+00	57
204	25060	webhook_extract	2026-01-10 18:55:40.126422+00	58
205	25060	webhook_extract	2026-01-10 18:55:40.230447+00	59
206	25060	webhook_extract	2026-01-10 18:55:40.330555+00	60
207	25060	webhook_extract	2026-01-10 18:55:40.41739+00	61
208	25060	webhook_extract	2026-01-10 18:55:40.509518+00	62
209	25060	webhook_extract	2026-01-10 18:55:40.604292+00	63
210	25060	webhook_extract	2026-01-10 18:55:40.706591+00	64
211	25060	webhook_extract	2026-01-10 18:55:40.812379+00	65
212	25060	webhook_extract	2026-01-10 18:55:40.931701+00	66
213	25060	webhook_extract	2026-01-10 18:55:41.021036+00	67
214	25060	webhook_extract	2026-01-10 18:55:41.115456+00	68
215	25060	webhook_extract	2026-01-10 18:55:41.211328+00	69
216	25060	webhook_extract	2026-01-10 18:55:41.304656+00	70
217	25060	webhook_extract	2026-01-10 18:55:41.406017+00	71
218	25060	webhook_extract	2026-01-10 18:55:41.485698+00	72
219	25060	webhook_extract	2026-01-10 18:55:41.59034+00	73
220	25060	webhook_extract	2026-01-10 18:55:41.693268+00	74
221	25060	webhook_extract	2026-01-10 18:55:41.789772+00	75
222	25060	webhook_extract	2026-01-10 18:55:41.871937+00	76
223	25060	webhook_extract	2026-01-10 18:55:41.988722+00	77
224	25060	webhook_extract	2026-01-10 18:55:42.088965+00	78
225	25060	webhook_extract	2026-01-10 18:55:42.188235+00	79
226	25060	webhook_extract	2026-01-10 18:55:42.293215+00	80
227	25060	webhook_extract	2026-01-10 18:55:42.388663+00	81
228	25060	webhook_extract	2026-01-10 18:55:42.468267+00	82
229	25060	webhook_extract	2026-01-10 18:55:42.554379+00	83
230	25060	webhook_extract	2026-01-10 18:55:42.639934+00	84
231	25060	webhook_extract	2026-01-10 19:14:59.031677+00	85
232	25060	webhook_extract	2026-01-10 19:14:59.144209+00	86
233	25060	webhook_extract	2026-01-10 19:14:59.259007+00	87
234	25060	webhook_extract	2026-01-10 19:14:59.405739+00	88
235	25060	webhook_extract	2026-01-10 19:14:59.584152+00	89
236	25060	webhook_extract	2026-01-10 19:14:59.682376+00	90
237	25060	webhook_extract	2026-01-10 19:14:59.787828+00	91
238	25060	webhook_extract	2026-01-10 19:14:59.896737+00	92
239	25060	webhook_extract	2026-01-19 00:21:49.758994+00	1
240	25060	webhook_extract	2026-01-19 00:31:22.631196+00	2
241	25060	webhook_extract	2026-01-19 00:57:00.609195+00	3
242	25060	webhook_extract	2026-01-19 01:00:24.047152+00	4
243	25060	webhook_extract	2026-01-19 01:05:38.129402+00	5
244	25060	webhook_extract	2026-01-19 01:09:16.688797+00	6
245	25060	webhook_extract	2026-01-19 01:22:58.399819+00	7
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: supabase_functions; Owner: supabase_functions_admin
--

COPY supabase_functions.migrations (version, inserted_at) FROM stdin;
initial	2025-12-22 18:25:56.272862+00
20210809183423_update_grants	2025-12-22 18:25:56.272862+00
\.


--
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: supabase_admin
--

COPY vault.secrets (id, name, description, secret, key_id, nonce, created_at, updated_at) FROM stdin;
\.


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('auth.refresh_tokens_id_seq', 249, true);


--
-- Name: subscription_id_seq; Type: SEQUENCE SET; Schema: realtime; Owner: supabase_admin
--

SELECT pg_catalog.setval('realtime.subscription_id_seq', 1, false);


--
-- Name: hooks_id_seq; Type: SEQUENCE SET; Schema: supabase_functions; Owner: supabase_functions_admin
--

SELECT pg_catalog.setval('supabase_functions.hooks_id_seq', 245, true);


--
-- Name: extensions extensions_pkey; Type: CONSTRAINT; Schema: _realtime; Owner: supabase_admin
--

ALTER TABLE ONLY _realtime.extensions
    ADD CONSTRAINT extensions_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: _realtime; Owner: supabase_admin
--

ALTER TABLE ONLY _realtime.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: tenants tenants_pkey; Type: CONSTRAINT; Schema: _realtime; Owner: supabase_admin
--

ALTER TABLE ONLY _realtime.tenants
    ADD CONSTRAINT tenants_pkey PRIMARY KEY (id);


--
-- Name: mfa_amr_claims amr_id_pk; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT amr_id_pk PRIMARY KEY (id);


--
-- Name: audit_log_entries audit_log_entries_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.audit_log_entries
    ADD CONSTRAINT audit_log_entries_pkey PRIMARY KEY (id);


--
-- Name: flow_state flow_state_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.flow_state
    ADD CONSTRAINT flow_state_pkey PRIMARY KEY (id);


--
-- Name: identities identities_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_pkey PRIMARY KEY (id);


--
-- Name: identities identities_provider_id_provider_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_provider_id_provider_unique UNIQUE (provider_id, provider);


--
-- Name: instances instances_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.instances
    ADD CONSTRAINT instances_pkey PRIMARY KEY (id);


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_authentication_method_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_authentication_method_pkey UNIQUE (session_id, authentication_method);


--
-- Name: mfa_challenges mfa_challenges_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_pkey PRIMARY KEY (id);


--
-- Name: mfa_factors mfa_factors_last_challenged_at_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_last_challenged_at_key UNIQUE (last_challenged_at);


--
-- Name: mfa_factors mfa_factors_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_pkey PRIMARY KEY (id);


--
-- Name: oauth_authorizations oauth_authorizations_authorization_code_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_authorization_code_key UNIQUE (authorization_code);


--
-- Name: oauth_authorizations oauth_authorizations_authorization_id_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_authorization_id_key UNIQUE (authorization_id);


--
-- Name: oauth_authorizations oauth_authorizations_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_pkey PRIMARY KEY (id);


--
-- Name: oauth_client_states oauth_client_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_client_states
    ADD CONSTRAINT oauth_client_states_pkey PRIMARY KEY (id);


--
-- Name: oauth_clients oauth_clients_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_clients
    ADD CONSTRAINT oauth_clients_pkey PRIMARY KEY (id);


--
-- Name: oauth_consents oauth_consents_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_pkey PRIMARY KEY (id);


--
-- Name: oauth_consents oauth_consents_user_client_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_user_client_unique UNIQUE (user_id, client_id);


--
-- Name: one_time_tokens one_time_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_token_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_token_unique UNIQUE (token);


--
-- Name: saml_providers saml_providers_entity_id_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_entity_id_key UNIQUE (entity_id);


--
-- Name: saml_providers saml_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_pkey PRIMARY KEY (id);


--
-- Name: saml_relay_states saml_relay_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sso_domains sso_domains_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_pkey PRIMARY KEY (id);


--
-- Name: sso_providers sso_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_providers
    ADD CONSTRAINT sso_providers_pkey PRIMARY KEY (id);


--
-- Name: sso_sessions sso_sessions_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_admin
--

ALTER TABLE ONLY auth.sso_sessions
    ADD CONSTRAINT sso_sessions_pkey PRIMARY KEY (id);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: clientes clientes_codigo_cliente_key; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_codigo_cliente_key UNIQUE (codigo_cliente);


--
-- Name: clientes clientes_cpf_codigo_uc; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_cpf_codigo_uc UNIQUE (cpf_cnpj, codigo_cliente);


--
-- Name: clientes clientes_email_key; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_email_key UNIQUE (email);


--
-- Name: clientes clientes_numero_medidor_key; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_numero_medidor_key UNIQUE (numero_medidor);


--
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id);


--
-- Name: cobrancas cobrancas_fatura_id_unique; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.cobrancas
    ADD CONSTRAINT cobrancas_fatura_id_unique UNIQUE (fatura_id);


--
-- Name: cobrancas cobrancas_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.cobrancas
    ADD CONSTRAINT cobrancas_pkey PRIMARY KEY (id);


--
-- Name: economia_gerada economia_gerada_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.economia_gerada
    ADD CONSTRAINT economia_gerada_pkey PRIMARY KEY (id);


--
-- Name: faturas faturas_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.faturas
    ADD CONSTRAINT faturas_pkey PRIMARY KEY (id);


--
-- Name: itens_faturados itens_faturados_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.itens_faturados
    ADD CONSTRAINT itens_faturados_pkey PRIMARY KEY (id);


--
-- Name: lista_espera lista_espera_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.lista_espera
    ADD CONSTRAINT lista_espera_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: cobrancas unique_fatura_cobranca; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.cobrancas
    ADD CONSTRAINT unique_fatura_cobranca UNIQUE (fatura_id);


--
-- Name: economia_gerada unique_fatura_economia; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.economia_gerada
    ADD CONSTRAINT unique_fatura_economia UNIQUE (fatura_id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE ONLY realtime.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2026_01_16 messages_2026_01_16_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2026_01_16
    ADD CONSTRAINT messages_2026_01_16_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2026_01_17 messages_2026_01_17_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2026_01_17
    ADD CONSTRAINT messages_2026_01_17_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2026_01_18 messages_2026_01_18_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2026_01_18
    ADD CONSTRAINT messages_2026_01_18_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2026_01_19 messages_2026_01_19_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2026_01_19
    ADD CONSTRAINT messages_2026_01_19_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2026_01_20 messages_2026_01_20_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2026_01_20
    ADD CONSTRAINT messages_2026_01_20_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2026_01_21 messages_2026_01_21_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2026_01_21
    ADD CONSTRAINT messages_2026_01_21_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2026_01_22 messages_2026_01_22_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2026_01_22
    ADD CONSTRAINT messages_2026_01_22_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: subscription pk_subscription; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.subscription
    ADD CONSTRAINT pk_subscription PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: buckets_analytics buckets_analytics_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets_analytics
    ADD CONSTRAINT buckets_analytics_pkey PRIMARY KEY (id);


--
-- Name: buckets buckets_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets
    ADD CONSTRAINT buckets_pkey PRIMARY KEY (id);


--
-- Name: buckets_vectors buckets_vectors_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets_vectors
    ADD CONSTRAINT buckets_vectors_pkey PRIMARY KEY (id);


--
-- Name: iceberg_namespaces iceberg_namespaces_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.iceberg_namespaces
    ADD CONSTRAINT iceberg_namespaces_pkey PRIMARY KEY (id);


--
-- Name: iceberg_tables iceberg_tables_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.iceberg_tables
    ADD CONSTRAINT iceberg_tables_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_name_key; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_name_key UNIQUE (name);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: objects objects_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT objects_pkey PRIMARY KEY (id);


--
-- Name: prefixes prefixes_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.prefixes
    ADD CONSTRAINT prefixes_pkey PRIMARY KEY (bucket_id, level, name);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_pkey PRIMARY KEY (id);


--
-- Name: vector_indexes vector_indexes_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.vector_indexes
    ADD CONSTRAINT vector_indexes_pkey PRIMARY KEY (id);


--
-- Name: hooks hooks_pkey; Type: CONSTRAINT; Schema: supabase_functions; Owner: supabase_functions_admin
--

ALTER TABLE ONLY supabase_functions.hooks
    ADD CONSTRAINT hooks_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: supabase_functions; Owner: supabase_functions_admin
--

ALTER TABLE ONLY supabase_functions.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- Name: extensions_tenant_external_id_index; Type: INDEX; Schema: _realtime; Owner: supabase_admin
--

CREATE INDEX extensions_tenant_external_id_index ON _realtime.extensions USING btree (tenant_external_id);


--
-- Name: extensions_tenant_external_id_type_index; Type: INDEX; Schema: _realtime; Owner: supabase_admin
--

CREATE UNIQUE INDEX extensions_tenant_external_id_type_index ON _realtime.extensions USING btree (tenant_external_id, type);


--
-- Name: tenants_external_id_index; Type: INDEX; Schema: _realtime; Owner: supabase_admin
--

CREATE UNIQUE INDEX tenants_external_id_index ON _realtime.tenants USING btree (external_id);


--
-- Name: audit_logs_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX audit_logs_instance_id_idx ON auth.audit_log_entries USING btree (instance_id);


--
-- Name: confirmation_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX confirmation_token_idx ON auth.users USING btree (confirmation_token) WHERE ((confirmation_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_current_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_current_idx ON auth.users USING btree (email_change_token_current) WHERE ((email_change_token_current)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_new_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_new_idx ON auth.users USING btree (email_change_token_new) WHERE ((email_change_token_new)::text !~ '^[0-9 ]*$'::text);


--
-- Name: factor_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX factor_id_created_at_idx ON auth.mfa_factors USING btree (user_id, created_at);


--
-- Name: flow_state_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX flow_state_created_at_idx ON auth.flow_state USING btree (created_at DESC);


--
-- Name: identities_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_email_idx ON auth.identities USING btree (email text_pattern_ops);


--
-- Name: INDEX identities_email_idx; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.identities_email_idx IS 'Auth: Ensures indexed queries on the email column';


--
-- Name: identities_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_user_id_idx ON auth.identities USING btree (user_id);


--
-- Name: idx_auth_code; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_auth_code ON auth.flow_state USING btree (auth_code);


--
-- Name: idx_oauth_client_states_created_at; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_oauth_client_states_created_at ON auth.oauth_client_states USING btree (created_at);


--
-- Name: idx_user_id_auth_method; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_user_id_auth_method ON auth.flow_state USING btree (user_id, authentication_method);


--
-- Name: mfa_challenge_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_challenge_created_at_idx ON auth.mfa_challenges USING btree (created_at DESC);


--
-- Name: mfa_factors_user_friendly_name_unique; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX mfa_factors_user_friendly_name_unique ON auth.mfa_factors USING btree (friendly_name, user_id) WHERE (TRIM(BOTH FROM friendly_name) <> ''::text);


--
-- Name: mfa_factors_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_factors_user_id_idx ON auth.mfa_factors USING btree (user_id);


--
-- Name: oauth_auth_pending_exp_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_auth_pending_exp_idx ON auth.oauth_authorizations USING btree (expires_at) WHERE (status = 'pending'::auth.oauth_authorization_status);


--
-- Name: oauth_clients_deleted_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_clients_deleted_at_idx ON auth.oauth_clients USING btree (deleted_at);


--
-- Name: oauth_consents_active_client_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_consents_active_client_idx ON auth.oauth_consents USING btree (client_id) WHERE (revoked_at IS NULL);


--
-- Name: oauth_consents_active_user_client_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_consents_active_user_client_idx ON auth.oauth_consents USING btree (user_id, client_id) WHERE (revoked_at IS NULL);


--
-- Name: oauth_consents_user_order_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_consents_user_order_idx ON auth.oauth_consents USING btree (user_id, granted_at DESC);


--
-- Name: one_time_tokens_relates_to_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_relates_to_hash_idx ON auth.one_time_tokens USING hash (relates_to);


--
-- Name: one_time_tokens_token_hash_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_token_hash_hash_idx ON auth.one_time_tokens USING hash (token_hash);


--
-- Name: one_time_tokens_user_id_token_type_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX one_time_tokens_user_id_token_type_key ON auth.one_time_tokens USING btree (user_id, token_type);


--
-- Name: reauthentication_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX reauthentication_token_idx ON auth.users USING btree (reauthentication_token) WHERE ((reauthentication_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: recovery_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX recovery_token_idx ON auth.users USING btree (recovery_token) WHERE ((recovery_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: refresh_tokens_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_idx ON auth.refresh_tokens USING btree (instance_id);


--
-- Name: refresh_tokens_instance_id_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_user_id_idx ON auth.refresh_tokens USING btree (instance_id, user_id);


--
-- Name: refresh_tokens_parent_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_parent_idx ON auth.refresh_tokens USING btree (parent);


--
-- Name: refresh_tokens_session_id_revoked_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_session_id_revoked_idx ON auth.refresh_tokens USING btree (session_id, revoked);


--
-- Name: refresh_tokens_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_token_idx ON auth.refresh_tokens USING btree (token);


--
-- Name: refresh_tokens_updated_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_updated_at_idx ON auth.refresh_tokens USING btree (updated_at DESC);


--
-- Name: saml_providers_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_providers_sso_provider_id_idx ON auth.saml_providers USING btree (sso_provider_id);


--
-- Name: saml_relay_states_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_created_at_idx ON auth.saml_relay_states USING btree (created_at DESC);


--
-- Name: saml_relay_states_for_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_for_email_idx ON auth.saml_relay_states USING btree (for_email);


--
-- Name: saml_relay_states_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_sso_provider_id_idx ON auth.saml_relay_states USING btree (sso_provider_id);


--
-- Name: sessions_not_after_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_not_after_idx ON auth.sessions USING btree (not_after DESC);


--
-- Name: sessions_oauth_client_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_oauth_client_id_idx ON auth.sessions USING btree (oauth_client_id);


--
-- Name: sessions_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_user_id_idx ON auth.sessions USING btree (user_id);


--
-- Name: sso_domains_domain_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_domains_domain_idx ON auth.sso_domains USING btree (lower(domain));


--
-- Name: sso_domains_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sso_domains_sso_provider_id_idx ON auth.sso_domains USING btree (sso_provider_id);


--
-- Name: sso_providers_resource_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_providers_resource_id_idx ON auth.sso_providers USING btree (lower(resource_id));


--
-- Name: sso_providers_resource_id_pattern_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sso_providers_resource_id_pattern_idx ON auth.sso_providers USING btree (resource_id text_pattern_ops);


--
-- Name: sso_sessions_session_id_idx; Type: INDEX; Schema: auth; Owner: supabase_admin
--

CREATE INDEX sso_sessions_session_id_idx ON auth.sso_sessions USING btree (session_id);


--
-- Name: sso_sessions_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_admin
--

CREATE INDEX sso_sessions_sso_provider_id_idx ON auth.sso_sessions USING btree (sso_provider_id);


--
-- Name: unique_phone_factor_per_user; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX unique_phone_factor_per_user ON auth.mfa_factors USING btree (user_id, phone);


--
-- Name: user_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX user_id_created_at_idx ON auth.sessions USING btree (user_id, created_at);


--
-- Name: users_email_partial_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX users_email_partial_key ON auth.users USING btree (email) WHERE (is_sso_user = false);


--
-- Name: INDEX users_email_partial_key; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.users_email_partial_key IS 'Auth: A partial unique index that applies only when is_sso_user is false';


--
-- Name: users_instance_id_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_email_idx ON auth.users USING btree (instance_id, lower((email)::text));


--
-- Name: users_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_idx ON auth.users USING btree (instance_id);


--
-- Name: users_is_anonymous_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_is_anonymous_idx ON auth.users USING btree (is_anonymous);


--
-- Name: idx_faturas_match; Type: INDEX; Schema: public; Owner: supabase_admin
--

CREATE INDEX idx_faturas_match ON public.faturas USING btree (codigo_cliente, numero_medidor);


--
-- Name: idx_itens_faturados_fatura_id; Type: INDEX; Schema: public; Owner: supabase_admin
--

CREATE INDEX idx_itens_faturados_fatura_id ON public.itens_faturados USING btree (fatura_id);


--
-- Name: schema_migrations_version_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX schema_migrations_version_idx ON public.schema_migrations USING btree (version);


--
-- Name: ix_realtime_subscription_entity; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX ix_realtime_subscription_entity ON realtime.subscription USING btree (entity);


--
-- Name: messages_inserted_at_topic_index; Type: INDEX; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE INDEX messages_inserted_at_topic_index ON ONLY realtime.messages USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2026_01_16_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX messages_2026_01_16_inserted_at_topic_idx ON realtime.messages_2026_01_16 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2026_01_17_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX messages_2026_01_17_inserted_at_topic_idx ON realtime.messages_2026_01_17 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2026_01_18_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX messages_2026_01_18_inserted_at_topic_idx ON realtime.messages_2026_01_18 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2026_01_19_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX messages_2026_01_19_inserted_at_topic_idx ON realtime.messages_2026_01_19 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2026_01_20_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX messages_2026_01_20_inserted_at_topic_idx ON realtime.messages_2026_01_20 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2026_01_21_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX messages_2026_01_21_inserted_at_topic_idx ON realtime.messages_2026_01_21 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2026_01_22_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX messages_2026_01_22_inserted_at_topic_idx ON realtime.messages_2026_01_22 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: subscription_subscription_id_entity_filters_key; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE UNIQUE INDEX subscription_subscription_id_entity_filters_key ON realtime.subscription USING btree (subscription_id, entity, filters);


--
-- Name: bname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bname ON storage.buckets USING btree (name);


--
-- Name: bucketid_objname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bucketid_objname ON storage.objects USING btree (bucket_id, name);


--
-- Name: buckets_analytics_unique_name_idx; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX buckets_analytics_unique_name_idx ON storage.buckets_analytics USING btree (name) WHERE (deleted_at IS NULL);


--
-- Name: idx_iceberg_namespaces_bucket_id; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX idx_iceberg_namespaces_bucket_id ON storage.iceberg_namespaces USING btree (catalog_id, name);


--
-- Name: idx_iceberg_tables_location; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX idx_iceberg_tables_location ON storage.iceberg_tables USING btree (location);


--
-- Name: idx_iceberg_tables_namespace_id; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX idx_iceberg_tables_namespace_id ON storage.iceberg_tables USING btree (catalog_id, namespace_id, name);


--
-- Name: idx_multipart_uploads_list; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_multipart_uploads_list ON storage.s3_multipart_uploads USING btree (bucket_id, key, created_at);


--
-- Name: idx_name_bucket_level_unique; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX idx_name_bucket_level_unique ON storage.objects USING btree (name COLLATE "C", bucket_id, level);


--
-- Name: idx_objects_bucket_id_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_objects_bucket_id_name ON storage.objects USING btree (bucket_id, name COLLATE "C");


--
-- Name: idx_objects_lower_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_objects_lower_name ON storage.objects USING btree ((path_tokens[level]), lower(name) text_pattern_ops, bucket_id, level);


--
-- Name: idx_prefixes_lower_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_prefixes_lower_name ON storage.prefixes USING btree (bucket_id, level, ((string_to_array(name, '/'::text))[level]), lower(name) text_pattern_ops);


--
-- Name: name_prefix_search; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX name_prefix_search ON storage.objects USING btree (name text_pattern_ops);


--
-- Name: objects_bucket_id_level_idx; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX objects_bucket_id_level_idx ON storage.objects USING btree (bucket_id, level, name COLLATE "C");


--
-- Name: vector_indexes_name_bucket_id_idx; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX vector_indexes_name_bucket_id_idx ON storage.vector_indexes USING btree (name, bucket_id);


--
-- Name: supabase_functions_hooks_h_table_id_h_name_idx; Type: INDEX; Schema: supabase_functions; Owner: supabase_functions_admin
--

CREATE INDEX supabase_functions_hooks_h_table_id_h_name_idx ON supabase_functions.hooks USING btree (hook_table_id, hook_name);


--
-- Name: supabase_functions_hooks_request_id_idx; Type: INDEX; Schema: supabase_functions; Owner: supabase_functions_admin
--

CREATE INDEX supabase_functions_hooks_request_id_idx ON supabase_functions.hooks USING btree (request_id);


--
-- Name: messages_2026_01_16_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2026_01_16_inserted_at_topic_idx;


--
-- Name: messages_2026_01_16_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2026_01_16_pkey;


--
-- Name: messages_2026_01_17_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2026_01_17_inserted_at_topic_idx;


--
-- Name: messages_2026_01_17_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2026_01_17_pkey;


--
-- Name: messages_2026_01_18_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2026_01_18_inserted_at_topic_idx;


--
-- Name: messages_2026_01_18_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2026_01_18_pkey;


--
-- Name: messages_2026_01_19_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2026_01_19_inserted_at_topic_idx;


--
-- Name: messages_2026_01_19_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2026_01_19_pkey;


--
-- Name: messages_2026_01_20_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2026_01_20_inserted_at_topic_idx;


--
-- Name: messages_2026_01_20_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2026_01_20_pkey;


--
-- Name: messages_2026_01_21_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2026_01_21_inserted_at_topic_idx;


--
-- Name: messages_2026_01_21_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2026_01_21_pkey;


--
-- Name: messages_2026_01_22_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2026_01_22_inserted_at_topic_idx;


--
-- Name: messages_2026_01_22_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2026_01_22_pkey;


--
-- Name: faturas webhook_extract; Type: TRIGGER; Schema: public; Owner: supabase_admin
--

CREATE TRIGGER webhook_extract AFTER INSERT ON public.faturas FOR EACH ROW EXECUTE FUNCTION supabase_functions.http_request('https://uncalibrated-interhemal-cheree.ngrok-free.dev/webhook/fatura', 'POST', '{"Content-type":"application/json"}', '{}', '5000');


--
-- Name: subscription tr_check_filters; Type: TRIGGER; Schema: realtime; Owner: supabase_admin
--

CREATE TRIGGER tr_check_filters BEFORE INSERT OR UPDATE ON realtime.subscription FOR EACH ROW EXECUTE FUNCTION realtime.subscription_check_filters();


--
-- Name: buckets enforce_bucket_name_length_trigger; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER enforce_bucket_name_length_trigger BEFORE INSERT OR UPDATE OF name ON storage.buckets FOR EACH ROW EXECUTE FUNCTION storage.enforce_bucket_name_length();


--
-- Name: objects objects_delete_delete_prefix; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER objects_delete_delete_prefix AFTER DELETE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.delete_prefix_hierarchy_trigger();


--
-- Name: objects objects_insert_create_prefix; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER objects_insert_create_prefix BEFORE INSERT ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.objects_insert_prefix_trigger();


--
-- Name: objects objects_update_create_prefix; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER objects_update_create_prefix BEFORE UPDATE ON storage.objects FOR EACH ROW WHEN (((new.name <> old.name) OR (new.bucket_id <> old.bucket_id))) EXECUTE FUNCTION storage.objects_update_prefix_trigger();


--
-- Name: prefixes prefixes_create_hierarchy; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER prefixes_create_hierarchy BEFORE INSERT ON storage.prefixes FOR EACH ROW WHEN ((pg_trigger_depth() < 1)) EXECUTE FUNCTION storage.prefixes_insert_trigger();


--
-- Name: prefixes prefixes_delete_hierarchy; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER prefixes_delete_hierarchy AFTER DELETE ON storage.prefixes FOR EACH ROW EXECUTE FUNCTION storage.delete_prefix_hierarchy_trigger();


--
-- Name: objects update_objects_updated_at; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER update_objects_updated_at BEFORE UPDATE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.update_updated_at_column();


--
-- Name: extensions extensions_tenant_external_id_fkey; Type: FK CONSTRAINT; Schema: _realtime; Owner: supabase_admin
--

ALTER TABLE ONLY _realtime.extensions
    ADD CONSTRAINT extensions_tenant_external_id_fkey FOREIGN KEY (tenant_external_id) REFERENCES _realtime.tenants(external_id) ON DELETE CASCADE;


--
-- Name: identities identities_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: mfa_challenges mfa_challenges_auth_factor_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_auth_factor_id_fkey FOREIGN KEY (factor_id) REFERENCES auth.mfa_factors(id) ON DELETE CASCADE;


--
-- Name: mfa_factors mfa_factors_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: oauth_authorizations oauth_authorizations_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_client_id_fkey FOREIGN KEY (client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: oauth_authorizations oauth_authorizations_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: oauth_consents oauth_consents_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_client_id_fkey FOREIGN KEY (client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: oauth_consents oauth_consents_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: one_time_tokens one_time_tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: refresh_tokens refresh_tokens_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: saml_providers saml_providers_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_flow_state_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_flow_state_id_fkey FOREIGN KEY (flow_state_id) REFERENCES auth.flow_state(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_oauth_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_oauth_client_id_fkey FOREIGN KEY (oauth_client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: sso_domains sso_domains_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: sso_sessions sso_sessions_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_admin
--

ALTER TABLE ONLY auth.sso_sessions
    ADD CONSTRAINT sso_sessions_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: sso_sessions sso_sessions_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_admin
--

ALTER TABLE ONLY auth.sso_sessions
    ADD CONSTRAINT sso_sessions_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: cobrancas cobrancas_cliente_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.cobrancas
    ADD CONSTRAINT cobrancas_cliente_id_fkey FOREIGN KEY (cliente_id) REFERENCES public.clientes(id);


--
-- Name: cobrancas cobrancas_fatura_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.cobrancas
    ADD CONSTRAINT cobrancas_fatura_id_fkey FOREIGN KEY (fatura_id) REFERENCES public.faturas(id) ON DELETE CASCADE;


--
-- Name: economia_gerada economia_gerada_cliente_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.economia_gerada
    ADD CONSTRAINT economia_gerada_cliente_id_fkey FOREIGN KEY (cliente_id) REFERENCES public.clientes(id) ON DELETE CASCADE;


--
-- Name: economia_gerada economia_gerada_fatura_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.economia_gerada
    ADD CONSTRAINT economia_gerada_fatura_id_fkey FOREIGN KEY (fatura_id) REFERENCES public.faturas(id) ON DELETE CASCADE;


--
-- Name: faturas faturas_cliente_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.faturas
    ADD CONSTRAINT faturas_cliente_id_fkey FOREIGN KEY (cliente_id) REFERENCES public.clientes(id) ON DELETE CASCADE;


--
-- Name: itens_faturados itens_faturados_fatura_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.itens_faturados
    ADD CONSTRAINT itens_faturados_fatura_id_fkey FOREIGN KEY (fatura_id) REFERENCES public.faturas(id) ON DELETE CASCADE;


--
-- Name: iceberg_namespaces iceberg_namespaces_catalog_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.iceberg_namespaces
    ADD CONSTRAINT iceberg_namespaces_catalog_id_fkey FOREIGN KEY (catalog_id) REFERENCES storage.buckets_analytics(id) ON DELETE CASCADE;


--
-- Name: iceberg_tables iceberg_tables_catalog_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.iceberg_tables
    ADD CONSTRAINT iceberg_tables_catalog_id_fkey FOREIGN KEY (catalog_id) REFERENCES storage.buckets_analytics(id) ON DELETE CASCADE;


--
-- Name: iceberg_tables iceberg_tables_namespace_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.iceberg_tables
    ADD CONSTRAINT iceberg_tables_namespace_id_fkey FOREIGN KEY (namespace_id) REFERENCES storage.iceberg_namespaces(id) ON DELETE CASCADE;


--
-- Name: objects objects_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT "objects_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: prefixes prefixes_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.prefixes
    ADD CONSTRAINT "prefixes_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_upload_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_upload_id_fkey FOREIGN KEY (upload_id) REFERENCES storage.s3_multipart_uploads(id) ON DELETE CASCADE;


--
-- Name: vector_indexes vector_indexes_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.vector_indexes
    ADD CONSTRAINT vector_indexes_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets_vectors(id);


--
-- Name: audit_log_entries; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.audit_log_entries ENABLE ROW LEVEL SECURITY;

--
-- Name: flow_state; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.flow_state ENABLE ROW LEVEL SECURITY;

--
-- Name: identities; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.identities ENABLE ROW LEVEL SECURITY;

--
-- Name: instances; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.instances ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_amr_claims; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_amr_claims ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_challenges; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_challenges ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_factors; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_factors ENABLE ROW LEVEL SECURITY;

--
-- Name: one_time_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.one_time_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: refresh_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.refresh_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_relay_states; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_relay_states ENABLE ROW LEVEL SECURITY;

--
-- Name: schema_migrations; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.schema_migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: sessions; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sessions ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_domains; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_domains ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: users; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.users ENABLE ROW LEVEL SECURITY;

--
-- Name: economia_gerada Acesso exclusivo Admin - Economia; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Acesso exclusivo Admin - Economia" ON public.economia_gerada FOR UPDATE TO authenticated USING (((auth.jwt() ->> 'email'::text) = 'admin@p2p.com'::text)) WITH CHECK (((auth.jwt() ->> 'email'::text) = 'admin@p2p.com'::text));


--
-- Name: faturas Acesso exclusivo Admin - Faturas; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Acesso exclusivo Admin - Faturas" ON public.faturas FOR UPDATE TO authenticated USING (((auth.jwt() ->> 'email'::text) = 'admin@p2p.com'::text)) WITH CHECK (((auth.jwt() ->> 'email'::text) = 'admin@p2p.com'::text));


--
-- Name: itens_faturados Acesso exclusivo Admin - Itens; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Acesso exclusivo Admin - Itens" ON public.itens_faturados TO authenticated USING (((auth.jwt() ->> 'email'::text) = 'admin@p2p.com'::text));


--
-- Name: clientes Allow public read; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Allow public read" ON public.clientes FOR SELECT USING (true);


--
-- Name: economia_gerada Allow public read; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Allow public read" ON public.economia_gerada FOR SELECT USING (true);


--
-- Name: itens_faturados Allow public read; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Allow public read" ON public.itens_faturados FOR SELECT USING (true);


--
-- Name: cobrancas Enable insert for authenticated users only; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Enable insert for authenticated users only" ON public.cobrancas FOR INSERT TO authenticated WITH CHECK (true);


--
-- Name: cobrancas Enable read access for autenticator; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Enable read access for autenticator" ON public.cobrancas FOR SELECT TO authenticator USING (true);


--
-- Name: lista_espera Lote_Livre_Anon; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Lote_Livre_Anon" ON public.lista_espera TO anon USING (true) WITH CHECK (true);


--
-- Name: clientes Permitir atualiza├º├úo p├║blica de clientes; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Permitir atualiza├º├úo p├║blica de clientes" ON public.clientes FOR UPDATE USING (true);


--
-- Name: clientes Permitir inser├º├úo p├║blica de clientes; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Permitir inser├º├úo p├║blica de clientes" ON public.clientes FOR INSERT WITH CHECK (true);


--
-- Name: faturas Permitir update em faturas para admins; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Permitir update em faturas para admins" ON public.faturas FOR UPDATE TO authenticated USING (true) WITH CHECK (true);


--
-- Name: faturas Permitir_Insert_Faturas_Anon_Auth; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Permitir_Insert_Faturas_Anon_Auth" ON public.faturas FOR INSERT TO authenticated, anon WITH CHECK (true);


--
-- Name: faturas Permitir_Select_Faturas_Anon_Auth; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Permitir_Select_Faturas_Anon_Auth" ON public.faturas FOR SELECT TO authenticated, anon USING (true);


--
-- Name: cobrancas Update par autenticados; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Update par autenticados" ON public.cobrancas FOR UPDATE TO authenticated USING (true) WITH CHECK (true);


--
-- Name: clientes; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.clientes ENABLE ROW LEVEL SECURITY;

--
-- Name: cobrancas; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.cobrancas ENABLE ROW LEVEL SECURITY;

--
-- Name: economia_gerada; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.economia_gerada ENABLE ROW LEVEL SECURITY;

--
-- Name: faturas; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.faturas ENABLE ROW LEVEL SECURITY;

--
-- Name: itens_faturados; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.itens_faturados ENABLE ROW LEVEL SECURITY;

--
-- Name: cobrancas leitura_completa_cobrancas; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY leitura_completa_cobrancas ON public.cobrancas FOR SELECT TO authenticated USING (true);


--
-- Name: lista_espera; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.lista_espera ENABLE ROW LEVEL SECURITY;

--
-- Name: messages; Type: ROW SECURITY; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE realtime.messages ENABLE ROW LEVEL SECURITY;

--
-- Name: objects Leitura_Faturas_Dev; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Leitura_Faturas_Dev" ON storage.objects FOR SELECT TO authenticated, anon USING ((bucket_id = 'faturas'::text));


--
-- Name: objects Leitura_Faturas_Public; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Leitura_Faturas_Public" ON storage.objects FOR SELECT USING ((bucket_id = 'faturas'::text));


--
-- Name: objects Upload_Faturas_Auth; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Upload_Faturas_Auth" ON storage.objects FOR INSERT TO authenticated WITH CHECK ((bucket_id = 'faturas'::text));


--
-- Name: objects Upload_Faturas_Dev; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Upload_Faturas_Dev" ON storage.objects FOR INSERT TO authenticated, anon WITH CHECK ((bucket_id = 'faturas'::text));


--
-- Name: buckets; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets ENABLE ROW LEVEL SECURITY;

--
-- Name: buckets_analytics; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets_analytics ENABLE ROW LEVEL SECURITY;

--
-- Name: buckets_vectors; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets_vectors ENABLE ROW LEVEL SECURITY;

--
-- Name: iceberg_namespaces; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.iceberg_namespaces ENABLE ROW LEVEL SECURITY;

--
-- Name: iceberg_tables; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.iceberg_tables ENABLE ROW LEVEL SECURITY;

--
-- Name: migrations; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: objects; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.objects ENABLE ROW LEVEL SECURITY;

--
-- Name: prefixes; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.prefixes ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads_parts; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads_parts ENABLE ROW LEVEL SECURITY;

--
-- Name: vector_indexes; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.vector_indexes ENABLE ROW LEVEL SECURITY;

--
-- Name: supabase_realtime; Type: PUBLICATION; Schema: -; Owner: postgres
--

CREATE PUBLICATION supabase_realtime WITH (publish = 'insert, update, delete, truncate');


ALTER PUBLICATION supabase_realtime OWNER TO postgres;

--
-- Name: supabase_realtime_messages_publication; Type: PUBLICATION; Schema: -; Owner: supabase_admin
--

CREATE PUBLICATION supabase_realtime_messages_publication WITH (publish = 'insert, update, delete, truncate');


ALTER PUBLICATION supabase_realtime_messages_publication OWNER TO supabase_admin;

--
-- Name: supabase_realtime_messages_publication messages; Type: PUBLICATION TABLE; Schema: realtime; Owner: supabase_admin
--

ALTER PUBLICATION supabase_realtime_messages_publication ADD TABLE ONLY realtime.messages;


--
-- Name: SCHEMA auth; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA auth TO anon;
GRANT USAGE ON SCHEMA auth TO authenticated;
GRANT USAGE ON SCHEMA auth TO service_role;
GRANT ALL ON SCHEMA auth TO supabase_auth_admin;
GRANT ALL ON SCHEMA auth TO dashboard_user;
GRANT USAGE ON SCHEMA auth TO postgres;


--
-- Name: SCHEMA extensions; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA extensions TO anon;
GRANT USAGE ON SCHEMA extensions TO authenticated;
GRANT USAGE ON SCHEMA extensions TO service_role;
GRANT ALL ON SCHEMA extensions TO dashboard_user;


--
-- Name: SCHEMA net; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA net TO supabase_functions_admin;
GRANT USAGE ON SCHEMA net TO postgres;
GRANT USAGE ON SCHEMA net TO anon;
GRANT USAGE ON SCHEMA net TO authenticated;
GRANT USAGE ON SCHEMA net TO service_role;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT USAGE ON SCHEMA public TO postgres;
GRANT USAGE ON SCHEMA public TO anon;
GRANT USAGE ON SCHEMA public TO authenticated;
GRANT USAGE ON SCHEMA public TO service_role;


--
-- Name: SCHEMA realtime; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA realtime TO postgres;
GRANT USAGE ON SCHEMA realtime TO anon;
GRANT USAGE ON SCHEMA realtime TO authenticated;
GRANT USAGE ON SCHEMA realtime TO service_role;
GRANT ALL ON SCHEMA realtime TO supabase_realtime_admin;


--
-- Name: SCHEMA storage; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA storage TO postgres WITH GRANT OPTION;
GRANT USAGE ON SCHEMA storage TO anon;
GRANT USAGE ON SCHEMA storage TO authenticated;
GRANT USAGE ON SCHEMA storage TO service_role;
GRANT ALL ON SCHEMA storage TO supabase_storage_admin WITH GRANT OPTION;
GRANT ALL ON SCHEMA storage TO dashboard_user;


--
-- Name: SCHEMA supabase_functions; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA supabase_functions TO postgres;
GRANT USAGE ON SCHEMA supabase_functions TO anon;
GRANT USAGE ON SCHEMA supabase_functions TO authenticated;
GRANT USAGE ON SCHEMA supabase_functions TO service_role;
GRANT ALL ON SCHEMA supabase_functions TO supabase_functions_admin;


--
-- Name: SCHEMA vault; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA vault TO postgres WITH GRANT OPTION;
GRANT USAGE ON SCHEMA vault TO service_role;


--
-- Name: FUNCTION email(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.email() TO dashboard_user;


--
-- Name: FUNCTION jwt(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.jwt() TO postgres;
GRANT ALL ON FUNCTION auth.jwt() TO dashboard_user;


--
-- Name: FUNCTION role(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.role() TO dashboard_user;


--
-- Name: FUNCTION uid(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.uid() TO dashboard_user;


--
-- Name: FUNCTION armor(bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.armor(bytea) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION armor(bytea, text[], text[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION crypt(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.crypt(text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION dearmor(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.dearmor(text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION decrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION digest(bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION digest(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.digest(text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION encrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION encrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION gen_random_bytes(integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION gen_random_uuid(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION gen_salt(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.gen_salt(text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION gen_salt(text, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION grant_pg_cron_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION extensions.grant_pg_cron_access() FROM supabase_admin;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO supabase_admin WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO dashboard_user;


--
-- Name: FUNCTION grant_pg_graphql_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.grant_pg_graphql_access() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION grant_pg_net_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION extensions.grant_pg_net_access() FROM supabase_admin;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO supabase_admin WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO dashboard_user;


--
-- Name: FUNCTION hmac(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hmac(text, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_armor_headers(text, OUT key text, OUT value text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_key_id(bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgrst_ddl_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_ddl_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgrst_drop_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_drop_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION set_graphql_placeholder(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.set_graphql_placeholder() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_generate_v1(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_generate_v1mc(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_generate_v3(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_generate_v4(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_generate_v5(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_nil(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_nil() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_ns_dns(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_ns_oid(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_ns_url(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_ns_x500(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION graphql("operationName" text, query text, variables jsonb, extensions jsonb); Type: ACL; Schema: graphql_public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO postgres;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO anon;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO authenticated;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO service_role;


--
-- Name: FUNCTION http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer); Type: ACL; Schema: net; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;
GRANT ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin;
GRANT ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO postgres;
GRANT ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO anon;
GRANT ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO authenticated;
GRANT ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO service_role;


--
-- Name: FUNCTION http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer); Type: ACL; Schema: net; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;
GRANT ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin;
GRANT ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO postgres;
GRANT ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO anon;
GRANT ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO authenticated;
GRANT ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO service_role;


--
-- Name: FUNCTION pg_reload_conf(); Type: ACL; Schema: pg_catalog; Owner: supabase_admin
--

GRANT ALL ON FUNCTION pg_catalog.pg_reload_conf() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION get_auth(p_usename text); Type: ACL; Schema: pgbouncer; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION pgbouncer.get_auth(p_usename text) FROM PUBLIC;
GRANT ALL ON FUNCTION pgbouncer.get_auth(p_usename text) TO pgbouncer;


--
-- Name: FUNCTION apply_rls(wal jsonb, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO supabase_realtime_admin;


--
-- Name: FUNCTION broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO postgres;
GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO dashboard_user;


--
-- Name: FUNCTION build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO postgres;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO anon;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO service_role;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION "cast"(val text, type_ regtype); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO postgres;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO dashboard_user;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO anon;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO authenticated;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO service_role;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO supabase_realtime_admin;


--
-- Name: FUNCTION check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO postgres;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO anon;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO authenticated;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO service_role;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO supabase_realtime_admin;


--
-- Name: FUNCTION is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO postgres;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO anon;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO service_role;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO supabase_realtime_admin;


--
-- Name: FUNCTION quote_wal2json(entity regclass); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO postgres;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO anon;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO authenticated;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO service_role;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO supabase_realtime_admin;


--
-- Name: FUNCTION send(payload jsonb, event text, topic text, private boolean); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO postgres;
GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO dashboard_user;


--
-- Name: FUNCTION subscription_check_filters(); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO postgres;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO dashboard_user;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO anon;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO authenticated;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO service_role;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO supabase_realtime_admin;


--
-- Name: FUNCTION to_regrole(role_name text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO postgres;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO anon;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO authenticated;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO service_role;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO supabase_realtime_admin;


--
-- Name: FUNCTION topic(); Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON FUNCTION realtime.topic() TO postgres;
GRANT ALL ON FUNCTION realtime.topic() TO dashboard_user;


--
-- Name: FUNCTION http_request(); Type: ACL; Schema: supabase_functions; Owner: supabase_functions_admin
--

REVOKE ALL ON FUNCTION supabase_functions.http_request() FROM PUBLIC;
GRANT ALL ON FUNCTION supabase_functions.http_request() TO postgres;
GRANT ALL ON FUNCTION supabase_functions.http_request() TO anon;
GRANT ALL ON FUNCTION supabase_functions.http_request() TO authenticated;
GRANT ALL ON FUNCTION supabase_functions.http_request() TO service_role;


--
-- Name: FUNCTION _crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault._crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault._crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea) TO service_role;


--
-- Name: FUNCTION create_secret(new_secret text, new_name text, new_description text, new_key_id uuid); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault.create_secret(new_secret text, new_name text, new_description text, new_key_id uuid) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault.create_secret(new_secret text, new_name text, new_description text, new_key_id uuid) TO service_role;


--
-- Name: FUNCTION update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault.update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault.update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid) TO service_role;


--
-- Name: TABLE audit_log_entries; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.audit_log_entries TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.audit_log_entries TO postgres;
GRANT SELECT ON TABLE auth.audit_log_entries TO postgres WITH GRANT OPTION;


--
-- Name: TABLE flow_state; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.flow_state TO postgres;
GRANT SELECT ON TABLE auth.flow_state TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.flow_state TO dashboard_user;


--
-- Name: TABLE identities; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.identities TO postgres;
GRANT SELECT ON TABLE auth.identities TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.identities TO dashboard_user;


--
-- Name: TABLE instances; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.instances TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.instances TO postgres;
GRANT SELECT ON TABLE auth.instances TO postgres WITH GRANT OPTION;


--
-- Name: TABLE mfa_amr_claims; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.mfa_amr_claims TO postgres;
GRANT SELECT ON TABLE auth.mfa_amr_claims TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_amr_claims TO dashboard_user;


--
-- Name: TABLE mfa_challenges; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.mfa_challenges TO postgres;
GRANT SELECT ON TABLE auth.mfa_challenges TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_challenges TO dashboard_user;


--
-- Name: TABLE mfa_factors; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.mfa_factors TO postgres;
GRANT SELECT ON TABLE auth.mfa_factors TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_factors TO dashboard_user;


--
-- Name: TABLE oauth_authorizations; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_authorizations TO postgres;
GRANT ALL ON TABLE auth.oauth_authorizations TO dashboard_user;


--
-- Name: TABLE oauth_client_states; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_client_states TO postgres;
GRANT ALL ON TABLE auth.oauth_client_states TO dashboard_user;


--
-- Name: TABLE oauth_clients; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_clients TO postgres;
GRANT ALL ON TABLE auth.oauth_clients TO dashboard_user;


--
-- Name: TABLE oauth_consents; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_consents TO postgres;
GRANT ALL ON TABLE auth.oauth_consents TO dashboard_user;


--
-- Name: TABLE one_time_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.one_time_tokens TO postgres;
GRANT SELECT ON TABLE auth.one_time_tokens TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.one_time_tokens TO dashboard_user;


--
-- Name: TABLE refresh_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.refresh_tokens TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.refresh_tokens TO postgres;
GRANT SELECT ON TABLE auth.refresh_tokens TO postgres WITH GRANT OPTION;


--
-- Name: SEQUENCE refresh_tokens_id_seq; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO dashboard_user;
GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO postgres;


--
-- Name: TABLE saml_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.saml_providers TO postgres;
GRANT SELECT ON TABLE auth.saml_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_providers TO dashboard_user;


--
-- Name: TABLE saml_relay_states; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.saml_relay_states TO postgres;
GRANT SELECT ON TABLE auth.saml_relay_states TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_relay_states TO dashboard_user;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT SELECT ON TABLE auth.schema_migrations TO postgres WITH GRANT OPTION;


--
-- Name: TABLE sessions; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.sessions TO postgres;
GRANT SELECT ON TABLE auth.sessions TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sessions TO dashboard_user;


--
-- Name: TABLE sso_domains; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.sso_domains TO postgres;
GRANT SELECT ON TABLE auth.sso_domains TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_domains TO dashboard_user;


--
-- Name: TABLE sso_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.sso_providers TO postgres;
GRANT SELECT ON TABLE auth.sso_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_providers TO dashboard_user;


--
-- Name: TABLE users; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.users TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.users TO postgres;
GRANT SELECT ON TABLE auth.users TO postgres WITH GRANT OPTION;


--
-- Name: TABLE pg_stat_statements; Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON TABLE extensions.pg_stat_statements TO postgres WITH GRANT OPTION;


--
-- Name: TABLE pg_stat_statements_info; Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON TABLE extensions.pg_stat_statements_info TO postgres WITH GRANT OPTION;


--
-- Name: TABLE clientes; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.clientes TO postgres;
GRANT ALL ON TABLE public.clientes TO anon;
GRANT ALL ON TABLE public.clientes TO authenticated;
GRANT ALL ON TABLE public.clientes TO service_role;


--
-- Name: TABLE cobrancas; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.cobrancas TO postgres;
GRANT ALL ON TABLE public.cobrancas TO anon;
GRANT ALL ON TABLE public.cobrancas TO authenticated;
GRANT ALL ON TABLE public.cobrancas TO service_role;


--
-- Name: TABLE economia_gerada; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.economia_gerada TO postgres;
GRANT ALL ON TABLE public.economia_gerada TO anon;
GRANT ALL ON TABLE public.economia_gerada TO authenticated;
GRANT ALL ON TABLE public.economia_gerada TO service_role;


--
-- Name: TABLE faturas; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.faturas TO postgres;
GRANT ALL ON TABLE public.faturas TO anon;
GRANT ALL ON TABLE public.faturas TO authenticated;
GRANT ALL ON TABLE public.faturas TO service_role;


--
-- Name: TABLE itens_faturados; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.itens_faturados TO postgres;
GRANT ALL ON TABLE public.itens_faturados TO anon;
GRANT ALL ON TABLE public.itens_faturados TO authenticated;
GRANT ALL ON TABLE public.itens_faturados TO service_role;


--
-- Name: TABLE lista_espera; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.lista_espera TO postgres;
GRANT ALL ON TABLE public.lista_espera TO anon;
GRANT ALL ON TABLE public.lista_espera TO authenticated;
GRANT ALL ON TABLE public.lista_espera TO service_role;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.schema_migrations TO anon;
GRANT ALL ON TABLE public.schema_migrations TO authenticated;
GRANT ALL ON TABLE public.schema_migrations TO service_role;


--
-- Name: TABLE messages; Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON TABLE realtime.messages TO postgres;
GRANT ALL ON TABLE realtime.messages TO dashboard_user;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO anon;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO authenticated;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO service_role;


--
-- Name: TABLE messages_2026_01_16; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2026_01_16 TO postgres;
GRANT ALL ON TABLE realtime.messages_2026_01_16 TO dashboard_user;


--
-- Name: TABLE messages_2026_01_17; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2026_01_17 TO postgres;
GRANT ALL ON TABLE realtime.messages_2026_01_17 TO dashboard_user;


--
-- Name: TABLE messages_2026_01_18; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2026_01_18 TO postgres;
GRANT ALL ON TABLE realtime.messages_2026_01_18 TO dashboard_user;


--
-- Name: TABLE messages_2026_01_19; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2026_01_19 TO postgres;
GRANT ALL ON TABLE realtime.messages_2026_01_19 TO dashboard_user;


--
-- Name: TABLE messages_2026_01_20; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2026_01_20 TO postgres;
GRANT ALL ON TABLE realtime.messages_2026_01_20 TO dashboard_user;


--
-- Name: TABLE messages_2026_01_21; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2026_01_21 TO postgres;
GRANT ALL ON TABLE realtime.messages_2026_01_21 TO dashboard_user;


--
-- Name: TABLE messages_2026_01_22; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2026_01_22 TO postgres;
GRANT ALL ON TABLE realtime.messages_2026_01_22 TO dashboard_user;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.schema_migrations TO postgres;
GRANT ALL ON TABLE realtime.schema_migrations TO dashboard_user;
GRANT SELECT ON TABLE realtime.schema_migrations TO anon;
GRANT SELECT ON TABLE realtime.schema_migrations TO authenticated;
GRANT SELECT ON TABLE realtime.schema_migrations TO service_role;
GRANT ALL ON TABLE realtime.schema_migrations TO supabase_realtime_admin;


--
-- Name: TABLE subscription; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.subscription TO postgres;
GRANT ALL ON TABLE realtime.subscription TO dashboard_user;
GRANT SELECT ON TABLE realtime.subscription TO anon;
GRANT SELECT ON TABLE realtime.subscription TO authenticated;
GRANT SELECT ON TABLE realtime.subscription TO service_role;
GRANT ALL ON TABLE realtime.subscription TO supabase_realtime_admin;


--
-- Name: SEQUENCE subscription_id_seq; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO postgres;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO dashboard_user;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO anon;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO authenticated;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO service_role;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO supabase_realtime_admin;


--
-- Name: TABLE buckets; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.buckets TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE storage.buckets TO service_role;
GRANT ALL ON TABLE storage.buckets TO authenticated;
GRANT ALL ON TABLE storage.buckets TO anon;


--
-- Name: TABLE buckets_analytics; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.buckets_analytics TO service_role;
GRANT ALL ON TABLE storage.buckets_analytics TO authenticated;
GRANT ALL ON TABLE storage.buckets_analytics TO anon;


--
-- Name: TABLE buckets_vectors; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT SELECT ON TABLE storage.buckets_vectors TO service_role;
GRANT SELECT ON TABLE storage.buckets_vectors TO authenticated;
GRANT SELECT ON TABLE storage.buckets_vectors TO anon;


--
-- Name: TABLE iceberg_namespaces; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.iceberg_namespaces TO service_role;
GRANT SELECT ON TABLE storage.iceberg_namespaces TO authenticated;
GRANT SELECT ON TABLE storage.iceberg_namespaces TO anon;


--
-- Name: TABLE iceberg_tables; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.iceberg_tables TO service_role;
GRANT SELECT ON TABLE storage.iceberg_tables TO authenticated;
GRANT SELECT ON TABLE storage.iceberg_tables TO anon;


--
-- Name: TABLE objects; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.objects TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE storage.objects TO service_role;
GRANT ALL ON TABLE storage.objects TO authenticated;
GRANT ALL ON TABLE storage.objects TO anon;


--
-- Name: TABLE prefixes; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.prefixes TO service_role;
GRANT ALL ON TABLE storage.prefixes TO authenticated;
GRANT ALL ON TABLE storage.prefixes TO anon;


--
-- Name: TABLE s3_multipart_uploads; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO anon;


--
-- Name: TABLE s3_multipart_uploads_parts; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads_parts TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO anon;


--
-- Name: TABLE vector_indexes; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT SELECT ON TABLE storage.vector_indexes TO service_role;
GRANT SELECT ON TABLE storage.vector_indexes TO authenticated;
GRANT SELECT ON TABLE storage.vector_indexes TO anon;


--
-- Name: TABLE hooks; Type: ACL; Schema: supabase_functions; Owner: supabase_functions_admin
--

GRANT ALL ON TABLE supabase_functions.hooks TO postgres;
GRANT ALL ON TABLE supabase_functions.hooks TO anon;
GRANT ALL ON TABLE supabase_functions.hooks TO authenticated;
GRANT ALL ON TABLE supabase_functions.hooks TO service_role;


--
-- Name: SEQUENCE hooks_id_seq; Type: ACL; Schema: supabase_functions; Owner: supabase_functions_admin
--

GRANT ALL ON SEQUENCE supabase_functions.hooks_id_seq TO postgres;
GRANT ALL ON SEQUENCE supabase_functions.hooks_id_seq TO anon;
GRANT ALL ON SEQUENCE supabase_functions.hooks_id_seq TO authenticated;
GRANT ALL ON SEQUENCE supabase_functions.hooks_id_seq TO service_role;


--
-- Name: TABLE migrations; Type: ACL; Schema: supabase_functions; Owner: supabase_functions_admin
--

GRANT ALL ON TABLE supabase_functions.migrations TO postgres;
GRANT ALL ON TABLE supabase_functions.migrations TO anon;
GRANT ALL ON TABLE supabase_functions.migrations TO authenticated;
GRANT ALL ON TABLE supabase_functions.migrations TO service_role;


--
-- Name: TABLE secrets; Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT SELECT,REFERENCES,DELETE,TRUNCATE ON TABLE vault.secrets TO postgres WITH GRANT OPTION;
GRANT SELECT,DELETE ON TABLE vault.secrets TO service_role;


--
-- Name: TABLE decrypted_secrets; Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT SELECT,REFERENCES,DELETE,TRUNCATE ON TABLE vault.decrypted_secrets TO postgres WITH GRANT OPTION;
GRANT SELECT,DELETE ON TABLE vault.decrypted_secrets TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON SEQUENCES TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON FUNCTIONS TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON TABLES TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: supabase_functions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: supabase_functions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: supabase_functions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON TABLES TO service_role;


--
-- Name: issue_graphql_placeholder; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_graphql_placeholder ON sql_drop
         WHEN TAG IN ('DROP EXTENSION')
   EXECUTE FUNCTION extensions.set_graphql_placeholder();


ALTER EVENT TRIGGER issue_graphql_placeholder OWNER TO supabase_admin;

--
-- Name: issue_pg_cron_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_cron_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_cron_access();


ALTER EVENT TRIGGER issue_pg_cron_access OWNER TO supabase_admin;

--
-- Name: issue_pg_graphql_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_graphql_access ON ddl_command_end
         WHEN TAG IN ('CREATE FUNCTION')
   EXECUTE FUNCTION extensions.grant_pg_graphql_access();


ALTER EVENT TRIGGER issue_pg_graphql_access OWNER TO supabase_admin;

--
-- Name: issue_pg_net_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_net_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_net_access();


ALTER EVENT TRIGGER issue_pg_net_access OWNER TO supabase_admin;

--
-- Name: pgrst_ddl_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_ddl_watch ON ddl_command_end
   EXECUTE FUNCTION extensions.pgrst_ddl_watch();


ALTER EVENT TRIGGER pgrst_ddl_watch OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_drop_watch ON sql_drop
   EXECUTE FUNCTION extensions.pgrst_drop_watch();


ALTER EVENT TRIGGER pgrst_drop_watch OWNER TO supabase_admin;

--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database cluster dump complete
--

