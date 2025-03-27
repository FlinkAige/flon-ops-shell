```bash
# Install dependencies
sudo apt update && sudo apt install -y wget bc

# Setup flon-ops-shell
mkdir -p ~/flon-ops && cd ~/flon-ops

# Download transfer script
wget -q https://raw.githubusercontent.com/FlinkAige/flon-ops-shell/main/100-flon-node-add-account/transfer.sh -O transfer.sh
chmod +x transfer.sh

# Setup cron job (run every minute)
(crontab -l 2>/dev/null; echo "*/1 * * * * docker exec flon_wal /bin/bash -c '/bin/bash -x /opt/data/transfer.sh > /opt/data/transfer.log 2>&1'") | crontab -

# Download and setup reset-node scripts
wget -q https://raw.githubusercontent.com/FlinkAige/flon-ops-shell/main/200-reset-node/{reset_node.sh,build_node.sh,reset_wal.sh}
chmod +x {reset_node.sh,reset_wal.sh}

# Execute reset scripts
./reset_node.sh flon_devnet_01
./reset_wal.sh
