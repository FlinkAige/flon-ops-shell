#!/bin/bash

# 初始化环境
shopt -s expand_aliases
source ~/.bashrc || { echo "Error: Failed to source ~/.bashrc"; exit 1; }

# 检查是否已解锁钱包
unlockt

creator="flon"
account_prefix=$1
fund_amount="1.00000000 FLON"
gas_amount="1.000000000 FLON"

# 生成密钥对
echo "Generating key pair..."
ret=$(tcli create key --to-console) || { echo "Error: Failed to create key"; exit 1; }

privKey=${ret:13:51}
pubKey=$(echo "$ret" | awk 'END{print substr($0,length($0)-51,52)}')

echo "Private Key: $privKey"
echo "Public Key: $pubKey"

# 导入私钥
pki "$privKey" || { echo "Error: Failed to import private key"; exit 1; }

# 创建账户函数
create_account() {
    local suffix=$1
    local funding=$2
    local account_name="${account_prefix}${suffix}"
    
    echo "Creating account $account_name..."
    fucli -u "$turl" system newaccount "$creator" "$account_name" "$pubkey" \
        --"$funding" "$fund_amount" -p "$creator" || \
        { echo "Error: Failed to create account $account_name"; return 1; }
}

# 批量创建账户
for suffix in 11 12 13 14; do
    create_account "$suffix" "fund-account"
done

for suffix in 21 22 23 24; do
    create_account "$suffix" "fund-gas"
done

echo "All accounts created successfully."