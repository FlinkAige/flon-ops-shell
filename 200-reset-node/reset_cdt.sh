#!/bin/bash
# 判断文件是否存在
if [ -z "~/flon.env" ]; then
    echo "Error: No flon.env file found"
    exit 1
fi
source ~/flon.env

docker run -d --name flon-build -v /opt/data:/mnt build-flon-deb:$VERSION tail -f /dev/null


docker exec -it flon-build bash -c "cd /mnt/flon_wal/toolkit.contracts && build"
