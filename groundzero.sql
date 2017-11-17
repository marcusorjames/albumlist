DO $$
BEGIN
IF EXISTS (SELECT 1 FROM pg_roles WHERE rolname='doomlist') THEN
   REVOKE ALL PRIVILEGES ON DATABASE postgres FROM doomlist;
END IF;
END$$;

DROP SCHEMA IF EXISTS doomlist CASCADE;
DROP ROLE IF EXISTS doomlist;

CREATE ROLE doomlist PASSWORD 'doomlist'
  NOSUPERUSER NOCREATEDB NOCREATEROLE NOREPLICATION INHERIT LOGIN;

CREATE SCHEMA doomlist AUTHORIZATION doomlist;

REVOKE ALL ON ALL TABLES IN SCHEMA doomlist FROM PUBLIC;
REVOKE ALL ON ALL SEQUENCES IN SCHEMA doomlist FROM PUBLIC;
REVOKE CONNECT ON DATABASE postgres FROM PUBLIC;

GRANT CONNECT ON DATABASE postgres TO doomlist;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA doomlist TO doomlist;
GRANT ALL ON ALL SEQUENCES IN SCHEMA doomlist TO doomlist;