#!/bin/bash

# create a builder
docker buildx create --name multibuild

# add a node to the builder
docker buildx create --name multibuild --append tcp://antenna.local:2376
docker buildx create --name multibuild --node multibuild1 --platform linux/arm

# start the nodes
docker buildx use multibuild
docker buildx inspect --bootstrap

# build
docker buildx build -t dennisdunn/rtl-sdr-blog:latest --platform linux/amd64,linux/arm --push .

# remove builder
docker buildx rm multibuild
