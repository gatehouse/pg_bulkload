How to build with Microsoft Visual Studio C++ 2010

2012-11-04 Poul Bondo

Built for PostgreSQL 9.2 which is also built with VS10. Therefore it is easier to get working than later VS11++

Only tested with 64 bit version.

You might need to add the following directories:
  into "include files"
    - C:\Program Files\PostgreSQL\9.2\include
    - C:\Program Files\PostgreSQL\9.2\include\internal
    - C:\Program Files\PostgreSQL\9.2\include\server
    - C:\Program Files\PostgreSQL\9.2\include\server\port\win32
    - C:\Program Files\PostgreSQL\9.2\include\server\port\win32_msvc
  into "library files"
    - C:\Program Files\PostgreSQL\9.2\lib

To create the libintl.lib do the following:
See or search for similar: http://adrianhenke.wordpress.com/2008/12/05/create-lib-file-from-dll/

dumpbin /exports libintl-8.dll /OUT:libintl.def
Fixup libintl.def to just contain the function names
lib /MACHINE:X64   /def:libintl.def /OUT:libintl.lib

It will produce a libintl.lib file. Put it in the postgresql/9.2/lib/ directory.

Installing on Windows.
copy pg_bulkload.dll to postgresql/9.2/lib/
copy share/extension/pg_bulkload--1.0.sql and pg_bulkload.control to postgresql/9.2/share/extension/

Then from any application "create extension if not exist pg_bulkload;"

ToDo! 
- Create installers for Windows and apt.
- Create cmake build files.
- Create a client lib/dll/so for using directly from a client application instead of spawning a pg_bulkload process.

How to build with Microsoft Visual C++ Express 2005

You might need:
  1. Register PostgreSQL directory to your environment.
  2. Resolve redefinitions of ERROR macro.

----
1. Register PostgreSQL directory to your environment.

The directory configuration options are found in:
  Tool > Option > Projects and Solutions > VC++ directory

You might need to add the following directories:
  into "include files"
    - C:\Program Files\PostgreSQL\8.4\include
    - C:\Program Files\PostgreSQL\8.4\include\internal
    - C:\Program Files\PostgreSQL\8.4\include\server
    - C:\Program Files\PostgreSQL\8.4\include\server\port\win32
    - C:\Program Files\PostgreSQL\8.4\include\server\port\win32_msvc
  into "library files"
    - C:\Program Files\PostgreSQL\8.4\lib

----
2. Resolve redefinitions of ERROR macro.

It might be a bad manner, but I'll recommend to modify your wingdi.h.

--- wingdi.h       2008-01-18 22:17:42.000000000 +0900
+++ wingdi.fixed.h 2010-03-03 09:51:43.015625000 +0900
@@ -101,11 +101,10 @@
 #endif // (_WIN32_WINNT >= _WIN32_WINNT_WINXP)

 /* Region Flags */
-#define ERROR               0
+#define RGN_ERROR           0
 #define NULLREGION          1
 #define SIMPLEREGION        2
 #define COMPLEXREGION       3
-#define RGN_ERROR ERROR

 /* CombineRgn() Styles */
 #define RGN_AND             1
