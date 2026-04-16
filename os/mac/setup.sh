#!/bin/bash

set -e

cd "$(dirname "$0")"

echo
echo "################################################################"
echo "  Setup macOS Workstation                                       "
echo "################################################################"
echo

# Xcode Command Line Tools (required by Homebrew)
if ! xcode-select -p >/dev/null 2>&1; then
    echo "Installing Xcode Command Line Tools..."
    xcode-select --install || true
    echo "Finish the Xcode CLT install in the dialog, then re-run this script."
    exit 0
fi

./installation/install-homebrew.sh

# Make brew available in this shell (Apple Silicon path)
if [ -x /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

./installation/install-brew-bundle.sh
./installation/install-zim.sh
./symlinks/links.sh
./installation/install-claude-code.sh
./installation/install-ssh-key.sh

echo
echo "################################################################"
echo "  Done. See os/mac/POST_INSTALL.md for remaining manual steps.  "
echo "################################################################"
