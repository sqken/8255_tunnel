#!/bin/sh

#DIR="$(cd "$(dirname "$0")" && pwd)"
DIR="/ota/android/qnx"

# echo "Enable ssh root login..."
# sed -i "s/\/var\/ssh/\/etc\/ssh/g" /etc/ssh/sshd_config
# sed -i "s/#ssh/ssh/g" /etc/inetd.conf

# mkdir /root

# echo "Generate ssh key..."
# rm /etc/ssh/ssh_host_rsa_key 
# ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N ""

echo "Copy scp..."
cp ${DIR}/scp /usr/bin
# echo "Copy qconn..."
# cp ${DIR}/qconn /usr/bin

# pid_exists=$(pidin -P sshd | grep sshd)
# if [ "$pid_exists" == "" ];then
#     echo "Starting sshd..."
#     /usr/sbin/sshd
# else
#     echo "Not start sshd as it is already started"
# fi

# pid_exists=$(pidin -P qconn | grep qconn)
# if [ "$pid_exists" == "" ];then
#     echo "Starting qconn..."
#     /usr/bin/qconn
# else
#     echo "Not start qconn as it is already started"
# fi

