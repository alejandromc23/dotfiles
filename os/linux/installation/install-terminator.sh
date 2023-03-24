#!/bin/bash

echo
echo "################################################################"
echo "  Installing Terminator                                         "
echo "################################################################"
echo


if ! command -v terminator &> /dev/null
then
    sudo apt install -y terminator
fi
