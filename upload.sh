#!/bin/bash

cmake --build build -- -j8
cmake --install build

# File to upload
FILE="/home/deck/usr/lib/libSDL3.so.0.3.0"

# Remote server info
USER="root"
HOST="192.168.1.37"
REMOTE_DIR="lib/"
PASSWORD="rocknix"

# Upload using sshpass
sshpass -p "$PASSWORD" scp "$FILE" "${USER}@${HOST}:${REMOTE_DIR}"

# Check result
if [ $? -eq 0 ]; then
    echo "Upload successful."
else
    echo "Upload failed."
fi
