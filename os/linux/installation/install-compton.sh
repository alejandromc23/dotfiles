#!/bin/bash

echo
echo "################################################################"
echo "  Installing Compton                                               "
echo "################################################################"
echo

# This will install compton, the compositor for i3
if ! command -v compton >/dev/null 2>&1; then
    sudo apt-get install -y compton
fi

