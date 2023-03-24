#!/bin/bash

echo
echo "################################################################"
echo "  Installing Z Shell + Zim                            "
echo "################################################################"
echo

if ! location=$(type -p "zsh"); then
    sudo apt install -y zsh
    chsh -s $(which zsh)
fi

if [ ! -d "${ZDOTDIR:-$HOME}/.zim" ]; then
    curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
fi
