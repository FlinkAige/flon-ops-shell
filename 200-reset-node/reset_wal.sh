CONTAINER_NAME=fuwal

DATA_DIR="~/${CONTAINER_NAME}/"

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

cd $HOME/flon-docker/flon.chain/node-boot
./docker.run.sh $1 

cd $DATA_DIR
git clone https://github.com/fullon-labs/toolkit.contracts.git


git clone https://github.com/fullon-labs/flon.contracts.git
git clone  git@github.com:fullon-labs/interop.contracts.git
git checkout flon-dev
