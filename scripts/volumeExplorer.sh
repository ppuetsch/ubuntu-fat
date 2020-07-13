#!/bin/bash
docker run -ti --name ubuntu-fat-volume-explorer -v ubuntu-root:/root -v /var/run/docker.sock:/var/run/docker.sock $(docker volume list | awk '{printf "%s", " -v"$2":/docker-volumes/"$2}') ppuetsch/ubuntu-fat:latest
