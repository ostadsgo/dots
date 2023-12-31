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

# Fzf
bindkey -M emacs '^R' fzf-history-widget
bindkey -M vicmd '^R' fzf-history-widget
bindkey -M viins '^R' fzf-history-widget

bindkey -M emacs '^f' fzf-file-widget
bindkey -M vicmd '^f' fzf-file-widget
bindkey -M viins '^f' fzf-file-widget

bindkey -M emacs '^g' fzf-cd-widget
bindkey -M vicmd '^g' fzf-cd-widget
bindkey -M viins '^g' fzf-cd-widget


fzf-open-widget() {
    item=$(eval $FZF_DEFAULT_COMMAND | fzf)
    if [ ! -z $item ]; then
        zle push-line
        BUFFER="nvim ${(q)item}"
        zle accept-line
        local ret=$?
        unset item
        zle reset-prompt
        return $ret
    else
        zle reset-prompt
    fi
}

zle -N fzf-open-widget
bindkey "^o" fzf-open-widget
