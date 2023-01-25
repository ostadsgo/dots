
## System
# General aliases
alias sx=startx
alias ls='ls --color'
alias ls='exa'
alias la='ls -a'
alias ll='ls -l'
alias tree='exa -T'
alias vim=nvim
alias ka=killall
alias reboot='sudo reboot now'
alias ..='cd ..'
alias ...='cd ../..'
alias grep='grep --color'
alias hist=history
alias path='echo -e ${PATH//:/\\n}'
alias ping="ping -c 5"
alias pingarch="ping archlinux.org"
alias pingnet="ping 8.8.8.8"
alias ip='ip --color'
# Apps
alias open=pcmanfm

# record screen
alias record='ffmpeg -framerate 30 -f x11grab -i $DISPLAY -f alsa -ac 2 -i hw:0 $1'


# Python aliases
alias py=python
alias venv='python -m venv .venv'
alias vact='source .venv/bin/activate'
alias dact=deactivate


# Django aliases
alias djapp='python manage.py startapp' $1
alias djrun='python manage.py runserver'
alias djmkm='python manage.py makemigrations' $1
alias djmig='python manage.py migrate' $1
alias djcsu='python manage.py createsuperuser --username admin --email ad@min.com'


# Reflector
alias mirror='sudo reflector --fastest 30 --latest 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist'
alias mirrord='sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist'
alias mirrors='sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist'
alias mirrora='sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist'
alias mirrorl='sudo reflector --country Iran,Turky --sort rate --save /etc/pacman.d/mirrorlist'
alias mirrorg='sudo reflector --country  Germany,Denmark,Netherland,Sweeden --sort rate --save /etc/pacman.d/mirrorlist'


## Pacman
alias pac='sudo pacman -S'
alias pacu='sudo pacman -Syu'
alias pacs='sudo pacman -Ss'
alias paci='sudo pacman -Si'
alias pacr='sudo pacman -Rscn'
alias pacq='sudo pacman -Q'    # list all packages
alias paco='sudo pacman -Qdt'  # Orphans
alias pacor='sudo pacman -Rns $(pacman -Qtdq)'  # remove orphans
alias pacc='sudo pacman -Scc'  # Clear cache
alias arch-fix-key='sudo pacman-key --init && sudo pacman-key --populate archlinux && sudo pacman-key --refresh-keys'


# Git
# Git bare: manage dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME'
alias g=git
alias gs='g status'
alias ga='g add'
alias gaa='g add -A'
alias gam='g add -am'
alias gc='g commit'
alias gcm='g commit -m'
alias gb='g branch'
alias gp='g push'
alias gs='g switch'


