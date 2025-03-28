
apt install wget bc

# flon-ops-shell

wget https://raw.githubusercontent.com/FlinkAige/flon-ops-shell/refs/heads/main/100-flon-node-add-account/transfer.sh
chmod 777 ./transfer.sh

crontab -e

*/1 * * * *  docker exec flon_wal /bin/bash -c '/bin/bash -x /opt/data/transfer.sh > /opt/data/1.log 2 >&1 &'

# 200-reset-node

#  build node
```bash
wget https://raw.githubusercontent.com/FlinkAige/flon-ops-shell/refs/heads/main/200-reset-node/build_node.sh

```

```bash
wget https://raw.githubusercontent.com/FlinkAige/flon-ops-shell/refs/heads/main/200-reset-node/reset_node.sh
chmod 777 ./reset_node.sh

./reset_node.sh flon_devnet_01

```



```bash
wget https://raw.githubusercontent.com/FlinkAige/flon-ops-shell/refs/heads/main/200-reset-node/reset_wal.sh
chmod 777 ./reset_wal.sh
./reset_wal.sh htttp://hk-t3.vmi.nestar.vip:28888
```