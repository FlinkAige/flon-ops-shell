
#!/bin/bash
# 启动image

if [ -z "~/flon.env" ]; then
    echo "Error: No flon.env file found"
    exit 1
fi
source ~/flon.env

docker_instance_name=flon_devnet_01
./reset_node.sh $flon_devnet_01
CONTRACT_PATH=/opt/data/flon_devnet_01/contracts
mkdir -p $CONTRACT_PATH
cd  $CONTRACT_PATH

git clone https://github.com/fullon-labs/flon.contracts.git
git clone https://github.com/fullon-labs/toolkit.contracts.git

./download_package.sh flon.cdt $CDT_VERSION
./download_package.sh fullon $FULLON_VERSION

# 进入容器
docker exec -it flon_devnet_01 bash

#在容器里执行 2_build_contract.sh





