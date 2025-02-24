
# ---------
# Alisees
# ---------
alias sx=startx
alias ls='exa --icons --color=always' 
alias ll='ls -lh'
alias ..='cd ..'
alias ...='cd ../..'
alias cp='cp -r'
alias rm='rm -r'
alias rmf='rm -rf'
alias tree='exa -T'
alias vim=nvim
alias v='nvim $(fzf)'
alias ka=killall
alias grep='grep --color'
alias hist=history
alias path='echo -e ${PATH//:/\\n}'
alias pingarch="ping -c 5 archlinux.org"
alias pingnet="ping -c 5  8.8.8.8"
alias ip='ip --color'
alias bat='bat -pn --theme="OneHalfDark"'
# apps
alias open=pcmanfm
alias record='ffmpeg -framerate 60 -f x11grab -i $DISPLAY -f  pulse -i default $1'
alias play='ffplay'
alias show='sxiv'
# Django aliases
alias djapp='python manage.py startapp'
alias djrun='python manage.py runserver'
alias djmkm='python manage.py makemigrations'
alias djmig='python manage.py migrate'
alias djcsu='python manage.py createsuperuser --username admin --email ad@min.com'
# Reflector
alias mirror='sudo reflector --fastest 30 --latest 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist'
alias mirrord='sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist'
alias mirrors='sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist'
alias mirrora='sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist'
alias mirrorl='sudo reflector --country Iran,Turky --sort rate --save /etc/pacman.d/mirrorlist'
alias mirrorg='sudo reflector --country  Germany,Denmark,Netherland,Sweeden --sort rate --save /etc/pacman.d/mirrorlist'
# pacman
alias paco='sudo pacman -Qdt'  # Orphans
alias pacor='sudo pacman -Rns $(pacman -Qtdq)'  # remove orphans
# other
alias arch-fix-key='sudo pacman-key --init && sudo pacman-key --populate archlinux && sudo pacman-key --refresh-keys'
alias dots='/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME'


# ---------
# Exports
# ---------
export HOME=~
export EDITOR="nvim"
export BROWSER="chrome"
export TERMINAL="st"
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export GOPATH=$XDG_DATA_HOME/go
# Extend path
path+=$HOME/.local/bin/scripts
path+=$HOME/.cargo/bin


# -----------
# Config Zsh
# -----------
ZVM_INIT_MODE=sourcing  # version management like git
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
HISTDUP=erase
# ---------
unsetopt BEEP
setopt share_history
setopt appendhistory
setopt hist_expire_dups_first
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt autocd
setopt vi
# ---------
autoload -U colors && colors	    # Load colors
autoload -U compinit && compinit # defualt auto complete
zmodload -i zsh/complist
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors 'm:{(s.:.)LS_COLORS}'
zstyle ':completion:*' complete-options true


# ---------
# Plugins
# ---------
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source <(fzf --zsh) 
eval "$(zoxide init zsh)" 
# enable z command

# ---------------
# VI keybindings
# ---------------
bindkey -v
bindkey jk vi-cmd-mode
# delete
bindkey '^k' kill-line
bindkey '^[d' kill-word 
bindkey '^[h' backward-kill-word
# Move 
bindkey '^[f' forward-word  
bindkey '^[b' backward-word  
# auto comp menu
bindkey '^n' menu-select
bindkey "^p" menu-select
bindkey -M menuselect '^n' menu-complete
bindkey -M menuselect "^p" reverse-menu-complete
# fzf
bindkey -s '^f' 'fzf\n'
bindkey -s '^o' 'v\n'

# ---------
# Porompt
# ---------
