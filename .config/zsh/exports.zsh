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

export FZF_DEFAULT_COMMAND='fd --hidden \
    --exclude ".git" \
    --exclude "*.pyc" \
    --exclude node_modlues \
    --exclude .npm \
    --exclude .dotnet \
    --exclude .cargo \
    '
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='
--height 40% --reverse --border=rounded
--no-hscroll --prompt=":: "  --multi
--info=hidden --pointer="*"
--color="fg:#b2b2b2,bg:#080808,bg+:#323437,hl:#ff5454,gutter:#080808"
--color="query:#e4e4e4,prompt:#b2b2b2,pointer:#ff5454,marker:#ff5454"
--color="hl+:#ff5454"
--bind="?:toggle-preview"
--bind="ctrl-u:preview-page-up"
--bind="ctrl-d:preview-page-down"
--preview-window "right:50%:hidden:wrap"
--preview "([[ -d {} ]] && tree -C {}) || ([[ -f {} ]] && bat -pn --color=always {}) || echo {}"
'
# Extend path
path+=$HOME/.local/bin
path+=$HOME/.local/bin/scripts
path+=$HOME/.cargo/bin
fpath+=$ZDOTDIR/plugins/zsh-completions/src

