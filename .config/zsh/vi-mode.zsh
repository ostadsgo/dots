#!/bin/zsh


bindkey -v
bindkey jk vi-cmd-mode

# Fix backspace to not change mode
bindkey "^[b" backward-word
bindkey "^[f" forward-word
# Delete a word with ctrl + backspace
bindkey -M vicmd '^[^?' backward-kill-word 
bindkey -M viins '^[^?' backward-kill-word 
bindkey -M vicmd '^H' backward-kill-word
bindkey -M viins '^H' backward-kill-word

# cycle throw histoy of typed cmds
bindkey "\e[A" history-search-backward
bindkey "\e[B" history-search-forward
bindkey "^k" history-search-backward
bindkey "^j" history-search-forward

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'j' vi-down-line-or-history


# Fzf
bindkey '^r' fzf-history-widget
bindkey '^f' fzf-file-widget
bindkey '^n' fzf-cd-widget

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

# Lazygit
function run_lazygit() {
    lazygit
    zle accept-line
}
zle -N run_lazygit
bindkey '^g' run_lazygit
#
