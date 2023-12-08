# General
export HOME=~
export EDITOR="nvim"
export BROWSER="chrome"
export TERMINAL="kitty"

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CASHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

export ZDOTDIR=$HOME/.config/zsh
export STARSHIP_CONFIG=$ZDOTDIR/prompts/starship.toml

export GOPATH=$XDG_DATA_HOME/go

# Extend path
path+=$HOME/.local/bin
path+=$HOME/.local/bin/scripts
path+=$HOME/.cargo/bin
fpath+=$ZDOTDIR/plugins/zsh-completions/src
