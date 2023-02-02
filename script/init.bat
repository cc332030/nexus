@echo off

%utf8%

echo.
set /p NEXUS_APP=请输入 nexus 安装路径：
net stop nexus

set NEXUS_WORK="%NEXUS_APP%\..\sonatype-work\nexus3"
set NEXUS_CACHE=F:\data\nexus

call link-dir %NEXUS_CACHE%\blobs %NEXUS_WORK%\blobs
call link-dir %NEXUS_CACHE%\cache %NEXUS_WORK%\cache
call link-dir %NEXUS_CACHE%\log %NEXUS_WORK%\log
call link-dir %NEXUS_CACHE%\tmp %NEXUS_WORK%\tmp

set NEXUS_EXE="%NEXUS_APP%\bin\nexus"
%NEXUS_EXE% /uninstall

%NEXUS_EXE% /install
net start nexus

pause >nul
