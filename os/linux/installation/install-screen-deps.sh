#!/bin/bash

echo
echo "################################################################"
echo "  Installing Screenshoot deps                                   "
echo "################################################################"
echo


# Check if maim is installed
if ! command -v maim &> /dev/null; then
    sudo apt-get install maim
fi

# Check if xclip is installed
if ! command -v xclip &> /dev/null; then
    sudo apt-get install xclip
fi

# Check if copyq is installed
if ! command -v copyq &> /dev/null; then
    sudo apt-get install copyq
fi
