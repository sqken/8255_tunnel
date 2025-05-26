#!/bin/bash
DIR="$(cd "$(dirname "$0")" && pwd)"

ADB="adb"

${ADB} root
${ADB} remount
${ADB} shell rm -rf /data/FAE
${ADB} shell mkdir -p /data/FAE

${ADB} push ${DIR}/tools/* /data/FAE/
${ADB} shell init.mount_qlog.sh
${ADB} shell cp -r /data/FAE/qnx /qlog/
${ADB} shell chmod +x /data/FAE/android/ssh
