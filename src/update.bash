#!/usr/bin/bash -e
set -o pipefail

# Upgrade everything
sudo nala upgrade --full -y
sudo flatpak update -y
sudo snap refresh
