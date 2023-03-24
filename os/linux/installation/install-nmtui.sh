#!/bin/bash

echo
echo "################################################################"
echo "  Installing Network Manager TUI                                "
echo "################################################################"
echo

# Install nmtui, a network manager designed for the terminal
if ! command -v nmtui &> /dev/null; then
    sudo apt-get install -y nmtui
fi
