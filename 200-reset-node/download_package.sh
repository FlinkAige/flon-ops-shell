
#!/bin/bash

# Define common variables
BASE_URL="https://flon-test.oss-cn-hongkong.aliyuncs.com/deb"
ARCH="amd64"


# Download function with error handling
download_package() {
    local package=$1
    local version=$2
    local filename="${package}_${version}_${ARCH}.deb"
    local url="${BASE_URL}/${filename}"
    
    echo "Downloading ${filename}..."
    if ! wget "$url"; then
        echo "Error: Failed to download ${filename}" >&2
        exit 1
    fi
    echo "Successfully downloaded ${filename}"
}
echo "package downloaded successfully."

download_package $1 $2