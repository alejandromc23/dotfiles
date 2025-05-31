# some aliases
alias sudo='sudo '
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# docker alias
alias dsa='docker stop $(docker ps -a -q)'
alias dra='docker rm $(docker ps -a -q)'

# some git aliases
alias gs='git status -sb'
alias gaa='git add -A'
alias gca="git add --all && git commit --amend --no-edit"
alias gf='git fetch --all -p'
alias gps='git push'
alias gpsf='git push --force'
alias gpl='git pull --rebase --autostash'
alias gb='git branch'
alias gco='git checkout '

# open gnome-control-center
alias gcc='gnome-control-center'
