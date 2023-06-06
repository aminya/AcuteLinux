#!/usr/bin/bash
# -*- coding: utf-8 -*-
set -e
set -o pipefail

sudo nala remove docker.io docker-doc docker-compose podman-docker containerd runc

# PPa
sudo nala install -y ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install
sudo nala update
sudo nala install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# User
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
chmod 777 /var/run/docker.sock

# Startup
sudo systemctl enable docker.service
sudo systemctl enable containerd.service