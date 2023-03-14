#!/usr/bin/bash
# -*- coding: utf-8 -*-
set -e

# Clean up
sudo nala autoremove -y
sudo nala autopurge -y
sudo nala clean --lists
sudo rm -rf /tmp/*
