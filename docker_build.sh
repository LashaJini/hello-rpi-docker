#!/bin/bash

# logs out key :/
docker build \
  --build-arg ssh_prv_key="$(cat ~/.ssh/rpi)" \
  --build-arg ssh_pub_key="$(cat ~/.ssh/rpi.pub)" \
  -t hello-rpi .

# docker run -it --rm --name hello-rpi-docker hello-rpi
