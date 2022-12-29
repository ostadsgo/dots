# vim config for zsh
#

bindkey -v
bindkey jk vi-cmd-mode  

# Fix backspace to not change mode 
bindkey "^[b" backward-word 
bindkey "^[f" forward-word

# Navigate
bindkey '^k' vi-up-line-or-history
bindkey '^j' vi-down-line-or-history
