#!/bin/bash

# if DEVICE is set, use adb -s $DEVICE; else use adb
if [ -z "$DEVICE" ]; then
    ADB="adb"
else
    ADB="adb -s $DEVICE"
fi

# Mount qlog partition for sharing /qlog directory between android and qnx
${ADB} shell init.mount_qlog.sh

while [ 1 ];
do
    echo "Establishing tunnel"
    ${ADB} root
    ${ADB} remount
    ${ADB} forward --remove-all
    ${ADB} forward tcp:28000 tcp:28000
    ${ADB} forward tcp:30022 tcp:20022
    ${ADB} forward tcp:30023 tcp:20023

    # This commmand will not quite
    ${ADB} shell LD_LIBRARY_PATH=/data/FAE/android /data/FAE/android/ssh -o StrictHostKeyChecking=no -tt -L 0.0.0.0:28000:cdc-qnx:8000 -L 0.0.0.0:20022:cdc-qnx:22 -L 0.0.0.0:20023:cdc-qnx:23 root@cdc-qnx
    sleep 1
done
