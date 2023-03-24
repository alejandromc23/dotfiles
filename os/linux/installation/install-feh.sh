#!/bin/bash

echo
echo "################################################################"
echo "  Installing feh                                               "
echo "################################################################"
echo

# Install feh, the wallpaper manager we use in i3
if ! command -v feh &> /dev/null
then
    sudo apt-get install -y feh
fi
