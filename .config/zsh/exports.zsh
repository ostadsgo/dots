
export HOME="/home/saeid"
export EDITOR="nvim"
export BROWSER="firefox"
export TERMINAL="kitty"

export XDG_CONFIG_HOEM=$HOME/.config
export XDG_CASHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export ZDOTDIR=$HOME/.config/zsh

# Extend path
typeset -U path PATH
path=(~/.local/bin $path)
path=(~/.local/bin/scripts $path)
export PATH
