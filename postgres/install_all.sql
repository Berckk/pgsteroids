# enabled logger
ALTER SYSTEM SET log_duration = on
ALTER SYSTEM SET log_min_duration_statement = 1
ALTER SYSTEM SET log_checkpoints = on
ALTER SYSTEM SET log_connections = on
ALTER SYSTEM SET log_disconnections = on
ALTER SYSTEM SET log_lock_waits = on
ALTER SYSTEM SET log_temp_files = 0
ALTER SYSTEM SET log_line_prefix = '%t [%p]: [%l-1] '
ALTER SYSTEM SET lc_messages = 'C'

CREATE EXTENSION hypopg;
CREATE database powa;
\c powa
CREATE EXTENSION pg_stat_statements;
CREATE EXTENSION btree_gist;
CREATE EXTENSION pg_qualstats;
CREATE EXTENSION pg_stat_kcache;
CREATE EXTENSION pg_track_settings;
CREATE EXTENSION powa;
\c template1
CREATE EXTENSION hypopg;
CREATE EXTENSION pgstattuple;
