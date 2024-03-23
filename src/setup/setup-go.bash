#!/usr/bin/bash -e
set -o pipefail

brew install goenv

goenv install 1.22.0
goenv global 1.22.0

echo 'eval "$(goenv init -)"' >> ~/.bashrc
