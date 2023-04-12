#!/bin/bash

echo
echo "################################################################"
echo "  Installing light                                               "
echo "################################################################"
echo

if ! dpkg-query -W -f='${Status}' light 2>/dev/null | grep -q "ok installed"; then
    sudo apt-get update
    sudo apt-get install -y light
    sudo chmod +s /usr/bin/light
fi
