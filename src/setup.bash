#!/usr/bin/bash
# -*- coding: utf-8 -*-
set -e
set -o pipefail

DIRNAME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Core
source "$DIRNAME/setup/setup-core.bash"

# Nodejs, NPM, PNPM
source "$DIRNAME/setup/setup-nodejs.bash"

# Nala, C++, Python
source "$DIRNAME/setup/setup-nala-cpp-python.bash"

# Brew
source "$DIRNAME/setup/setup-brew.bash"

# Rust
source "$DIRNAME/setup/setup-rust.bash"

# Other
source "$DIRNAME/setup/setup-other.bash"

# Python Deps
source "$DIRNAME/setup/setup-python.bash"

# Docker
source "$DIRNAME/setup/setup-docker.bash"

# Re-Upgrade
sudo nala upgrade -y

printf "\nThe setup is done\n"
