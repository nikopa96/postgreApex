DROP OWNED BY :DB_APP_USER;
DROP USER IF EXISTS :DB_APP_USER;
CREATE USER :DB_APP_USER WITH LOGIN PASSWORD ':DB_APP_USER_PASS';

-- Revoke permissions from PUBLIC
REVOKE ALL PRIVILEGES ON DATABASE :DB_DATABASE FROM PUBLIC;
REVOKE ALL PRIVILEGES ON SCHEMA pgapex FROM PUBLIC;
REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA pgapex FROM PUBLIC;
REVOKE ALL PRIVILEGES ON ALL FUNCTIONS IN SCHEMA pgapex FROM PUBLIC;
REVOKE ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA pgapex FROM PUBLIC;

-- Revoke permissions from :DB_APP_USER
REVOKE ALL PRIVILEGES ON DATABASE :DB_DATABASE FROM :DB_APP_USER;
REVOKE ALL PRIVILEGES ON SCHEMA pgapex FROM :DB_APP_USER;
REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA pgapex FROM :DB_APP_USER;
REVOKE ALL PRIVILEGES ON ALL FUNCTIONS IN SCHEMA pgapex FROM :DB_APP_USER;
REVOKE ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA pgapex FROM :DB_APP_USER;

GRANT CONNECT ON DATABASE :DB_DATABASE TO :DB_APP_USER;
GRANT USAGE ON SCHEMA pgapex TO :DB_APP_USER;

GRANT EXECUTE ON FUNCTION
pgapex.f_is_superuser(VARCHAR, VARCHAR)
TO :DB_APP_USER;