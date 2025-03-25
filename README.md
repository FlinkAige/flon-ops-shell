# flon-ops-shell

wget https://raw.githubusercontent.com/FlinkAige/flon-ops-shell/refs/heads/main/100-flon-node-add-account/transfer.sh

crontab -e

*/1 * * * *  docker exec flon-wal /bin/bash -c '/bin/bash -x /root/transfer.sh PW5HyFehCJ4r4TKtUnPnLaK2SzXjhShs9rtWRkH75511RtFKceWfx > /opt/data/1.log 2 >&1 &'