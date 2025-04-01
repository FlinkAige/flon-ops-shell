
CONTRACT_PATH=$1
# 安装依赖
apt install -y libssl-dev libboost-all-dev libgmp3-dev libbz2-dev libreadline-dev libncurses5-dev libusb-1.0-0-dev libudev-dev libusb-dev libusb-1.0-0
apt install libcurl4-gnutls-dev cmake -y


cd $CONTRACT_PATH/flon.contracts
build
cd $CONTRACT_PATH/toolkit.contracts
build