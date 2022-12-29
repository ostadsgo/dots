#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"

# variables
EDITOR=nvim
HOME="/home/saeed"
XDG_CONFIG_HOME="$HOME/.config"

# Aliases
alias vim=nvim
alias py=python

