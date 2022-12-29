
# General aliases
alias sx=startx
alias ls="ls --color"
alias la="ls -A --color"
alias ll="ls -alth --color"
alias vim=nvim
alias ka=killall

# Python aliases
alias py=python $1
alias venv='python -m venv .venv'
alias vact='source .venv/bin/activate'
alias dact=deactivate

# Django aliases
alias djapp='python manage.py startapp' $1
alias djrun='python manage.py runserver'
alias djmkm='python manage.py makemigrations' $1
alias djmig="python manage.py migrate" $1
alias djcsu="python manage.py createsuperuser --username admin --email ad@min.com"

# get fastest mirrors
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

alias archlinx-fix-keys="sudo pacman-key --init && sudo pacman-key --populate archlinux && sudo pacman-key --refresh-keys"

# Git bare: manage dotfiles
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"

