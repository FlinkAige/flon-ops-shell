
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
./download_package.sh toolkit.contracts $VERSION

# 进入容器
docker exec -it flon_devnet_01 bash

# 安装依赖
apt install -y libssl-dev libboost-all-dev libgmp3-dev libbz2-dev libreadline-dev libncurses5-dev libusb-1.0-0-dev libudev-dev libusb-dev libusb-1.0-0
apt install libcurl4-gnutls-dev cmake -y
cd $CONTRACT_PATH/flon.contracts
build
cd $CONTRACT_PATH/toolkit.contracts
build





