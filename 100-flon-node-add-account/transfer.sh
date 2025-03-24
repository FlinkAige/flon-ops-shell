shopt -s expand_aliases
source ~/.bashrc
focli wallet unlock -n test --password $1

acc=$(cat /dev/urandom | tr -dc 'a-z' | fold -w 12 | head -n 1)
tcli system newaccount flon $acc FU8ixPk3x4wZQu1bwBtw67JznFr5LVcA9bfDpkS7grnms3JNm7Qq  --transfer-quant "10.000000 FLON" -p flon
sleep 3
random_string=$(cat /dev/urandom | tr -dc '1-9' | fold -w 3 | head -n 1)
result=$(echo "scale=2; $random_string / 100" | bc)

tcli transfer flon $acc "${result} FLON"
