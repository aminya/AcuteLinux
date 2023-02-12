#!/usr/bin/bash -e
# -*- coding: utf-8 -*-
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
    zoxide \
    starship

# Set up delta

# add the following string if ~/.gitconfig does not have '# Add delta to git'
if ! grep -q '# Add delta to git' ~/.gitconfig; then
    echo '
# Add delta to git
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
fi

# Set up mcfly
if ! grep -q '# Add mcfly to git' ~/.bashrc; then
    echo '
# Add mcfly to bash
eval "$(mcfly init bash)"' >>~/.bashrc

fi

# Set up broot
if ! grep -q "source $HOME/.config/broot/launcher/bash/br" ~/.bashrc; then
    broot --install
fi

# Set up starship
if ! grep -q "# Add starship to bash" ~/.bashrc; then
    echo '
# Add starship to bash
eval "$(starship init bash)"' >>~/.bashrc

starship preset pastel-powerline > ~/.config/starship.toml
fi

# Nerd fonts
PWD=$(pwd)
FONT_NAME="FiraCode"
curl -LJO "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/$FONT_NAME.zip"
mkdir -p $HOME/.local/share/fonts
mv "$FONT_NAME.zip" $HOME/.local/share/fonts/
cd $HOME/.local/share/fonts/
unzip "$FONT_NAME.zip"
rm "$FONT_NAME.zip"
fc-cache -fv
cd $PWD
