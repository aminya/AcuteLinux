#!/usr/bin/bash
# -*- coding: utf-8 -*-
set -e

# Flatpak for KDE
sudo nala install -y --no-install-recommends flatpak plasma-discover-backend-flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# GitHub
source "$HOME/.cpprc"
brew install gh
gh auth login
