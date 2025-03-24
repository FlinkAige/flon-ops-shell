
apt install wget bc

# flon-ops-shell

wget https://raw.githubusercontent.com/FlinkAige/flon-ops-shell/refs/heads/main/100-flon-node-add-account/transfer.sh

crontab -e

*/1 * * * *  docker exec flon_wal /bin/bash -c '/bin/bash -x /opt/data/transfer.sh > /opt/data/1.log 2 >&1 &'
