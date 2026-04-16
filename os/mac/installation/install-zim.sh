#!/bin/bash

echo
echo "################################################################"
echo "  Installing Zim (zsh framework)                                "
echo "################################################################"
echo

# Change default shell to the brew-installed zsh if not already
BREW_ZSH="/opt/homebrew/bin/zsh"
if [ -x "$BREW_ZSH" ] && [ "$SHELL" != "$BREW_ZSH" ]; then
    if ! grep -q "$BREW_ZSH" /etc/shells; then
        echo "$BREW_ZSH" | sudo tee -a /etc/shells >/dev/null
    fi
    chsh -s "$BREW_ZSH"
fi

if [ ! -d "${ZDOTDIR:-$HOME}/.zim" ]; then
    curl -fsSL --create-dirs -o "${ZDOTDIR:-$HOME}/.zim/zimfw.zsh" \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
fi
