#
# cmake configuration file
#
#
cmake_minimum_required(VERSION 2.8)

project(pg_bulkload)

SET( PG_VERSION 9.2 ) 

include_directories(. ../include/ )

IF (WIN32)

	ADD_DEFINITIONS( -D_WIN32_WINNT=0x0501 ) 
	include_directories( 
		"c:/Program Files/PostgreSQL/9.2/include" 
		"c:/Program Files/PostgreSQL/9.2/include/server" 
		"c:/Program Files/PostgreSQL/9.2/include/internal" 
		"c:/Program Files/PostgreSQL/9.2/include/server/port" 
		"c:/Program Files/PostgreSQL/9.2/include/server/port/win32" 
		"c:/Program Files/PostgreSQL/9.2/include/server/port/win32_msvc" 
	)
	LINK_DIRECTORIES("c:/Program Files/PostgreSQL/9.2/lib")


ELSE (WIN32)

	include_directories( 
		/usr/include/postgresql/
		/usr/include/postgresql/internal/
		/usr/include/postgresql/${PG_VERSION}/server/
	)

ENDIF (WIN32)

ADD_SUBDIRECTORY(../bin bin)
ADD_SUBDIRECTORY(../lib lib)


