#
# cmake configuration file
#
# pg_bulkload server library
#
project(pg_bulkload_lib)

set( pg_bulkload_lib_SOURCES
	../lib/binary.c
	../lib/logger.c
	../lib/parser_binary.c
	../lib/parser_csv.c
	../lib/parser_function.c
	../lib/parser_tuple.c
	../lib/pg_btree.c
	../lib/pg_bulkload.c
	../lib/pg_strutil.c
	../lib/reader.c
	../lib/source.c
	../lib/writer_binary.c
	../lib/writer_buffered.c
	../lib/writer.c
	../lib/writer_direct.c
	../lib/writer_parallel.c
)

add_library(pg_bulkload_lib SHARED ${pg_bulkload_lib_SOURCES})

set_target_properties( pg_bulkload_lib PROPERTIES PREFIX pg_ OUTPUT_NAME bulkload )

