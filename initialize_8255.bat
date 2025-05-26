@echo off
set "DIR=%~dp0"

set "ADB=adb"

%ADB% root
%ADB% remount
%ADB% shell rm -rf /data/FAE
%ADB% shell mkdir -p /data/FAE

%ADB% push "%DIR%tools\android" /data/FAE/
%ADB% push "%DIR%tools\qnx" /data/FAE/
%ADB% shell init.mount_qlog.sh
%ADB% shell cp -r /data/FAE/qnx /qlog/
%ADB% shell chmod +x /data/FAE/android/ssh 