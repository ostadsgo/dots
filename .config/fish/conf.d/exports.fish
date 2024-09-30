
## --------------
##    Exports
## --------------
set -x HOME ~
set -x EDITOR "nvim"
set -x BROWSER "brave"
set -x TERMINAL "alacritty"
set -x TERM "xterm-256color"
set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_CASHE_HOME $HOME/.cache
set -x XDG_DATA_HOME $HOME/.local/share
set -x GOPATH $XDG_DATA_HOME/go

### FZF
set -x FZF_COMPLETION_TRIGGER "**"
set -x FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
set -x FZF_ALT_C_COMMAND 'fd --hidden --type d\
    --exclude ".git" \
    --exclude "*.pyc" \
    --exclude node_modlues \
    --exclude .npm \
    --exclude .dotnet \
    --exclude .cargo \
    '
set -x FZF_DEFAULT_OPTS '
--height 40%  --reverse --border=rounded
--no-hscroll --prompt=":: "  --multi
--info=hidden --pointer="*"
--color="fg:#d6d6d6,bg:#100f0f,bg+:#373737,hl:#FFA557,gutter:#100f0f"
--color="query:#d6d6d6,prompt:#d6d6d6,pointer:#FFA557,marker:#BAD7FF"
--color="hl+:#FFA557"
--bind="?:toggle-preview"
--bind="ctrl-u:preview-page-up"
--bind="ctrl-d:preview-page-down"
--preview-window "right:50%:hidden:wrap"
--preview "([[ -d {} ]] && tree -C {}) || ([[ -f {} ]] && bat -pn --color=always {}) || echo {}"
'
set -x FZF_DEFAULT_COMMAND 'fd --hidden \
    --exclude ".git" \
    --exclude "*.pyc" \
    --exclude node_modlues \
    --exclude .npm \
    --exclude .dotnet \
    --exclude .cargo \
    --exclude .cache \
    '

# Extend path
fish_add_path $HOME/.local/bin/scripts
fish_add_path $HOME/.cargo/bin 
