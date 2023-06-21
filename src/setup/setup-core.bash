#!/usr/bin/bash
set -e
set -o pipefail

# Core dependencies (use apt-get instead of nala)
sudo apt-get update -qq
sudo apt-get install -y --no-install-recommends \
    curl \
    gnupg \
    ca-certificates \
    sudo \
    git
