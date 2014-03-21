/*
 * pg_bulkload: include/logger.h
 *
 *	  Copyright (c) 2009-2011, NIPPON TELEGRAPH AND TELEPHONE CORPORATION
 */

/**
 * @file
 * @brief Declaration of logger module
 *
 */
#ifndef LOGGER_H_INCLUDED
#define LOGGER_H_INCLUDED

#include "access/xact.h"
#include "access/tupdesc.h"
#include "access/htup.h"

typedef struct Logger	Logger;

extern void CreateLogger(const char *path, bool verbose, bool writer);
extern void LoggerLog(int elevel, const char *fmt,...);
extern void LoggerClose(bool delete_log);

/*
 * Utilitiy functions
 */

extern char *tuple_to_cstring(TupleDesc tupdesc, HeapTuple tuple);

#ifdef _WIN32
#else
void
DeleteFile(const char *filename);
#endif

#endif   /* LOGGER_H_INCLUDED */
