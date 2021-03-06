DO $$
BEGIN
IF EXISTS (SELECT 1 FROM pg_roles WHERE rolname='albumlist') THEN
   REVOKE ALL PRIVILEGES ON DATABASE postgres FROM albumlist;
END IF;
END$$;

DROP SCHEMA IF EXISTS albumlist CASCADE;
DROP ROLE IF EXISTS albumlist;

CREATE ROLE albumlist PASSWORD 'albumlist'
  NOSUPERUSER NOCREATEDB NOCREATEROLE NOREPLICATION INHERIT LOGIN;

CREATE SCHEMA albumlist AUTHORIZATION albumlist;

REVOKE ALL ON ALL TABLES IN SCHEMA albumlist FROM PUBLIC;
REVOKE ALL ON ALL SEQUENCES IN SCHEMA albumlist FROM PUBLIC;
REVOKE CONNECT ON DATABASE postgres FROM PUBLIC;

GRANT CONNECT ON DATABASE postgres TO albumlist;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA albumlist TO albumlist;
GRANT ALL ON ALL SEQUENCES IN SCHEMA albumlist TO albumlist;