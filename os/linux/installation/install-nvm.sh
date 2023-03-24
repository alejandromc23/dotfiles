#!/bin/bash

echo
echo "################################################################"
echo "  Installing NVM                                                "
echo "################################################################"
echo

if [ ! -d "$HOME/.nvm" ]
then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
fi
