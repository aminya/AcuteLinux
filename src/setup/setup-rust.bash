#!/usr/bin/bash
# -*- coding: utf-8 -*-
set -e
set -o pipefail

export RUSTUP_HOME="$HOME/.rustup"
export CARGO_HOME="$HOME/.cargo"
export PATH="$CARGO_HOME/bin:$PATH"

rust_arch='x86_64-unknown-linux-gnu'
curl -LJO "https://static.rust-lang.org/rustup/dist/${rust_arch}/rustup-init"

chmod +x rustup-init
./rustup-init -y --no-modify-path --default-toolchain none
source "$CARGO_HOME/env"
sudo chmod -R a+w "$RUSTUP_HOME" "$CARGO_HOME"

echo "# Rust
export RUSTUP_HOME=\"$RUSTUP_HOME\"
export CARGO_HOME=\"$CARGO_HOME\"
export PATH=\"$CARGO_HOME/bin:\$PATH\"
source \"$CARGO_HOME/env\"
" >>"$HOME/.bashrc"

rust_toolchain_version="nightly-2023-03-17"
rustup install $rust_toolchain_version
rustup component add "rustfmt" "clippy" "rust-src" "rustc" "rustc-dev" "llvm-tools-preview"

# sccache
"$PNPM_HOME/setup-cpp" --sccache true

echo "
[build]
rustc-wrapper = \"sccache\"
" >"$CARGO_HOME/config"
