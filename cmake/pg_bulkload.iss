;====================================================================
;
; 
; Inno Setup 5 Install Script
;
; Core application
;--------------------------------------------------------------------
;
;====================================================================

#define BUILDNUMBER "1"
#define VERSIONNUMBER "v3.1.6"

#define PG_VERSION "9.5"


[Setup]
AppName=pg_bulkload
AppVerName=pg_bulkload {#VERSIONNUMBER} build {#BUILDNUMBER}
DefaultDirName={pf64}\PostgreSQL\{#PG_VERSION}\pg_bulkload
DefaultGroupName=pg_bulkload
OutputBaseFilename=pg_bulkload_{#VERSIONNUMBER}
UninstallDisplayName=pg_bulkload_{#VERSIONNUMBER}_uninstall
PrivilegesRequired=admin
Compression=lzma
SolidCompression=yes

[Files]
Source: "build/bin/Release/pg_bulkload.exe"; DestDir: "{app}/../bin"
Source: "build/lib/Release/pg_bulkload.dll"; DestDir: "{app}/../lib"
Source: "../share/extension/pg_bulkload--1.0.sql"; DestDir: "{app}/../share/extension/"
Source: "../share/extension/pg_bulkload.control"; DestDir: "{app}/../share/extension/"

[Run]

[UninstallRun]

[Tasks]

[Code]
