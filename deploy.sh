#!/bin/bash

set -o errexit -o nounset -o pipefail -o xtrace

echo "Deploying..."

readonly TARGET_HOST=rpi
readonly TARGET_PATH=/home/pi/ws/hello-rpi-docker
readonly TARGET_ARCH=armv7-unknown-linux-gnueabihf
readonly SOURCE_PATH=./target/${TARGET_ARCH}/release/hello-rpi-docker

cargo build --release --target=${TARGET_ARCH}
rsync ${SOURCE_PATH} ${TARGET_HOST}:${TARGET_PATH}
# ssh -v -t ${TARGET_HOST} sudo systemctl restart hello-rpi-docker.service
ssh -v -t ${TARGET_HOST}
