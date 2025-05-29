@REM scp -P 30022 Z:\work\cardiff\output\binary\opt\apps\latest\avm.tar.gz root@127.0.0.1:/log/qlog/
@REM scp -P 30022 update_avm.sh root@127.0.0.1:/log/qlog/
@REM ssh -p 30022 root@127.0.0.1 /ifs/bin/chmod +x /log/qlog/update_avm.sh
@REM ssh -p 30022 root@127.0.0.1 /ifs/bin/sh /log/qlog/update_avm.sh

adb shell init.mount_qlog.sh
adb push mnt.zip /qlog
adb shell unzip /qlog/mnt.zip -d /qlog/

ssh -p 30022 root@127.0.0.1 /ifs/bin/mount -uw /mnt/
ssh -p 30022 root@127.0.0.1 /ifs/bin/rm /mnt/usr/bin/avm_app
ssh -p 30022 root@127.0.0.1 /ifs/bin/cp -r /log/qlog/mnt/* /mnt/
ssh -p 30022 root@127.0.0.1 /ifs/bin/slay avm_app
