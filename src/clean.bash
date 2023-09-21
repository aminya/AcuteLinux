#!/usr/bin/bash
set -e

# Clean up
sudo nala autoremove -y
sudo nala autopurge -y
sudo nala clean --lists
sudo rm -rf /tmp/*

docker system prune -f
docker system prune -f --volumes

# remove all dangling images
docker image prune -f

# remove all none tagged
non_tagged=$(docker images -a | grep none | awk '{ print $3; }')
if [ ! -z "$non_tagged" ]; then
    docker rmi $non_tagged
fi

# find the docker images that have the same repository but different tags and remove the older ones
docker images -a --format '{{.Repository}}:{{.Tag}}' | awk -F: '{ print $1; }' | uniq -d | xargs -I {name} docker images --format '{{.ID}} {{.CreatedSince}}' {name} | head -n -1 | awk '{ print $1; }' | xargs -I {id} docker rmi {id}
