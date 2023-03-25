#!/bin/bash

echo
echo "################################################################"
echo "  Installing DBeaver                                            "
echo "################################################################"
echo


if ! command -v dbeaver &> /dev/null
then
    wget -O - https://dbeaver.io/debs/dbeaver.gpg.key | sudo apt-key add -
    echo "deb https://dbeaver.io/debs/dbeaver-ce /" | sudo tee /etc/apt/sources.list.d/dbeaver.list
    sudo apt-get update
    sudo apt-get install -y dbeaver-ce
fi
