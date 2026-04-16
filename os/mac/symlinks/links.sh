#!/bin/bash

echo
echo "################################################################"
echo "  Linking configs                                               "
echo "################################################################"
echo

DOTFILES="$HOME/.dotfiles"

# Create ~/.dotfiles symlink if missing (repo is expected at ~/projects/dotfiles or wherever cloned)
if [ ! -e "$DOTFILES" ]; then
    echo "~/.dotfiles does not exist. Create it pointing to the cloned repo, e.g.:"
    echo "  ln -s \"\$HOME/projects/dotfiles\" \"$DOTFILES\""
    exit 1
fi

mkdir -p "$HOME/.config"

link() {
    local src="$1"
    local dest="$2"
    if [ -L "$dest" ] || [ -e "$dest" ]; then
        echo "skip (exists): $dest"
        return
    fi
    ln -s "$src" "$dest"
    echo "linked: $dest -> $src"
}

# Git
link "$DOTFILES/git/.gitconfig"         "$HOME/.gitconfig"
link "$DOTFILES/git/.gitattributes"     "$HOME/.gitattributes"
link "$DOTFILES/git/.gitignore_global"  "$HOME/.gitignore_global"

# Zsh
link "$DOTFILES/shell/zsh/.zshrc"   "$HOME/.zshrc"
link "$DOTFILES/shell/zsh/.zshenv"  "$HOME/.zshenv"
link "$DOTFILES/shell/zsh/.zimrc"   "$HOME/.zimrc"

# Neovim
link "$DOTFILES/.config/nvim" "$HOME/.config/nvim"

# Yabai / skhd
link "$DOTFILES/os/mac/.yabairc" "$HOME/.yabairc"
link "$DOTFILES/os/mac/.skhdrc"  "$HOME/.skhdrc"
