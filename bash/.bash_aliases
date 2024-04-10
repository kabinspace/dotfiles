#!/bin/sh

# aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias la='ls -A'
alias chmox='chmod +x'

# apps
alias nv='nvim'
alias nf='neofetch'
alias ht='htop'
alias bt='btm'
alias lg='lazygit'
alias xo='xdg-open'
alias calc='calcurse'

# git
alias ga="git add"
alias gcl="git clone"
alias gcm="git commit -m"
alias gma='git commit -am'
alias gst="git status"
alias glg="git log"
alias gpush="git push"
alias gpull="git pull"
alias gf='git reflog'
alias gta='git tag -a -m'
alias gdf='git diff'
alias gbr='git branch'
alias gch='git checkout'
alias gra='git remote add'
alias grr='git remote rm'
alias gsw='git switch'

# cd
alias ..='cd ..'
alias ....='cd ../..'
alias ......='cd ../../..'
alias ........='cd ../../../..'

# isolated nvim config
alias astronvim="NVIM_APPNAME=astronvim nvim"

# Suffix alias for filetypes
command_not_found_handle() {
  case $1 in
  *.py | *.md | *.lua | *.js | *.html | *.css | *.c | *.cpp)
    nvim "${1}"
    ;;
  *)
    echo "bash: ${1}: command not found"
    ;;
  esac
}
