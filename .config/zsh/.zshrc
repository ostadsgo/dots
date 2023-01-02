
HISTFILE=$HOME/.config/zsh/.histfile
HISTSIZE=10000
SAVEHIST=10000


# beeping is annoying
unsetopt BEEP
setopt HIST_IGNORE_ALL_DUPS 
setopt HIST_IGNORE_SPACE

# auto complete
autoload -U compinit && compinit
zstyle ':completion:*' menu select
zmodload -i zsh/complist

# Starship prompt
#eval "$(starship init zsh)"

# Useful Functions
source "$ZDOTDIR/functions.zsh"

# Plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "hlissner/zsh-autopair"
zsh_add_plugin "agkozak/zsh-z"

# Other files
zsh_add_file "aliases.zsh"
zsh_add_file "exports.zsh"
zsh_add_file "vi-mode.zsh"
zsh_add_file "prompts/default.zsh-theme"

