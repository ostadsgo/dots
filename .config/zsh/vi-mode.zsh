#!/bin/zsh


bindkey -v
bindkey jk vi-cmd-mode  

# Fix backspace to not change mode 
bindkey "^[b" backward-word 
bindkey "^[f" forward-word
# cycle throw histoy of typed cmds
bindkey "\e[A" history-search-backward
bindkey "\e[B" history-search-forward
bindkey "^k" history-search-backward
bindkey "^j" history-search-forward
# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

bindkey '^H' backward-kill-word

# Fzf - history-widget 
bindkey -M emacs '^R' fzf-history-widget
bindkey -M vicmd '^R' fzf-history-widget
bindkey -M viins '^R' fzf-history-widget
# Fzf - history-widget 
bindkey -M emacs '^@' fzf-file-widget
bindkey -M vicmd '^@' fzf-file-widget
bindkey -M viins '^@' fzf-file-widget
