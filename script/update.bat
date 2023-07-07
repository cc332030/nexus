@echo off

set APP=app
set APP_PATH=%~dp0
set ZIP_PATH=%~dp0release.zip
set URL=https://download.sonatype.com/nexus/3/latest-win64.zip

net stop nexus

curl -L -o %ZIP_PATH% %URL%

7z x -y -o%APP_PATH% %ZIP_PATH%

rmdir /s /q %APP_PATH%%APP%

forfiles /p %APP_PATH% /m nexus* /c "cmd /c rename @file %APP%"

net start nexus

pause >nul
