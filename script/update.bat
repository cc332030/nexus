@echo off

set APP=app
set APP_PATH=%~dp0

set ZIP_NAME=release.zip
set TMP_SUFFER=.tmp

set ZIP_PATH=%APP_PATH%%ZIP_NAME%
set URL=https://download.sonatype.com/nexus/3/latest-win64.zip

set NEXUS_EXE="%APP_PATH%%APP%\bin\nexus"

curl -L -o %ZIP_PATH%%TMP_SUFFER% %URL%

del /f /s /q %ZIP_NAME%
rename %ZIP_NAME%%TMP_SUFFER% %ZIP_NAME%

7z x -y -o%APP_PATH% %ZIP_PATH%

%NEXUS_EXE% /uninstall

rmdir /s /q %APP_PATH%%APP%

forfiles /p %APP_PATH% /m nexus* /c "cmd /c rename @file %APP%"

%NEXUS_EXE% /install
net start nexus

pause >nul
