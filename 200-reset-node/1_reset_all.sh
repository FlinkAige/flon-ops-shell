
#!/bin/bash
# 启动image

if [ -z "~/flon.env" ]; then
    echo "Error: No flon.env file found"
    exit 1
fi
source ~/flon.env

docker_instance_name=flon_devnet_02
./reset_node.sh $docker_instance_name
CONTRACT_PATH=~/fuwal/contracts
mkdir -p $CONTRACT_PATH
cd  $CONTRACT_PATH

git clone https://github.com/fullon-labs/flon.contracts.git
git clone https://github.com/fullon-labs/toolkit.contracts.git
git clone git@gitlab.com:fufidev/wasm/fufi.contracts.git
cd fufi.contracts
git checkout flon-dev

cd $CONTRACT_PATH
git clone git@github.com:truedex-labs/xchain.contracts.git
cd xchain.contracts
git checkout flon-dev
cd $CONTRACT_PATH


wget https://raw.githubusercontent.com/FlinkAige/flon-ops-shell/refs/heads/main/200-reset-node/download_package.sh
chmod 777 ./download_package.sh

./download_package.sh flon.cdt $CDT_VERSION
./download_package.sh fullon $FULLON_VERSION

# 进入容器
docker exec -it ${docker_instance_name} bash

#在容器里执行 2_build_contract.sh





