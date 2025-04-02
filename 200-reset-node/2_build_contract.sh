
CONTRACT_PATH=$1/contracts
CONTRACT_PATH=/opt/data/flon_devnet_02/contracts

#删除无效的文件
cd /usr/local/lib/cmake
rm -rf flon.cdt
cd ../../bin
rm -rf cdt-*


# 安装依赖
apt update
apt install -y libssl-dev libboost-all-dev libgmp3-dev libbz2-dev libreadline-dev libncurses5-dev libusb-1.0-0-dev libudev-dev libusb-dev libusb-1.0-0
apt install libcurl4-gnutls-dev cmake -y
apt install -y g++
apt install libz3-dev

cd $CONTRACT_PATH/
apt-get install -y ./flon.cdt_0.3.0-alpha_amd64.deb

cd $CONTRACT_PATH/flon.contracts
./build.sh -y
cd $CONTRACT_PATH/toolkit.contracts
./build.sh -y
cd $CONTRACT_PATH/fufi.contracts
./build.sh -y 
