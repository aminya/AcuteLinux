#!/usr/bin/bash
# -*- coding: utf-8 -*-
set -e
set -o pipefail

# Brew
"$PNPM_HOME/setup-cpp" \
    --brew true

source "$HOME/.cpprc"

# Brew packages
brew install \
    bat \
    lsd \
    delta \
    broot \
    fd \
    ripgrep \
    fzf \
    mcfly \
    sd \
    cheat \
    tldr \
    btop \
    curlie \
    zoxide
