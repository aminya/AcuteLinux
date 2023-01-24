#!/usr/bin/bash
# -*- coding: utf-8 -*-
set -e
set -o pipefail

# Brew
"$PNPM_HOME/setup-cpp" --brew true --sccache true

source "$HOME/.cpprc"
