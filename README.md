
# flon-ops-shell
apt install wget bc
wget https://raw.githubusercontent.com/FlinkAige/flon-ops-shell/refs/heads/main/100-flon-node-add-account/transfer.sh
chmod 777 ./transfer.sh

crontab -e

*/1 * * * *  docker exec fuwal /bin/bash -c '/bin/bash -x /opt/data/transfer.sh > /opt/data/1.log 2 >&1 &'

# 200-reset-node

#  build node
```bash
wget https://raw.githubusercontent.com/FlinkAige/flon-ops-shell/refs/heads/main/200-reset-node/build_node.sh

```
```bash
cat ~/ghcr.txt | docker login ghcr.io -u "$GITHUB_USERNAME" --password-stdin
```
```bash
wget https://raw.githubusercontent.com/FlinkAige/flon-ops-shell/refs/heads/main/200-reset-node/reset_node.sh
chmod 777 ./reset_node.sh

./reset_node.sh flon_devnet_01

```


```bash
wget https://raw.githubusercontent.com/FlinkAige/flon-ops-shell/refs/heads/main/200-reset-node/reset_wal.sh
chmod 777 ./reset_wal.sh
./reset_wal.sh htttp://hk-t1.vmi.nestar.vip:28888
```

```bash
wget https://raw.githubusercontent.com/FlinkAige/flon-ops-shell/refs/heads/main/200-reset-node/reset_cdt.sh
chmod 777 ./reset_cdt.sh
./reset_cdt.sh
```


```bash
wget https://raw.githubusercontent.com/FlinkAige/flon-ops-shell/refs/heads/main/200-reset-node/download_package.sh
chmod 777 ./download_package.sh
./reset_cdt.sh
```

