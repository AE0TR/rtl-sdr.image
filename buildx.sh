#!/bin/bash
if [ -z "$1" ]; then 
    echo "usage: $0 arm_build_node ($0 tcp://raspberrypi.local:2376)"
    exit
fi

ARM_NODE=$1

# create a builder
docker buildx create --name multibuild

# add a node to the builder
docker buildx create --name multibuild --append $ARM_NODE
docker buildx create --name multibuild --node multibuild1 --platform linux/arm

# start the nodes
docker buildx use multibuild
docker buildx inspect --bootstrap

# build
docker buildx build -t dennisdunn/rtl-sdr-blog:latest --platform linux/amd64,linux/arm --push .

# remove builder
docker buildx rm multibuild
