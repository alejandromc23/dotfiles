#!/bin/bash

echo
echo "################################################################"
echo "  Installing Nerd Fonts  (it might take a while)                "
echo "################################################################"
echo


if ! fc-list : family | grep -i nerd >/dev/null; then
    # Install Nerd Fonts
    echo "Nerd Fonts are not installed"
    echo "Installing Nerd Fonts..."
    sudo apt-get install fonts-noto-color-emoji
    cd ~/Downloads
    git clone https://github.com/ryanoasis/nerd-fonts.git
    cd nerd-fonts
    ./install.sh
    cd ..
    rm -rf nerd-fonts
fi
