#!/bin/bash

echo
echo "################################################################"
echo "  Installing tldr                                               "
echo "################################################################"
echo

# it will fail if npm is not installed
if ! command -v tldr &> /dev/null
then
    npm install -g tldr
fi
