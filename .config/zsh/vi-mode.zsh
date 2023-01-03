# vim config for zsh
#

bindkey -v
bindkey jk vi-cmd-mode  

# Fix backspace to not change mode 
bindkey "^[b" backward-word 
bindkey "^[f" forward-word

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
