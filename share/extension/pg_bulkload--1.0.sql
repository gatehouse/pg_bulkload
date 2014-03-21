/*
 * pg_bulkload.sql
 * 
 *    Copyright (c) 2007-2011, NIPPON TELEGRAPH AND TELEPHONE CORPORATION
 */

-- Adjust this setting to control where the objects get created.
SET search_path = public;

-- BEGIN;

CREATE FUNCTION pg_bulkload(
	IN options text[],
	OUT skip bigint,
	OUT count bigint,
	OUT parse_errors bigint,
	OUT duplicate_new bigint,
	OUT duplicate_old bigint,
	OUT system_time float8,
	OUT user_time float8,
	OUT duration float8
)
AS '$libdir/pg_bulkload', 'pg_bulkload' LANGUAGE C VOLATILE STRICT;

-- COMMIT;
