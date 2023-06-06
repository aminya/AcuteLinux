#!/usr/bin/bash
# -*- coding: utf-8 -*-
set -e

DIRNAME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source "$HOME/.cpprc"

# VsCode
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
rm -f packages.microsoft.gpg

sudo nala update
sudo nala install -y \
    apt-transport-https \
    gnome-keyring \
    code \
    code-insiders

# Flatpak for KDE
sudo nala install -y --no-install-recommends flatpak plasma-discover-backend-flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# GitHub Desktop
wget -qO - https://apt.packages.shiftkey.dev/gpg.key | gpg --dearmor | sudo tee /usr/share/keyrings/shiftkey-packages.gpg > /dev/null
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/shiftkey-packages.gpg] https://apt.packages.shiftkey.dev/ubuntu/ any main" > /etc/apt/sources.list.d/shiftkey-packages.list'

sudo nala update
sudo nala install -y github-desktop

# Flatpaks
flatpak -y install flathub \
    com.microsoft.Edge \
    md.obsidian.Obsidian \
    com.github.eneshecan.WhatsAppForLinux \
    com.github.tchx84.Flatseal \
    org.telegram.desktop \
    com.slack.Slack \
    us.zoom.Zoom \
    com.discordapp.Discord \
    com.spotify.Client \
    org.kde.kclock

# LibreOffice
sudo nala purge libreoffice*
flatpak -y install org.libreoffice.LibreOffice

# Snaps (when the flatpak is not available/working)
sudo nala purge thunderbird*
sudo snap install bluemail

# Kate for git
sudo nala install -y --no-install-recommends hspell
git config --global core.editor "kate -b"

# Speach
source "$DIRNAME/setup/setup-speach.bash"

# GitHub
brew install gh
# authenticate GitHub
gh auth login
# configure Git with GitHub desktop
