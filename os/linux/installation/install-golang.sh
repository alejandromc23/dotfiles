#!/bin/bash

echo
echo "################################################################"
echo "  Installing Golang                                             "
echo "################################################################"
echo


if ! command -v go &> /dev/null
then
    wget https://golang.org/dl/go1.20.2.linux-amd64.tar.gz &&
     rm -rf /usr/local/go && tar -C /usr/local -xzf go1.20.2.linux-amd64.tar.gz
fi
