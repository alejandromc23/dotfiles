#!/bin/bash

echo
echo "################################################################"
echo "  Installing Google Cloud CLI                                   "
echo "################################################################"
echo

if ! command -v gcloud &> /dev/null
then
    sudo apt-get install apt-transport-https ca-certificates gnupg curl

    echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -

    sudo apt-get install google-cloud-cli
fi
