# ---------
# ALISEES
# ---------
alias sx=startx
alias ls='ls --color=auto' 
alias ll='ls -lh --group-directories-first'
alias la='ls -Alh --group-directories-first'
alias ..='cd ..'
alias ...='cd ../..'
alias vim=nvim
alias cp='cp -r -v'
alias rm='rm -r'
alias rmf='rm -rf'
alias ka='pkill -9'
alias grep='grep --color=auto'
alias hist=history
alias ppath='echo -e ${PATH//:/\\n}'
alias ip='ip --color'
# apps
alias open='xdg-open'
alias record='ffmpeg -framerate 60 -f x11grab -i $DISPLAY -f pulse -i default '
alias play='mpv'
alias serve='python -m http.server'
alias shot='scrot -d 1 ~/pix/shots/%Y-%m-%d-%T-screenshot.png; notify-send "Screenshot" "Screenshot saved"'
alias dwl='axel -n 16'

# ---------
# EXPORTS
# ---------
export HOME=~
export EDITOR="nvim"
export BROWSER="firefox"
export FILEMANAGER="thunar"
export TERMINAL="st"
export TERM="xterm-256color"
# XDG
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
# PL
export GOPATH=$XDG_DATA_HOME/go
export GOBIN="$GOPATH/bin"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"
export CARGO_HOME="$XDG_DATA_HOME/cargo"

export QT_QPA_PLATFORMTHEME=gtk3
# Nvim Manpager
export MANPAGER="nvim +Man!"
# Extend path
export PATH="$PATH:$HOME/.local/bin:$XDG_DATA_HOME/nvim/mason/bin:$HOME/.cargo/bin:$XDG_CONFIG_HOME/emacs/bin"
# dbus - browser required it
export $(dbus-launch)
# History
export HISTSIZE=10000
export HISTFILESIZE=20000
export HISTCONTROL=ignoredups:ignorespace
export HISTCONTROL=ignoreboth:erasedups


# ------------------
# EXTERNAL COMMANDS
# ------------------
source <(fzf --bash) 
eval "$(zoxide init bash)"

# ------------
# BINDS
# -----------
set -o vi
bind '"jk":vi-movement-mode'
bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'
bind '"\C-n": history-search-forward'
bind '"\C-p": history-search-backward'
bind 'C-l':clear-screen
bind -x '"\C-@":"tmuxer"'

# ------------
# PROMPT
# -----------
# colors
RED='\[\e[91m\]'
NORMAL='\[\e[0m\]'

# prompt
PS1="[\u${RED}@${NORMAL}\h \W]\$ "
