
## --------------
##    Exports
## --------------
set -x HOME ~
set -x EDITOR "nvim"
set -x BROWSER "chrome"
set -x TERMINAL "alacritty"
set -x TERM "alacritty"
set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_CASHE_HOME $HOME/.cache
set -x XDG_DATA_HOME $HOME/.local/share
set -x GOPATH $XDG_DATA_HOME/go

### FZF
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
set -x FZF_DEFAULT_COMMAND 'fd --hidden \
    --exclude ".git" \
    --exclude "*.pyc" \
    --exclude node_modlues \
    --exclude .npm \
    --exclude .dotnet \
    --exclude .cargo \
    '

# Extend path
fish_add_path $HOME/.local/bin/scripts
fish_add_path $HOME/.cargo/bin 
