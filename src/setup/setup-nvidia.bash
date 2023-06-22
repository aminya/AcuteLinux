#!/usr/bin/bash
# -*- coding: utf-8 -*-
set -e
set -o pipefail

sudo add-apt-repository ppa:graphics-drivers/ppa

sudo apt update
sudo apt install -y nvidia-driver-535

# select nvidia
sudo prime-select nvidia

# set high performance profile
sudo nvidia-smi -pm 1

echo "Please reboot your system and enroll the MOK key, then reboot again."
