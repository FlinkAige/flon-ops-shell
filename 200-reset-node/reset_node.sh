#!/bin/bash

# Ensure a container name was provided
if [ -z "$1" ]; then
    echo "Error: No container name specified"
    echo "Usage: $0 <container_name>"
    exit 1
fi
cd $HOME/flon-docker/flon.chain/node-run/
bash -x ./1-setup-node-env.sh
sleep 1

CONTAINER_NAME=$1
DATA_DIR="/opt/data/$1"
APP_DIR="$HOME/.$1"

rm -r $APP_DIR

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

# Run the new container if the app directory exists
if [ -d "$APP_DIR" ] && [ -f "$APP_DIR/run.sh" ]; then
    echo "Starting new container from $APP_DIR"
    cd "$APP_DIR" || exit 1
    bash -x ./run.sh
else
    echo "Error: App directory $APP_DIR or run.sh not found"
    exit 1
fi