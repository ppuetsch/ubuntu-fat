#!/bin/bash
HOST_VOLUME_MOUNT="-v $(docker inspect $HOSTNAME | grep ":/hostDirectory" | tr ',"' ' ')"
ALL_VOLUME_MOUNTS=$(docker volume list | awk '{printf "%s", " -v"$2":/docker-volumes/"$2}')
DOCKER_SOCKET_MOUNT="-v /var/run/docker.sock:/var/run/docker.sock"
ROOT_VOLUME_MOUNT="-v ubuntu-root:/root"

docker run -ti $ROOT_VOLUME_MOUNT $HOST_VOLUME_MOUNT $DOCKER_SOCKET_MOUNT $ALL_VOLUME_MOUNTS ppuetsch/ubuntu-fat:latest
