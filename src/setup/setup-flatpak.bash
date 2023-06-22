#!/usr/bin/bash -e
set -o pipefail

# Flatpak for KDE
sudo nala install -y --no-install-recommends flatpak plasma-discover-backend-flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

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
