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
    git-delta \
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

# Setup delta
echo '
[core]
    pager = delta

[interactive]
    diffFilter = delta --color-only

[delta]
    navigate = true
    light = false
    line-numbers = true

[merge]
    conflictstyle = diff3

[diff]
    colorMoved = default
' >>~/.gitconfig
