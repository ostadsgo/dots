## Arch

### Connect to Wifi
```
$ iwctl
#[iwd] device list
#[iwd] station <device_name> get-networks
#[iwd] station <device_name> connect <network_name>
# network-password:
```
** Check connection **
`ping -c 5 archlinux.org`

### Arch Pre Install
```
# reflector --country Iran,Denmark,Germany --sort rate --save /etc/pacman.d/mirrorlist
# pacman -Sy archlinux-keyring
```
### Install Arch
[Arch installation guid](https://wiki.archlinux.org/title/installation_guide)

### Arch Post Install
#### Apps
```
# pacman -S neovim python git sudo networkmanager
```
#### User Management
```
# EDITOR=/usr/bin/nvim
# useradd -m saeed
# usermod -aG wheel,audio,video,storage,optical saeed
# passwd 
# visduo    # uncomment `Wheel ALL(ALL=ALL)` 
```
#### Network Management
```
# systemctl enable NetworkManager.service
```
**Connect/disconnect to wifi with nmcli**
```
$ nmcli device status
$ nmcli device wifi list
$ nmcli device wifi connect <wifi_name> password <wifi_passwd>
# nmcli device discconect <divce_name>
```

## Setup Xorg and WM
### Xorg + WM
```
$ sudo pacman -S xorg-server xorg-xinit xorg-xinput

# sound system
$ sudo pacman -S alsa-utils pulseaudio pulseaudio-alsa

# Graphic card use built-in!!!

# Window Manager
$ sudo pacman -S qtile noto-fonts tamsyn-font
```

### Config
* tty font config
```
$ showconsolefont            # display avilable fonts
$ setfont <bitmap_font_name.postfix>
# Perment font setting font console.
$ nvim /etc/vconsole.conf
FONT=<bitmap-font-name>
```
* qtile: `$ sudo pacman -S qtile`
* xinitrc: `$ echo "qtile start" >> .xinitrc`
* run: `$ startx`
* disable touch pad: `$ xinput disable "AlpsPS/2 ALPS GlidePoint"`
* Home folder
```
$ sudo pacman -S xdg-user-dirs
$ xdg-user-dirs-update
```
* Add Persian keyboard layout
```
$ sudo nvim /etc/X11/xorg.conf.d/00-keyboard.conf

Section "InputClass"
        Identifier "system-keyboard"
        MatchIsKeyboard "on"
        Option "XkbLayout" "us,ir"
        Option "XkbModel" "pc104"
        Option "XkbOptions" "grp:alt_shift_toggle"
EndSection
```
* Font config
```
font config will come here ...
```
* Qtile useful commands
```
$ qtile cmd-obj -o cmd -f restart
$ qtile cmd-obj -o cmd -f reload_config
```
* Zsh: custom config path
```
$ chsh -s /usr/bin/zsh
$ sudo nvim /etc/zsh/zprofile
$ export ZDOTDIR=/home/saeed/.config/zsh
```
* Scrot: Take screenshot
```
$ scrot -d 3 ~/Screenshots/%Y-%m-%d-%T-screenshot.png
```
* Chnage default file manager to pcmanfm
```
xdg-mime query filetype folder
xdg-mime default pcmanfm.desktop inode/directory
```
* Net speed widget
```
pip install psutil
```
* picom
```
# use picom -b rather than picom &
# picom & will eats swape drive and system will freeze.
picom -b
```

### Tips
* Get code of key to use in key defining for zsh
Press `ctl + v` after that press the key
* Create `.desktop` file for any script to be regonziable by rofi


### Install Apps
```
$ sudo pacman -S base-devl kitty zsh firefox feh pcmanfm-gtk3 
$ sudo pacman -S rofi openssh picom zip unzip xarchiver
$ sudo pacman -S python-pip tk reflector tmux
$ sudo pacman -S noto-fonts-emoji ttf-font-awesome
$ sudo pacman -S starship ttf-nerd-fonts-symbols-common
$ sudo pacman -S ripgrep fd sqlite node npm tk tree scrot xsel
```

## Manage Dotfiles
```
$ git init --bare $HOME/.dotfiles.git
$ echo 'alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"' >> $HOME/.zshrc
$ source ~/.zshrc
$ dotfiles config --local status.showUntrackedFiles no
```
[Link to full article](https://harfangk.github.io/2016/09/18/manage-dotfiles-with-a-git-bare-repository.html)


## Apps
* Window Manager: Qtile
* Terminal: Kitty
* Shell: Zsh
* Term Multiplexer: Tmux
* App Launcher: rofi
* Editor: Neovim
* Editor2: VS Code
* Browser: Firefox
* File Manager: PcmanFM
* Background: Xwallpaper
* Compositor: picom

