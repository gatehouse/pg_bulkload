#
# cmake configuration file
#
# pg_bulkload executable client
#
project(pg_bulkload_bin)

set( pg_bulkload_bin_SOURCES
	pg_bulkload.c
	recovery.c
	pgut/pgut.c
	pgut/pgut-fe.c
	pgut/pgut-list.c
)

add_executable( pg_bulkload_bin ${pg_bulkload_bin_SOURCES})

IF (WIN32)

	target_link_libraries(pg_bulkload_bin ws2_32 libpq libpgport libintl-8 )

ELSE (WIN32)

	IF (${PG_VERSION} GREATER 9.2)
		target_link_libraries(${PROJECT_NAME} pq pgport.a pgcommon.a)
	ELSE()
		target_link_libraries(${PROJECT_NAME} pq pgport.a)
	ENDIF()
	
ENDIF (WIN32)


set_target_properties( pg_bulkload_bin PROPERTIES OUTPUT_NAME pg_bulkload )


