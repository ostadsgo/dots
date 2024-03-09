#!/bin/zsh

ZVM_INIT_MODE=sourcing
HISTFILE=$ZDOTDIR/.histfile
HISTSIZE=1000000
SAVEHIST=1000000

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

# Zsh files
source $ZDOTDIR/exports.zsh
source $ZDOTDIR/aliases.zsh
source $ZDOTDIR/vi-mode.zsh

# Zsh plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
