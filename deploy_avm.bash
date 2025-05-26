scp -P 30022 Z:\work\cardiff\output\binary\opt\apps\latest\avm.tar.gz root@127.0.0.1:/log/qlog/
scp -P 30022 update_avm.sh root@127.0.0.1:/log/qlog/
ssh -p 30022 root@127.0.0.1 /log/qlog/update_avm.sh
