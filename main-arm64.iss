#include "environment.iss"

#define MyAppName "Primesieve"
#define MyAppVersion "12.5"
#define MyAppPublisher "Kim Walisch"
#define MyAppURL "https://github.com/kimwalisch/primesieve"
#define MyAppExeName "primesieve.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{2B8F55EA-6B3B-481D-8021-AA7D17AF0848}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={autopf}\{#MyAppName}
SetupIconFile=primesieve.ico
UninstallDisplayIcon={app}\primesieve.ico
DisableProgramGroupPage=yes
LicenseFile=primesieve-{#MyAppVersion}-win-arm64\COPYING
; Uncomment the following line to run in non administrative install mode (install for current user only.)
;PrivilegesRequired=lowest
OutputBaseFilename={#MyAppName}-{#MyAppVersion}-win-arm64
Compression=lzma
SolidCompression=yes
WizardStyle=modern
ArchitecturesInstallIn64BitMode=arm64
ChangesEnvironment=true

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: "primesieve-{#MyAppVersion}-win-arm64\primesieve.exe"; DestDir: "{app}\bin"; Flags: ignoreversion
Source: "primesieve-{#MyAppVersion}-win-arm64\COPYING"; DestDir: "{app}"; Flags: ignoreversion
Source: "primesieve-{#MyAppVersion}-win-arm64\README.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "primesieve.ico"; DestDir: "{app}"
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Code]
procedure CurStepChanged(CurStep: TSetupStep);
begin
    if CurStep = ssPostInstall 
     then EnvAddPath(ExpandConstant('{app}') +'\bin');
end;

procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
begin
    if CurUninstallStep = usPostUninstall
    then EnvRemovePath(ExpandConstant('{app}') +'\bin');
end;
