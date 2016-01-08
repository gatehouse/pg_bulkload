

2016-01-08 pg_bulkload 3.1.6
-----------------------------------------------
PostgreSQL 9.5
On branch VERSION3_1_STABLE

cmake -G "Visual Studio 12 Win64" ..

Needed to change some things in the code possibly due to missing stuff in Windows build of PostgreSQL 9.5
May possibly no longer compile with previous versions of PostgreSQL.


2014-03-20 pg_bulkload 3.1.5
----------------------------
Starting working on porting version 3.1.5. Will attempt to start from 3.1.5 and incorporate own changes.

Initial build on Windows Visual Studio 10 64 bit (same as EnterpriseDB PostgreSQL 9.3) using cmake.

Added CLEAR_LOG functionality from previous PBA version and Windows protocol version number.

sudo checkinstall --install=no --pkgname=pg-bulkload --pkgversion=3.1.5 --pkglicense=LGPL --maintainer="Poul Bondo \<pba@mailme.dk\>" --provides=pg-bulkload --nodoc --requires="postgresql-9.3"

2013-09-10 pg_bulkload
----------------------
Build for PostgreSQL 9.3 on Windows 7 64 bit.

Postgresql binary does not include libintl.h/libintl-8.lib from gettext in the deployment.

touch include\libintl.h 			# It is ok that it is empty
lib /def:libintl-8.def /OUT:libintl-8.lib /MACHINE:X86
move libintl-8.lib lib

-------------- begin libintl-8.def ---------------
EXPORTS
_nl_expand_alias
_nl_msg_cat_cntr DATA
bind_textdomain_codeset
bindtextdomain
dcgettext
dcngettext
dgettext
dngettext
gettext
libintl_bind_textdomain_codeset
libintl_bindtextdomain
libintl_dcgettext
libintl_dcngettext
libintl_dgettext
libintl_dngettext
libintl_fprintf
libintl_gettext
libintl_ngettext
libintl_printf
libintl_set_relocation_prefix
libintl_setlocale
libintl_snprintf
libintl_sprintf
libintl_textdomain
libintl_vfprintf
libintl_vprintf
libintl_vsnprintf
libintl_vsprintf
ngettext
textdomain
-------------- end libintl-8.def ---------------




2013-08-07 pg_bulkload
----------------------
Build and deployed pg_bulkload.dll on Windows 7 64 bit using cmake as Windows 64 bit target.

Using the command from cygwin (linux) in the postgresql lib directory (copy the lib files) strings -f *.lib | grep 'Visual Studio'
For PostgreSQL 9.3 this is still built with Visual Studio 10.

Built for PostgreSQL 9.2 with Visual Studio 10 (because that is what PostgreSQL was built with).

pg_bulkload.exe not built nor tested

BinaryParam renamed to BinaryParam1 because there was a name overlap on windows compile.

cd c:\somewhere\pg_bulkload\cmake
mkdir build
cd build
cmake -G "Visual Studio 10 Win64" ..
Select release version and build


2013-07-31 pg_bulkload
----------------------
Added option CLEAR_LOG=TRUE which will delete the log file if the operation is successfull.

This is of value when using multiple bulkload operations, e.g. 5 different tables every minute.


2013-06-29 pg_bulkload
----------------------
Built for PostgreSQL 9.3 on Ubuntu 13.04

Merged differences (manually) from pg_bulkload 3.1.3


2013-01-04 pg_bulkload
----------------------
Added support for cmake.

Compiled and tested with ubuntu 12.04 64 bit along with PostgreSQL 9.2.

mkdir cmake/build
cd cmake/build
cmake ..
make
sudo checkinstall --install=no --pkgname=pg-bulkload --pkgversion=3.1.1 --pkglicense=LGPL --maintainer="Poul Bondo \<pba@mailme.dk\>" --provides=pg-bulkload --nodoc --requires="postgresql-9.2"

License:
- Actually I don't know which license the pg_bulkload package is released under, so I put LGPL in the package.

Packaging:
- The package is the server package including the client. The client part should be simply copying the executable file to the relevant ubuntu installation and ensure libpq is installed.

