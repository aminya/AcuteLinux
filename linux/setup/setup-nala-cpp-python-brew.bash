#!/usr/bin/bash
# -*- coding: utf-8 -*-
set -e
set -o pipefail

pnpm install -g setup-cpp

# Nala
sudo "$PNPM_HOME/setup-cpp" --nala true

# Upgrade
sudo nala upgrade -y

# C++, Python
sudo "$PNPM_HOME/setup-cpp" --compiler llvm --cmake true --ninja true --cppcheck true --ccache true --vcpkg true --doxygen true --gcovr true --task true --python true --make true --bazel true
sudo chmod a+w "$HOME/.cpprc"

# Brew
"$PNPM_HOME/setup-cpp" --brew true --sccache true

source "$HOME/.cpprc"
