@echo off

echo.
set /p NEXUS_APP=请输入 nexus 安装路径：
net stop nexus

set NEXUS_EXE="%NEXUS_APP%\bin\nexus"
%NEXUS_EXE% /uninstall

%NEXUS_EXE% /install
net start nexus

pause >nul
