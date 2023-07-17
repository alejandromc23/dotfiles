export PATH="$HOME/.local/bin:$PATH"

# pnpm 
export PNPM_HOME="/home/alejandro/.local/share/pnpm"
export PATH="$PATH:$PNPM_HOME"
# pnpm end

# Go path to bin executables
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export PATH="$PATH:/usr/local/go/bin:$GOBIN"

# Node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

