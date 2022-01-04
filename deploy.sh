#!/bin/bash

# This script builds our rust project and deploys it to raspberry pi with the
# necessary files and service

set -o errexit -o nounset -o pipefail -o xtrace

echo -e "\n[***] Deploying...\n"

readonly TARGET_HOST=rpi
readonly TARGET_PATH=/home/pi/ws/hello-rpi-docker
readonly TARGET_ARCH=armv7-unknown-linux-gnueabihf
readonly SOURCE_PATH=./target/${TARGET_ARCH}/release/hello-rpi-docker

cargo build --release --target=${TARGET_ARCH}
rsync ${SOURCE_PATH} ${TARGET_HOST}:${TARGET_PATH}

SERVICE_NAME=hello-rpi-docker.service
rsync utils/${SERVICE_NAME} ${TARGET_HOST}:/tmp
ssh -v -t ${TARGET_HOST} 'bash -s' < ssh_script.sh ${SERVICE_NAME}
