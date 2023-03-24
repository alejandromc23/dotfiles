#!/bin/bash

echo
echo "################################################################"
echo "  Installing NodeJS                                               "
echo "################################################################"
echo


if ! command -v node &> /dev/null
then
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash - &&\
        sudo apt-get install -y nodejs
fi
