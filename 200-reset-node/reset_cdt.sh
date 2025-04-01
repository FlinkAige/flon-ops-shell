#!/bin/bash
# 判断文件是否存在
if [ -z "~/flon.env" ]; then
    echo "Error: No flon.env file found"
    exit 1
fi
source ~/flon.env

docker run -d --name flon-build -v ~/:/mnt ${NODE_IMG_HEADER}fullon/floncdt:$VERSION tail -f /dev/null


docker exec -it flon-build bash -c "cd /mnt/fuwal/toolkit.contracts && ./build.sh"
docker exec -it flon-build bash -c "cd /mnt/fuwal/flon.contracts && ./build.sh"
