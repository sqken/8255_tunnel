#!/bin/bash
DIR="$(cd "$(dirname "$0")" && pwd)"

ADB="adb"

${ADB} root
${ADB} remount
${ADB} shell rm -rf /data/FAE
${ADB} shell mkdir -p /data/FAE

${ADB} push ${DIR}/tools/* /data/FAE/
${ADB} shell cp -r /data/FAE/qnx /ota/
${ADB} shell chmod +x /data/FAE/android/ssh

expect << EOF
spawn adb shell telnet cdc-qnx
expect "login:"
send "root\r"
expect "#"
send "sh /ota/android/qnx/enable_ssh.sh\r"
expect "#"
send "exit\r"
EOF
