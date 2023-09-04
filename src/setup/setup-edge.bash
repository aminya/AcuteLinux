#!/usr/bin/bash -e

source "$HOME/.cpprc"

# VsCode
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/edge stable main" | sudo tee /etc/apt/sources.list.d/microsoft-edge.list
rm -f packages.microsoft.gpg

sudo nala update
sudo nala install -y \
    microsoft-edge-beta

CHROME_EXECUTABLE="$(which microsoft-edge-beta)"
if [ -n "$CHROME_EXECUTABLE" ]; then
    echo "export CHROME_EXECUTABLE=\"$CHROME_EXECUTABLE\"" >>"$HOME/.bashrc"
fi

source "$HOME/.bashrc"
