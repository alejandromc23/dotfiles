#!/bin/bash

# Fail immediately if any errors occur
set -e

echo
echo "################################################################"
echo "  Setup Workstation                                             "
echo "################################################################"
echo

echo "Caching [sudo] password..."
sudo -K
sudo true;

echo
echo "################################################################"
echo "  Updating the system                                           "
echo "################################################################"
echo

# Upgrade
sudo apt update
sudo apt full-upgrade -y

echo
echo "################################################################"
echo "  Installing requirements for repositories                      "
echo "################################################################"
echo

# Software installation
./installation/uninstall-applications-by-default.sh
./installation/install-curl.sh
./installation/install-htop.sh
./installation/install-docker.sh
./installation/install-google-chrome.sh
./installation/install-git.sh
./installation/install-slack.sh
./installation/install-k9s.sh
./installation/install-kubectl.sh
./installation/install-helm.sh
./installation/install-fzf.sh
./installation/install-zsh.sh
./installation/install-dbeaver.sh
./installation/install-insomnia.sh
./installation/install-nerdfonts.sh
./installation/install-neovim.sh
./installation/install-npm.sh
./installation/install-nodejs.sh
./installation/install-nvm.sh
./installation/install-tldr.sh
./installation/install-golang.sh
./installation/install-spotify.sh
./installation/install-terminator.sh
./installation/install-i3.sh
./installation/install-feh.sh
./installation/install-compton.sh
./installation/install-polybar.sh
./installation/install-playerctl.sh
./installation/install-nmtui.sh
./installation/install-rust.sh

echo
echo "################################################################"
echo "  Updating the system                                           "
echo "################################################################"
echo

# Upgrade
sudo apt update
sudo apt --fix-broken install
sudo apt upgrade -y
sudo apt autoremove -y


# Link all configs
./symlinks/links.sh
