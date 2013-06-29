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
	../lib/pgut/pgut-be.c
	../lib/pgut/pgut-ipc.c
	../cmake/readme.txt
)

add_library(${PROJECT_NAME} SHARED ${pg_bulkload_lib_SOURCES})

set_target_properties( ${PROJECT_NAME} PROPERTIES PREFIX pg_ OUTPUT_NAME bulkload )

IF (WIN32)

ELSE()

	IF (${PG_VERSION} GREATER 9.2)
		target_link_libraries(${PROJECT_NAME} pq pgport.a pgcommon.a)
	ELSE()
		target_link_libraries(${PROJECT_NAME} pq pgport.a)
	ENDIF()

	INSTALL( TARGETS ${PROJECT_NAME} DESTINATION /usr/lib/postgresql/${PG_VERSION}/lib/ )
	INSTALL( FILES ../share/extension/pg_bulkload.control DESTINATION /usr/share/postgresql/${PG_VERSION}/extension/ )
	INSTALL( FILES ../share/extension/pg_bulkload--1.0.sql DESTINATION /usr/share/postgresql/${PG_VERSION}/extension/ )
ENDIF()

