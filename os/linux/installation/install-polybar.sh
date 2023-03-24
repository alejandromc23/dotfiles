#!/bin/bash

echo
echo "################################################################"
echo "  Installing Polybar                                           "
echo "################################################################"
echo


if ! command -v polybar &> /dev/null
then
    # Check Ubuntu version
    if lsb_release -r | grep -q '^[0-9][0-9]\.[0-9][0-9]$' && lsb_release -r | grep -q '^[0-9]\.[0-9][0-9]$'
    then
        # Ubuntu version is less than 22.04, add Troutcobbler PPA and install Polybar
        sudo add-apt-repository ppa:kgilmer/speed-ricer
    fi
    sudo apt update
    sudo apt install polybar
fi
