#!/bin/bash

DOCKER_PATH="docker_gazebo"
TAG_DOCKER_IMAGE="winter_2021"
TAG_DOCKER_IMAGE_NVIDIA="winter_2021_nvidia"

cd $DOCKER_PATH

docker build --build-arg uid=$(id -u) --tag $TAG_DOCKER_IMAGE . -f "$(pwd)/Dockerfile"
docker build -t $TAG_DOCKER_IMAGE_NVIDIA . -f "$(pwd)/Dockerfile.nvidia"
