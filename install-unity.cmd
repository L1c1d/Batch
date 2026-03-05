:: Installs Hyland OnBase Unity Client
:: This script assumes you have the required files
:: The following flags have generic values. Replace them with yours.
:: SERVICE_LOCATION_DISPLAY_NAME=
:: SERVICE_LOCATION_SERVICE_PATH=
:: SERVICE_LOCATION_DATA_SOURCE=
:: https://community.hyland.com/en/public-dashboard


SETLOCAL

@echo off


::Begin OnBase Unity Installation
START /WAIT msiexec.exe /i "%~dp0Hyland Unity Client.msi" ADDLOCAL=VirtualPrintDriverListener IISROOTFOLDER="C:\" CREATE_DESKTOP_SHORTCUTS="1" UNITYCLIENT_SERVICEMODE_DISABLEAUTORUN="1" SERVICE_LOCATION_NT_AUTH="true" UNITYCLIENT_FILES="C:\Program Files (x86)\Hyland\Unity Client\" REGISTERED_COMPONENTS_APPENABLER="C:\Program Files (x86)\Common Files\Hyland Software\RegisteredComponents\ApplicationEnabler\" SERVICE_LOCATION_DISPLAY_NAME="OnBase" SERVICE_LOCATION_SERVICE_PATH="https://yourwebserver/service.asmx" SERVICE_LOCATION_DATA_SOURCE="DATA_SOURCE_NAME" INSTALLLOCATION="C:\Program Files (x86)\Hyland\Unity Client\" /q /L*V "C:\temp\onbaseunity.log"
timeout 10

::Copy new shortcut to public desktop
start xcopy "%~dp0Unity Client.lnk" "C:\Users\Public\Desktop\" /q /y

:: Exit - done
exit /B %EXIT_CODE%



