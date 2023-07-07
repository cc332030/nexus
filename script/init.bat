@echo off

echo.
net stop nexus

set NEXUS_EXE="%~dp0app\bin\nexus"
%NEXUS_EXE% /uninstall

%NEXUS_EXE% /install
net start nexus

pause >nul
