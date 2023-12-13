# Colors
# -----------------
FG_BLUE="%F{blue}"
FG_YELLOW="%F{yellow}"
FG_GREEN="%F{green}"
FG_RED="%F{red}"
FG_MAGENTA="%F{magenta}"
FG_RESET="%F{reset}"


# Parts of a prompt
# ----------------
SHAPE="=>"
CURRENT_DIR="%1~"
FULL_PATH="%~"
HOST_NAME="%m"

# Version contorl like git
setopt PROMPT_SUBST
autoload -Uz vcs_info
zstyle ':vcs_info:git:*' formats "$FG_MAGENTA<%b>"

function preexec() {
  timer=${timer:-$SECONDS}
}

function precmd() {
    if [ $timer ]; then
        timer_show=$(($SECONDS - $timer))
        unset timer
    fi
}

# Left and Right prompt
# ----------------------
VALID_CMD='$FG_BLUE$CURRENT_DIR$FG_YELLOW$SHAPE'
INVALID_CMD='$FG_BLUE$CURRENT_DIR$FG_RED$SHAPE'

PROMPT="%(?.$VALID_CMD.$INVALID_CMD)$FG_RESET "
RPROMPT='$vcs_info_msg_0_ ${timer_show}s'

