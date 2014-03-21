#
# cmake configuration file
#
# Currently the PG_VERSION must be set manually here.
#
cmake_minimum_required(VERSION 2.8)

project(pg_bulkload)

SET( PG_VERSION 9.3 )

include_directories(. ../include/ )

IF (WIN32)

	ADD_DEFINITIONS( -D_WIN32_WINNT=0x0501 )
	include_directories(
		"c:/Program Files/PostgreSQL/${PG_VERSION}/include"
		"c:/Program Files/PostgreSQL/${PG_VERSION}/include/server"
		"c:/Program Files/PostgreSQL/${PG_VERSION}/include/internal"
		"c:/Program Files/PostgreSQL/${PG_VERSION}/include/server/port"
		"c:/Program Files/PostgreSQL/${PG_VERSION}/include/server/port/win32"
		"c:/Program Files/PostgreSQL/${PG_VERSION}/include/server/port/win32_msvc"
	)
	LINK_DIRECTORIES("c:/Program Files/PostgreSQL/${PG_VERSION}/lib")


ELSE (WIN32)

	include_directories( 
		/usr/include/postgresql/
		/usr/include/postgresql/internal/
		/usr/include/postgresql/${PG_VERSION}/server/
	)

	ADD_DEFINITIONS( -g -Wall )

ENDIF (WIN32)

ADD_SUBDIRECTORY(../bin bin)
ADD_SUBDIRECTORY(../lib lib)
