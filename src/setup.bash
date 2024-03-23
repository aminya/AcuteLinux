#!/usr/bin/bash
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

# Go
source "$DIRNAME/setup/setup-go.bash"

# Docker
source "$DIRNAME/setup/setup-docker.bash"

# Git
source "$DIRNAME/setup/setup-git.bash"

# CLI tools
source "$DIRNAME/setup/setup-cli.bash"

# Re-Upgrade
sudo nala upgrade -y

printf "\nThe setup is done\n"
