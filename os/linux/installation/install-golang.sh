#!/bin/bash

echo
echo "################################################################"
echo "  Installing Golang                                             "
echo "################################################################"
echo

if ! command -v go &> /dev/null
then
    cd ~/Downloads && wget https://golang.org/dl/go1.20.2.linux-amd64.tar.gz && sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf ~/Downloads/go1.20.2.linux-amd64.tar.gz && rm -f ~/Downloads/go1.20.2.linux-amd64.tar.gz
fi
