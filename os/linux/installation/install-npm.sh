#!/bin/bash

echo
echo "################################################################"
echo "  Installing NPM                                                "
echo "################################################################"
echo

if ! command -v npm &> /dev/null
then
    sudo apt install -y npm
fi
