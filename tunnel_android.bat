@echo off

REM if DEVICE is set, use adb -s %DEVICE%; else use adb
if "%DEVICE%"=="" (
    set ADB=adb
) else (
    set ADB=adb -s %DEVICE%
)

:loop
echo Establishing tunnel
%ADB% root
%ADB% remount
%ADB% forward --remove-all
%ADB% forward tcp:28000 tcp:28000
%ADB% forward tcp:30022 tcp:20022
%ADB% forward tcp:30023 tcp:20023

REM This command will not quit
%ADB% shell LD_LIBRARY_PATH=/data/FAE/android /data/FAE/android/ssh -o StrictHostKeyChecking=no -tt -L 0.0.0.0:28000:cdc-qnx:8000 -L 0.0.0.0:20022:cdc-qnx:22 -L 0.0.0.0:20023:cdc-qnx:23 root@cdc-qnx
timeout /t 1 /nobreak >nul
goto loop 