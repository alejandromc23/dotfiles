#!/bin/bash

echo
echo "################################################################"
echo "  Installing Playerctl for Spotify and other media players      "
echo "################################################################"
echo


if ! command -v playerctl &> /dev/null
then
    sudo apt-get install playerctl
fi
