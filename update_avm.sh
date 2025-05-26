# qt/bin/avm_app 推到 /mnt/usr/bin/avm_app
# qt/qml/AvmApp/* 推到 /mnt/opt/qt/qml/AvmApp/目录下
# qt/qml/content_avm_cdc/* 推到 /mnt/opt/qt/qml/content_avm_cdc/目录下
# qt/libQt6Mega.so.6.8.0 推到 /mnt/opt/qt/lib/目录下

mount -uw /mnt/

cd /log/qlog/
tar zxvf /log/qlog/avm.tar.gz
mv /mnt/usr/bin/avm_app /mnt/usr/bin/avm_app.ori
cp qt/qml/AvmApp/* /mnt/opt/qt/qml/AvmApp/
cp qt/qml/content_avm_cdc/* /mnt/opt/qt/qml/content_avm_cdc/
cp qt/libQt6Mega.so.6.8.0 /mnt/opt/qt/lib/

slay avm_app