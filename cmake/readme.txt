
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
