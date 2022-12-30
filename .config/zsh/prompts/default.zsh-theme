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
precmd() {print ""; vcs_info}
zstyle ':vcs_info:git:*' formats "$FG_MAGENTA %b"

# Left and Right prompt
# ----------------------
VALID_CMD='$FG_BLUE$CURRENT_DIR$vcs_info_msg_0_ $FG_YELLOW$SHAPE'
INVALID_CMD='$FG_BLUE$CURRENT_DIR$FG_RED$vcs_info_msg_0_ $FG_RED$SHAPE'

PROMPT="%(?.$VALID_CMD.$INVALID_CMD)$FG_RESET "
RPROMPT='$FG_BLUE$FULL_PATH'
