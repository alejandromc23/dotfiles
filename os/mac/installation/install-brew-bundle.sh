#!/bin/bash

echo
echo "################################################################"
echo "  Installing Brew formulas and casks (Brewfile)                 "
echo "################################################################"
echo

brew update
brew bundle --file="$(dirname "$0")/../Brewfile"
