# General
export HOME=~
export EDITOR="nvim"
export BROWSER="chrome"
export TERMINAL="alacritty"

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
export FZF_ALT_C_COMMAND='fd --hidden --type d\
    --exclude ".git" \
    --exclude "*.pyc" \
    --exclude node_modlues \
    --exclude .npm \
    --exclude .dotnet \
    --exclude .cargo \
    '
export FZF_DEFAULT_OPTS='
--height 40% --reverse --border=rounded
--no-hscroll --prompt=":: "  --multi
--info=hidden --pointer="*"
--color="fg:#E1E1E1,bg:#151515,bg+:#373737,hl:#FFA557,gutter:#151515"
--color="query:#E1E1E1,prompt:#E1E1E1,pointer:#FFA557,marker:#BAD7FF"
--color="hl+:#FFA557"
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

