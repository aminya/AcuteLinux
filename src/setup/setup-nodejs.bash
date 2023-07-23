#!/usr/bin/bash
set -e
set -o pipefail

# Nodejs global lts
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo bash -
sudo apt install -y --no-install-recommends nodejs

# pnpm
sudo npm install -g pnpm
pnpm setup
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

PNPM_COMPLETIONS="$HOME/.local/share/bash-completion/completions/"
mkdir -p "$PNPM_COMPLETIONS"
pnpm install-completion bash >>"$PNPM_COMPLETIONS/pnpm"

source "$HOME/.bashrc"

# yarn
pnpm install -g yarn

# NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
source "$HOME/.bashrc"
