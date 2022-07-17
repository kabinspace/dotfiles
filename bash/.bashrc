#~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Disable background highlighting on directories
export LS_COLORS="$LS_COLORS:ow=1;34:tw=1;34:"

# Starship shell
eval "$(starship init bash)"

# Created by pipx
export PATH="$PATH:/home/space/.local/bin"

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] &&
  . /usr/share/bash-completion/bash_completion

# Add bash aliases
if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi
