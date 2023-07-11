#!/usr/bin/bash -e
set -o pipefail

# Git
sudo nala install -y git git-lfs

# GitHub Desktop
if [[ "$DESKTOP" -eq 1 ]]; then
    wget -qO - https://apt.packages.shiftkey.dev/gpg.key | gpg --dearmor | sudo tee /usr/share/keyrings/shiftkey-packages.gpg >/dev/null
    sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/shiftkey-packages.gpg] https://apt.packages.shiftkey.dev/ubuntu/ any main" > /etc/apt/sources.list.d/shiftkey-packages.list'
fi

sudo nala update
sudo nala install -y github-desktop

# Kate for git
if [[ "$DESKTOP" -eq 1 ]]; then
    sudo nala install -y --no-install-recommends hspell
    git config --global core.editor "kate -b"
fi

# GitHub
brew install gh

# Gitlab
brew install glab

# Authenticate GitHub
if [[ "$DESKTOP" -eq 1 ]]; then
    gh auth login
fi

# Authenticate GitLab
if [[ "$DESKTOP" -eq 1 ]]; then
    glab auth login
fi
