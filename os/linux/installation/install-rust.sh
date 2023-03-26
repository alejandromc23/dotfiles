!/bin/bash

echo
echo "################################################################"
echo "  Installing Rust                                           "
echo "################################################################"
echo

if ! command -v rustc &> /dev/null
then
    curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh
    sudo apt-get install -y build-essential
    source $HOME/.cargo/env
fi
