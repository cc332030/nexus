@echo off

%utf8%

set /p NEXUS_APP=请输入 nexus 安装路径：

set NEXUS="%NEXUS_APP%\bin\nexus"

net stop nexus
%NEXUS% /uninstall

%NEXUS% /install
net start nexus

net status nexus

pause >nul
