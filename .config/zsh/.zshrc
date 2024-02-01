#!/bin/zsh

ZVM_INIT_MODE=sourcing
HISTFILE=$ZDOTDIR/.histfile
HISTSIZE=100000
SAVEHIST=100000


# beeping is annoying
unsetopt BEEP
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt autocd
setopt vi

autoload -U colors && colors	    # Load colors
autoload -U compinit && compinit    # auto complete
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zmodload -i zsh/complist
compinit


# Useful Functions
source "$ZDOTDIR/functions.zsh"

# File sourced
zsh_add_file "aliases.zsh"
zsh_add_file "exports.zsh"
zsh_add_file "vi-mode.zsh"

# Plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "hlissner/zsh-autopair"
zsh_add_plugin "agkozak/zsh-z"
zsh_add_plugin "zsh-users/zsh-completions"


# Starship prompt
eval "$(starship init zsh)"

# fzf
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh
