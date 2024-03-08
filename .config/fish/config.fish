if status is-interactive
    # Commands to run in interactive sessions can go here
end

### vi mode
fish_vi_key_bindings

# bind \e\\h 'command-mode-toggle'
#
bind -M insert -m default jk cancel repaint-mode
bind -M insert \ck up-or-search
bind -M insert \cj down-or-search
bind -M insert \ch backward-kill-word 

bind -M default \ck up-or-search
bind -M default \cj down-or-search
bind -M default \ch backward-kill-word 

bind -M default \e\l accept-autosuggestion
bind -M default \e\h backward-kill-line

bind -M insert \e\l accept-autosuggestion
bind -M insert \e\h backward-kill-line

### Commands
zoxide init fish | source

### Exports
set -x HOME ~
set -x EDITOR "nvim"
set -x BROWSER "chrome"
set -x TERMINAL "alacritty"

set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_CASHE_HOME $HOME/.cache
set -x XDG_DATA_HOME $HOME/.local/share

set -x GOPATH $XDG_DATA_HOME/go

# Extend PATH
set -gx PATH $HOME/.cargo/bin $HOME/.local/bin/scripts $PATH 

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

### Key bindings

## Aliases
# General aliases
alias sx startx
alias ls 'exa --icons --color=always' 
alias la 'ls -a'
alias ll 'ls -lh'
alias lla 'ls -lah'
alias .. 'cd ..'
alias ... 'cd ../..'
alias cp 'cp -r'
alias rm 'rm -r'
alias rmf 'rm -rf'
alias tree 'exa -T'
alias vim nvim
alias ka killall
alias reboot 'sudo reboot now'
alias grep 'grep --color'
alias hist history
# alias path 'echo -e ${PATH//:/\\n}'
alias pingarch "ping -c 5 archlinux.org"
alias pingnet "ping -c 5  8.8.8.8"
alias ip 'ip --color'
alias bat 'bat -pn --theme="OneHalfDark"'
alias lg lazygit
alias poe poetry

alias open pcmanfm
alias record 'ffmpeg -framerate 60 -f x11grab -i $DISPLAY -f  pulse -i default $1'
alias play 'ffplay'

alias show 'sxiv'

# Python aliases
alias py python
alias venv 'python -m venv .venv'
alias vact 'source .venv/bin/activate'
alias dact deactivate

# Django aliases
alias djapp 'python manage.py startapp'
alias djrun 'python manage.py runserver'
alias djmkm 'python manage.py makemigrations'
alias djmig 'python manage.py migrate'
alias djcsu 'python manage.py createsuperuser --username admin --email ad@min.com'


# Reflector
alias mirror 'sudo reflector --fastest 30 --latest 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist'
alias mirrord 'sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist'
alias mirrors 'sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist'
alias mirrora 'sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist'
alias mirrorl 'sudo reflector --country Iran,Turky --sort rate --save /etc/pacman.d/mirrorlist'
alias mirrorg 'sudo reflector --country  Germany,Denmark,Netherland,Sweeden --sort rate --save /etc/pacman.d/mirrorlist'


## Pacman
alias pac 'sudo pacman -S'
alias pacu 'sudo pacman -Syu'
alias pacs 'sudo pacman -Ss'
alias pacr 'sudo pacman -Rscn'
alias pacq 'sudo pacman -Q'    # list all packages
alias paci 'sudo pacman -Qi'
alias paco 'sudo pacman -Qdt'  # Orphans
alias pacor 'sudo pacman -Rns $(pacman -Qtdq)'  # remove orphans
alias pacc 'sudo pacman -Scc'  # Clear cache
alias arch-fix-key 'sudo pacman-key --init && sudo pacman-key --populate archlinux && sudo pacman-key --refresh-keys'


# Git
# Git bare: manage dotfiles
alias dotfiles '/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME'
alias gst 'git status'
alias gss 'git status -s'
alias gaa 'git add -A'
alias gam 'git commit -am'
alias gcm 'git commit -m'
alias gbc 'git branch'
alias gbl 'git branch --all'
alias gpu 'git push'
alias gpm 'git push -u origin main'
alias gpd 'git push -u origin dev'
alias gpl 'git pull'
alias glo 'git pull origin main'
alias gsw 'git switch'
alias gsm 'git switch main'
alias gsd 'git switch dev'
alias glg 'git log'
alias gco 'git clone'
