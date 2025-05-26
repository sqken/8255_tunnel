# qt/bin/avm_app 推到 /mnt/usr/bin/avm_app
# qt/qml/AvmApp/* 推到 /mnt/opt/qt/qml/AvmApp/目录下
# qt/qml/content_avm_cdc/* 推到 /mnt/opt/qt/qml/content_avm_cdc/目录下
# qt/libQt6Mega.so.6.8.0 推到 /mnt/opt/qt/lib/目录下

/ifs/bin/mount -uw /mnt/

cd /log/qlog/
# /mnt/bin/tar zxvf /log/qlog/avm.tar.gz
/mnt/bin/mv /mnt/usr/bin/avm_app /mnt/usr/bin/avm_app.ori
/ifs/bin/cp qt/bin/avm_app /mnt/usr/bin/avm_app
/ifs/bin/cp -R qt/qml/content_avm_cdc/* /mnt/opt/qt/qml/content_avm_cdc/
/ifs/bin/cp qt/libQt6Mega.so.6.8.0 /mnt/opt/qt/lib/

/ifs/bin/slay avm_app