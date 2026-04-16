export PATH="$HOME/.local/bin:$PATH"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PATH:$PNPM_HOME"

# Go path to bin executables
# export GOPATH="$HOME/go"
#export GOBIN="$GOPATH/bin"
#export PATH="$PATH:/usr/local/go/bin:$GOBIN"

# Node version manager
export NVM_DIR="$HOME/.nvm"
if [ -s "/opt/homebrew/opt/nvm/nvm.sh" ]; then
  . "/opt/homebrew/opt/nvm/nvm.sh"
  . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
elif [ -s "$NVM_DIR/nvm.sh" ]; then
  . "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
fi

# Add homebrew to path
if [ -d "/opt/homebrew/bin" ]; then
  export PATH="$PATH:/opt/homebrew/bin"
elif [ -d "/home/linuxbrew/.linuxbrew/bin" ]; then
  export PATH="$PATH:/home/linuxbrew/.linuxbrew/bin"
fi
