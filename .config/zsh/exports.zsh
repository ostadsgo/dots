# General
export HOME=~
export EDITOR="nvim"
export BROWSER="chrome"
export TERMINAL="kitty"

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CASHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

export ZDOTDIR=$HOME/.config/zsh
export ZDIR=$XDG_DATA_HOME/zsh
export STARSHIP_CONFIG=$ZDOTDIR/starship.toml

export GOPATH=$XDG_DATA_HOME/go

export FZF_DEFAULT_OPTS='
--color="fg:#b2b2b2,bg:#080808,bg+:#323437,hl:#ff5454,gutter:#080808"
--color="query:#e4e4e4,prompt:#b2b2b2,pointer:#ff5454,marker:#ff5454"
--color="hl+:#ff5454"
'

# Extend path
path+=$HOME/.local/bin
path+=$HOME/.local/bin/scripts
path+=$HOME/.cargo/bin
fpath+=$ZDOTDIR/plugins/zsh-completions/src

