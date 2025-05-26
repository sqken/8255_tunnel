# Description
Mega 8155 contains Android and QNX system thanks to the hypervisor technology;
However, original method of transferring file between Host and QNX is terrible
which contains the following steps:
1: adb push to /data (At Host)
2: cp /data/<file> to /ota/<file> (ADB Login to Android)
3: cp /ota/android/<file> to <Destination>/<file> (Telnet Login to QNX)
Frequently transfer file between Host And QNX during debug and development stage
is very low efficient.

This boottrap tool is used to set up a more efficient debug/development
environment by optimizing file transfer between Host and QNX

# New File Transfer method between Host and QNX
## For Board that has ethernet connection
- At QNX: ssh server with root login permitted will be enabled
then scp <QNX_IP> can be used to transfer

## For Board that does not have ethernet connection
- At QNX: ssh server with root login permitted will be enabled
- A Port Forward will be set up between Android and QNX by ssh tunnel
- A Port Forward  will be set up between Android and host by adb forward

# Script Explaination
## initialize_8155.bash (For Linux)
1: adb push all contents of local tools folder to /data (Android)
2: copy tools/qnx to /ota/folder
3: login to qnx and execute enable_ssh.sh

## initialize_8155.bat (For Windows)
Do the same with step 1,2 above, but as windows does not have expect(Linux tool),
step 3 is not executed.

You need to manually login to qnx and execute enable_ssh.sh

## tools/qnx/enable_ssh.sh
1: modify /etc/ssh/sshd_config to permit root login
2: generate ssh key at /etc/ssh
3: copy scp, qconn to /usr/bin/
4: start ssh server
5: start qcon server(QNX GDB Server)

## tunnel_android.bash (For Linux)
For Board that does not have ethernet connection.

1: adb forward port between Host and Android
2: ssh tunnel forward port betweem Android and QNX

Currenly the following ports are forwarded for QNX:
- 22
- 23
- 8000 (QCONN, for GDB)

## tunnel_android.bat (For Windows)
The same for tunnel_android.bash; However, tests show that win10 only support binding
to local port

# Script Usage
## initialize_8155.xxx
After a new flash with QFIL:
1: make sure board is already adb rooted
```
adb root
adb remount
adb reboot
```
2: if adb can not connect, it might be possibe the usb is not in client mode,
enter the following command in android:
```
setprop sys.usb.mode device
```
Could telnet to Android in QNX

3: excute the script
```
# On Linux
bash initialize_8155.bash
# On Windows
./initialize_8155.bat
```

4: After that SSH server is started on QNX

## tunnel_android.xxx
For Board that does not have ethernet connection.

make sure initialize_8155.xxx has been executed succesfully.
```
# On Linux
bash tunnel_android.bash
# On Windows
./tunnel_android.bat
```

# Test Log
Veririfed on:
e03-cdc-8155-release_pinnacles_hqx.1.2.1_20230410-soc_full-secure-1.130.105.32914-20230626074250.tgz


