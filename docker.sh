#!/bin/bash

# logs out key :/
docker_build () {
  docker build \
    --build-arg ssh_prv_key="$(cat ~/.ssh/rpi)" \
    --build-arg ssh_pub_key="$(cat ~/.ssh/rpi.pub)" \
    -t hello-rpi .
}

docker_run () {
  docker run -it --rm --name hello-rpi-docker hello-rpi
}


if [[ "$1" = "--build" ]]; then
  docker_build
elif [[ "$1" = "--run" ]]; then
  docker_run
else
  docker_build && docker_run
fi
