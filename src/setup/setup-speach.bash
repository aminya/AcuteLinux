#!/usr/bin/bash
set -e

# Text to speach
sudo nala install -y \
    speech-dispatcher \
    festival \
    speech-dispatcher-festival \
    festvox-{rablpc16k,kallpc16k,kdlpc16k} \
    sox

# Enable festival
sudo sed -i 's/#AddModule "festival"                 "sd_festival"  "festival.conf"/AddModule "festival"                 "sd_festival"  "festival.conf"/g' \
    /etc/speech-dispatcher/speechd.conf

sudo sed -i 's/#DefaultModule festival/DefaultModule festival/g' \
 /etc/speech-dispatcher/speechd.conf

# Run festival during startup
crontab -l | { cat; echo "@reboot festival --server"; } | sudo crontab -
