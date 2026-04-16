#!/bin/bash

echo
echo "################################################################"
echo "  Generating SSH key for GitHub                                 "
echo "################################################################"
echo

KEY_PATH="$HOME/.ssh/id_ed25519"
EMAIL="${GIT_EMAIL:-$(git config --global user.email 2>/dev/null)}"
if [ -z "$EMAIL" ]; then
    echo "No email found. Set it with 'git config --global user.email ...' or export GIT_EMAIL." >&2
    exit 1
fi

mkdir -p "$HOME/.ssh"
chmod 700 "$HOME/.ssh"

if [ ! -f "$KEY_PATH" ]; then
    ssh-keygen -t ed25519 -C "$EMAIL" -f "$KEY_PATH" -N ""
fi

# Ensure ~/.ssh/config has the GitHub entry using macOS keychain
if ! grep -q "Host github.com" "$HOME/.ssh/config" 2>/dev/null; then
    cat >> "$HOME/.ssh/config" <<'EOF'
Host github.com
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519
EOF
    chmod 600 "$HOME/.ssh/config"
fi

# Add to ssh-agent / macOS keychain
eval "$(ssh-agent -s)" >/dev/null
ssh-add --apple-use-keychain "$KEY_PATH" 2>/dev/null || ssh-add "$KEY_PATH"

echo
echo "Public key (add it at https://github.com/settings/keys):"
echo "----------------------------------------------------------------"
cat "${KEY_PATH}.pub"
echo "----------------------------------------------------------------"

# Copy to clipboard for convenience
if command -v pbcopy >/dev/null 2>&1; then
    pbcopy < "${KEY_PATH}.pub"
    echo "(public key copied to clipboard)"
fi
