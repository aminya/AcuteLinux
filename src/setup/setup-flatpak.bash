#!/usr/bin/bash -e
set -o pipefail

# Flatpak for KDE
sudo nala install -y --no-install-recommends flatpak plasma-discover-backend-flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Flatpaks
flatpak -y install flathub \
    com.microsoft.Edge \
    org.mozilla.Thunderbird \
    com.github.eneshecan.WhatsAppForLinux \
    org.telegram.desktop \
    com.slack.Slack \
    us.zoom.Zoom \
    com.github.tchx84.Flatseal \
    com.discordapp.Discord \
    com.spotify.Client \
    md.obsidian.Obsidian \
    org.kde.kclock \
    org.libreoffice.LibreOffice

# Use flatpak instead of apt
sudo nala purge libreoffice* thunderbird*

# Snaps (when the flatpak is not available/working)
sudo snap install bluemail
