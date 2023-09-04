#!/usr/bin/bash -e
set -o pipefail

DIRNAME="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

source "$HOME/.cpprc"

# Edge
source "$DIRNAME/setup/setup-edge.bash"

# VSCode
source "$DIRNAME/setup/setup-vcscode.bash"

# Flatpak
source "$DIRNAME/setup/setup-flatpak.bash"

# GitHub Desktop
source "$DIRNAME/setup/setup-git.bash"

# Speach
source "$DIRNAME/setup/setup-speach.bash"

# Git
DESKTOP=1 source "$DIRNAME/setup/setup-git.bash"
