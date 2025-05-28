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
alias play='ffplay'
alias serve='python -m http.server'
# Django aliases
alias djapp='python manage.py startapp'
alias djrun='python manage.py runserver'
alias djmkm='python manage.py makemigrations'
alias djmig='python manage.py migrate'
alias djcsu='python manage.py createsuperuser --username admin --email ad@min.com'


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
# PL
export GOPATH=$XDG_DATA_HOME/go
export GOBIN="$GOPATH/bin"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
# Nvim Manpager
export MANPAGER="nvim +Man!"
# Extend path
export PATH="$PATH:$HOME/.local/bin:$HOME/.cargo/bin"
# History
export HISTSIZE=10000
export HISTFILESIZE=20000
export HISTCONTROL=ignoredups:ignorespace
export HISTCONTROL=ignoreboth:erasedups

# ------------------
# EXTERNAL COMMANDS
# ------------------
source <(fzf --bash) 


# ------------
# BINDS
# -----------
tmuxer() {
  selected=$(ls ~/dox/repos | fzf) || return
  cd ~/dox/repos/"$selected" || return

  # if in tmux
  if [ -n "$TMUX" ]; then
    # if session exist
    if tmux has-session -t "$selected" 2>/dev/null; then
      tmux switch-client -t "$selected"
      return
    fi
    # create in detach mode and then switch
    tmux new-session -d -s "$selected"
    tmux switch-client -t "$selected"
  # not in tmux
  else
    # attach or create
    tmux attach -t "$selected" || tmux new-session -s "$selected"
  fi
}

bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'
bind '"\C-n": history-search-forward'
bind '"\C-p": history-search-backward'
bind -x '"\C-@":"tmuxer"'

# ------------
# PROMPT
# -----------
# colors
RED='\[\e[91m\]'
NORMAL='\[\e[0m\]'

# prompt
PS1="[\u${RED}@${NORMAL}\h \W]\$ "
