#include "environment.iss"

#define MyAppName "primesieve"
#define MyAppVersion "7.5"
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
UninstallDisplayIcon={app}\primesieve.ico 
DisableProgramGroupPage=yes
LicenseFile=C:\Users\kimwa\OneDrive\Documents\GitHub\primesieve-winget\inno-setup\primesieve-{#MyAppVersion}-win64-console\COPYING
; Uncomment the following line to run in non administrative install mode (install for current user only.)
;PrivilegesRequired=lowest
OutputDir=C:\Users\kimwa\OneDrive\Documents\GitHub\primesieve-winget\inno-setup
OutputBaseFilename=primesieve-{#MyAppVersion}-win64
Compression=lzma
SolidCompression=yes
WizardStyle=modern
ArchitecturesInstallIn64BitMode=x64
ChangesEnvironment=true

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: "C:\Users\kimwa\OneDrive\Documents\GitHub\primesieve-winget\inno-setup\primesieve-{#MyAppVersion}-win64-console\primesieve.exe"; DestDir: "{app}\bin"; Flags: ignoreversion
Source: "C:\Users\kimwa\OneDrive\Documents\GitHub\primesieve-winget\inno-setup\primesieve-{#MyAppVersion}-win64-console\COPYING"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\kimwa\OneDrive\Documents\GitHub\primesieve-winget\inno-setup\primesieve-{#MyAppVersion}-win64-console\README.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\kimwa\OneDrive\Documents\GitHub\primesieve-winget\inno-setup\primesieve.ico"; DestDir: "{app}"
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
