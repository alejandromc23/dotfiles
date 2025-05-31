#!/bin/bash

echo
echo "################################################################"
echo "  Installing NeoVim                            "
echo "################################################################"
echo

if ! [ -x "$(command -v nvim)" ]; then
    mkdir -p ~/.local/bin
    curl -Lo ~/.local/bin/nvim.appimage https://github.com/neovim/neovim/releases/download/v0.10.2/nvim.appimage
    chmod u+x ~/.local/bin/nvim.appimage
    ln -s ~/.local/bin/nvim.appimage ~/.local/bin/nvim
    
    #install required deb not installed in ubuntu 22
    if ! dpkg -s libfuse2 &> /dev/null ; then
        sudo apt-get update
        sudo apt-get install libfuse2
    fi
fi
