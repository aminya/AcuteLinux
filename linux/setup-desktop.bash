#!/usr/bin/bash
# -*- coding: utf-8 -*-
set -e

source "$HOME/.cpprc"

# VsCode
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
rm -f packages.microsoft.gpg

sudo nala update
sudo nala install -y --no-install-recommends \
    apt-transport-https \
    gnome-keyring \
    code

# Flatpak for KDE
sudo nala install -y --no-install-recommends flatpak plasma-discover-backend-flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Flatpaks
flatpak -y install flathub \
    com.microsoft.Edge \
    io.github.shiftey.Desktop \
    md.obsidian.Obsidian \
    com.github.eneshecan.WhatsAppForLinux \
    com.github.tchx84.Flatseal \
    org.telegram.desktop \
    com.slack.Slack \
    us.zoom.Zoom \
    com.discordapp.Discord \
    com.spotify.Client \
    org.kde.kclock

# Snaps (when the flatpak is not available/working)
sudo snap install bluemail

# GitHub
brew install gh
# authenticate GitHub
gh auth login
# configure Git with GitHub desktop
flatpak run io.github.shiftey.Desktop
