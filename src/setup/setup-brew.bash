#!/usr/bin/bash -e
set -o pipefail

# Brew
"$PNPM_HOME/setup-cpp" \
    --brew true
