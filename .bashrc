# ---------
# ALISEES
# ---------
alias sx=startx
alias ls='ls --color=auto' 
alias ll='ls -lh --group-directories-first'
alias la='ls -Alh --group-directories-first'
alias ..='cd ..'
alias ...='cd ../..'
alias cp='cp -r -v'
alias rm='rm -r'
alias rmf='rm -rf'
alias v=nvim
alias ka='pkill -9'
alias grep='grep --color=auto'
alias hist=history
alias ppath='echo -e ${PATH//:/\\n}'
alias ip='ip --color'
# apps
alias open='xdg-open'
alias record='ffmpeg -framerate 60 -f x11grab -i $DISPLAY -f pulse -i default '
alias play='ffplay'
alias show='sxiv'
alias reader=zathura
alias edit=leafpad
alias serve='python -m http.server'
# Django aliases
alias djapp='python manage.py startapp'
alias djrun='python manage.py runserver'
alias djmkm='python manage.py makemigrations'
alias djmig='python manage.py migrate'
alias djcsu='python manage.py createsuperuser --username admin --email ad@min.com'
# Reflector
alias mirror-fast='sudo reflector --fastest 30 --latest 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist'
alias mirror-delay='sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist'
alias mirror-score='sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist'
alias mirror-age='sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist'
alias mirror-local='sudo reflector --country Iran,Turky --sort rate --save /etc/pacman.d/mirrorlist'
alias mirror-europe='sudo reflector --country  Germany,Denmark,Netherland,Sweeden --sort rate --save /etc/pacman.d/mirrorlist'
# pacman
alias paco='sudo pacman -Qdt'  # Orphans
alias pacor='sudo pacman -Rns $(pacman -Qtdq)'  # remove orphans
# other
alias arch-fix-key='sudo pacman-key --init && sudo pacman-key --populate archlinux && sudo pacman-key --refresh-keys'

# ---------
# EXPORTS
# ---------
export HOME=~
export EDITOR="nvim"
export BROWSER="firefox"
export TERMINAL="st"
export TERM="xterm-256color"
# XDG
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
# history
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0" 
export LESSHISTFILE="$XDG_CACHE_HOME/less_history"
export PYTHON_HISTORY="$XDG_DATA_HOME/python/history"
export SQLITE_HISTORY="$XDG_CACHE_HOME/sqlite_history"
export WGET_HSTS_FILE="$XDG_CACHE_HOME/wget-hsts"
export ZCOMP_DUMPFILE="$XDG_CACHE_HOME/zsh/.zcompdump"
export EMACS_DIR=~/.config/emacs
# PL
export GOPATH=$XDG_DATA_HOME/go
export GOBIN="$GOPATH/bin"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
# Nvim Manpager
export MANPAGER="nvim +Man!"
# Qt
# export QT_QPA_PLATFORMTHEME=gtk3
# Extend path
export PATH="$PATH:$HOME/.local/bin:$HOME/.cargo/bin"
# History
export HISTSIZE=10000
export HISTFILESIZE=20000
export HISTCONTROL=ignoredups:ignorespace
# ------------------
# EXTERNAL COMMANDS
# ------------------
source <(fzf --bash) 
eval "$(zoxide init bash)"

# ------------
# BINDS
# -----------
bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'
bind '"\C-n": history-search-forward'
bind '"\C-p": history-search-backward'

# ------------
# PROMPT
# -----------
PS1='[\u@\h \W]\$ '
