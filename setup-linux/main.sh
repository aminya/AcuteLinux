#!/usr/bin/env bash
# -*- coding: utf-8 -*-

# Basics
sudo apt update -qq
sudo apt install -y --no-install-recommends curl gnupg ca-certificates sudo

# Nodejs
curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
sudo apt install -y --no-install-recommends nodejs
sudo npm install -g pnpm

# setup-cpp https://github.com/aminya/setup-cpp
setup_cpp_version="v0.24.1"
curl -LJO "https://github.com/aminya/setup-cpp/releases/download/${setup_cpp_version}/setup_cpp.js"

# Nala
sudo node ./setup_cpp.js --nala true

# C++, Python, Brew
sudo node ./setup_cpp.js --compiler llvm --cmake true --ninja true --cppcheck true --ccache true --vcpkg true --doxygen true --gcovr true --task true --sccache true --python true --brew true --make true --bazel true

# Rust
export RUSTUP_HOME=/usr/local/rustup
export CARGO_HOME=/usr/local/cargo
export PATH=/usr/local/cargo/bin:$PATH

rust_arch='x86_64-unknown-linux-gnu'
curl -LJO "https://static.rust-lang.org/rustup/dist/${rust_arch}/rustup-init"

chmod +x rustup-init
./rustup-init -y --no-modify-path --default-toolchain none
chmod -R a+w $RUSTUP_HOME $CARGO_HOME

rust_toolchain_version="nightly-2022-10-17"
rustup install $rust_toolchain_version
rustup component add "rustfmt" "clippy" "rust-src" "rustc" "rustc-dev" "llvm-tools-preview"

# Dev dependencies
sudo nala install -y --no-install-recommends pkg-config libssl-dev git

# Python Deps
sudo nala install -y python3-venv python3-pip python3-cachecontrol python3-poetry
python3 -m pip install pylint mypy perflint -U

# Upgrade
sudo nala upgrade -y

# Clean up
sudo nala autoremove
sudo nala autopurge
sudo nala clean --lists
sudo rm -rf /tmp/*
