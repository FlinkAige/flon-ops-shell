CONTAINER_NAME=flon_wal

DATA_DIR="/opt/data/$CONTAINER_NAME"

# Stop and remove the container if it exists
if docker ps -a | grep -q "$CONTAINER_NAME"; then
    docker stop "$CONTAINER_NAME" >/dev/null 2>&1
    docker rm "$CONTAINER_NAME" >/dev/null 2>&1
    echo "Container $CONTAINER_NAME stopped and removed"
else
    echo "Container $CONTAINER_NAME not found - skipping stop/remove"
fi

# Remove data directory if it exists
if [ -d "$DATA_DIR" ]; then
    sudo rm -rf "$DATA_DIR"
    echo "Data directory $DATA_DIR removed"
else
    echo "Data directory $DATA_DIR not found - skipping removal"
fi

cd $HOME/flon-docker/flon.chain/node-wal/
./run-fuwal.sh $DATA_DIR



cd /opt/data/flon_wal 
git clone git@github.com:FlinkAige/flon-docker.git
git clone git@github.com:fullon-labs/toolkit.contracts.git


docker exec -it flon-wal bash -c "cd /opt/flon/flon-docker/flon.chain/node-boot/devnet && ./run.init.chain.sh http://hk-t3.vmi.nestar.vip:28888"

docker exec -it flon-wal bash
cd /opt/flon/toolkit.contracts

