#!/usr/bin/bash -e
set -o pipefail

sudo nala install -y xvkbd xdotool xbindkeys

# xbindkeys configuration
cp ./src/setup/.xbindkeysrc "$HOME/.xbindkeysrc"

killall -s1 xbindkeys
xbindkeys --poll-rc --file "$HOME/.xbindkeysrc"

# https://itnext.io/make-yourself-comfortable-keyboard-shortcuts-d3348b6d0a19
