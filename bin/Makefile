#
# pg_bulkload: bin/Makefile
#
#    Copyright (c) 2007-2013, NIPPON TELEGRAPH AND TELEPHONE CORPORATION
#
SRCS = pg_bulkload.c recovery.c pgut/pgut.c pgut/pgut-fe.c pgut/pgut-list.c
OBJS = $(SRCS:.c=.o)
PROGRAM = pg_bulkload
SCRIPTS = postgresql
REGRESS = init load_bin load_csv load_remote load_function load_encoding load_check load_filter load_parallel write_bin

PG_CPPFLAGS = -I../include -I$(libpq_srcdir)
PG_LIBS = $(libpq)

ifndef USE_PGXS
top_builddir = ../../..
makefile_global = $(top_builddir)/src/Makefile.global
ifeq "$(wildcard $(makefile_global))" ""
USE_PGXS = 1	# use pgxs if not in contrib directory
endif
endif

ifdef USE_PGXS
PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
else
subdir = contrib/$(MODULE_big)
include $(makefile_global)
include $(top_srcdir)/contrib/contrib-global.mk
endif

# remove dependency to libxml2 and libxslt
LIBS := $(filter-out -lxml2, $(LIBS))
LIBS := $(filter-out -lxslt, $(LIBS))

ifndef MAJORVERSION
MAJORVERSION := $(basename $(VERSION))
endif

REGRESS_OPTS += $(if $(filter 8.4 9.0, $(MAJORVERSION)), --multibyte=UTF8, --encoding=UTF8)

sql/init.sql: sql/init-$(MAJORVERSION).sql
	cp sql/init-$(MAJORVERSION).sql sql/init.sql
sql/init-8.4.sql:
	cp sql/init-legacy.sql sql/init-8.4.sql
sql/init-9.0.sql:
	cp sql/init-legacy.sql sql/init-9.0.sql
sql/init-9.1.sql:
	cp sql/init-extension.sql sql/init-9.1.sql
sql/init-9.2.sql:
	cp sql/init-extension.sql sql/init-9.2.sql
sql/init-9.3.sql:
	cp sql/init-extension.sql sql/init-9.3.sql
sql/init-9.4.sql:
	cp sql/init-extension.sql sql/init-9.4.sql
sql/load_function.sql: sql/load_function-$(MAJORVERSION).sql
	cp sql/load_function-$(MAJORVERSION).sql sql/load_function.sql
sql/load_filter.sql: sql/load_filter-$(MAJORVERSION).sql
	cp sql/load_filter-$(MAJORVERSION).sql sql/load_filter.sql

expected/init.out: expected/init-$(MAJORVERSION).out
	cp expected/init-$(MAJORVERSION).out expected/init.out
expected/init-8.4.out:
	cp expected/init-legacy.out expected/init-8.4.out
expected/init-9.0.out:
	cp expected/init-legacy.out expected/init-9.0.out
expected/init-9.1.out:
	cp expected/init-extension.out expected/init-9.1.out
expected/init-9.2.out:
	cp expected/init-extension.out expected/init-9.2.out
expected/init-9.3.out:
	cp expected/init-extension-9.3.out expected/init-9.3.out
expected/init-9.4.out:
	cp expected/init-extension-9.4.out expected/init-9.4.out
expected/load_function.out: expected/load_function-$(MAJORVERSION).out
	cp expected/load_function-$(MAJORVERSION).out expected/load_function.out
expected/load_filter.out: expected/load_filter-$(MAJORVERSION).out
	cp expected/load_filter-$(MAJORVERSION).out expected/load_filter.out
expected/load_encoding.out: expected/load_encoding-$(MAJORVERSION).out
	cp expected/load_encoding-$(MAJORVERSION).out expected/load_encoding.out

.PHONY: subclean
clean: subclean

subclean:
	rm -f sql/load_function.sql sql/load_filter.sql expected/load_function.out expected/load_filter.out expected/load_encoding.out
	rm -f sql/init.sql sql/init-{8.3,8.4,9.0,9.1,9.2,9.3,9.4}.sql
	rm -f expected/init.out expected/init-{8.3,8.4,9.0,9.1,9.2,9.3,9.4}.out

installcheck: sql/init.sql sql/load_function.sql sql/load_filter.sql expected/init.out expected/load_function.out expected/load_filter.out expected/load_encoding.out
