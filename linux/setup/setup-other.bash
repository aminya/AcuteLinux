#!/usr/bin/bash
# -*- coding: utf-8 -*-
set -e
set -o pipefail

# Dev dependencies
sudo nala install -y --no-install-recommends \
    pkg-config \
    libssl-dev \
    git
