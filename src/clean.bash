#!/usr/bin/bash
set -e

# Clean up
sudo nala autoremove -y
sudo nala autopurge -y
sudo nala clean --lists
sudo rm -rf /tmp/*

docker system prune -f
docker system prune -f --volumes
docker image prune -f
exited_images=$(docker ps --filter status=exited -q)
if [ ! -z "$exited_images" ]; then
    docker rm $exited_images
fi
docker images -a | grep none | awk '{ print $3; }' | xargs docker rmi --force
