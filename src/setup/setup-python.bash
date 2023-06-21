#!/usr/bin/bash
set -e
set -o pipefail

# Python Deps
sudo nala install -y \
    python3-venv \
    python3-pip \
    python3-cachecontrol \
    python3-poetry
python3 -m pip install -U \
    pylint \
    perflint
