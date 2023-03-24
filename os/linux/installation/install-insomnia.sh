#!/bin/bash

echo
echo "################################################################"
echo "  Installing Insomnia                                           "
echo "################################################################"
echo

if ! location=$(type -p "insomnia"); then
    if [ ! -f /etc/apt/sources.list.d/insomnia.list ]; then
        echo "deb [trusted=yes arch=amd64] https://download.konghq.com/insomnia-ubuntu/ default all" | sudo tee /etc/apt/sources.list.d/insomnia.list
    fi

    sudo apt-get update
    sudo apt-get install insomnia
fi
