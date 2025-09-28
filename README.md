
## Arch Linux

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
# pacman -S networkmanager
```
#### User Management
```
# EDITOR=/usr/bin/nvim
# useradd -m saeed
# usermod -aG wheel,audio,video,storage,optical,network saeed
# passwd 
# exprot EDITOR=nvim
# visduo    # uncomment `Wheel ALL(ALL=ALL)` 
```
#### Network Management
```
# systemctl enable NetworkManager.service
```
chagne wifi backend from wpa_supplicant to iwd
```
sudo pacman -S iwd
```
```
/etc/NetworkManager/conf.d/wifi_backend.conf
---
[device]
wifi.backend=iwd
```
**Connect/disconnect to wifi with nmcli**
```
$ nmcli device status
$ nmcli device wifi list
$ sudo nmcli device wifi connect <wifi_name> password <wifi_passwd>
# nmcli device discconect <divce_name>
```
#### Grub
```
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
```

## Setup Xorg and WM
### Xorg + WM
```
$ sudo pacman -S xorg-server xorg-xinit xorg-xinput

# sound system
$ sudo pacman -S alsa-utils pulseaudio pulseaudio-alsa

# Graphic card use built-in!!!

# Window Manager
$ sudo pacman -S qtile noto-fonts adobe-source-code-pro-fonts
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
Press `ctl + v` after that press the key a beeter way
`cat -v` and type any key to get code of the key
is run `showkey -a`
* Create `.desktop` file for any script to be regonziable by rofi
* Install noto-font-cjk noto-font-emoji noto-font-extra to render all fonts.
* Pulseaudio issue: When plug headphone sound doesn't switch to headephone or 
if it switch after unpluged it sound lost completely.
To fix this comment out `load-module module-switch-on-prot-available` on 
/etc/pulse/default/.pa
Packges to install:
```
sudo pacman -S pulseaudio pulseaudio-alsa pulseaudio-jack

```

### Install Apps
```
$ sudo pacman -S base-devl kitty zsh firefox feh pcmanfm-gtk3 
$ sudo pacman -S rofi openssh picom zip unzip xarchiver
$ sudo pacman -S python-pip tk reflector tmux
$ sudo pacman -S noto-fonts-emoji ttf-font-awesome
$ sudo pacman -S starship ttf-nerd-fonts-symbols-common
$ sudo pacman -S ripgrep fd sqlite node npm tk tree scrot xsel
```

## ~~Manage Dotfiles with git bare~~

```
$ git init --bare $HOME/.dotfiles.git
$ echo 'alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"' >> $HOME/.zshrc
$ source ~/.zshrc
$ dotfiles config --local status.showUntrackedFiles no
```

[Link to full article](https://harfangk.github.io/2016/09/18/manage-dotfiles-with-a-git-bare-repository.html)
> Remove git bare workflow becuase I wouldn't able to use git diff.
> Using symbolic link to mange dots.

## Apps
* Window Manager: ~~Qtile~~ dwm
* Terminal: ~~Kitty~~ st
* Shell: Zsh
* App Launcher: ~~rofi~~ demenu
* Editor: Neovim
* Editor2: ~~VS Code~~ Emacs[Maybe]
* Browser: ~~Firefox / Edge~~ Brave
* File Manager: PcmanFM
* Compositor: ~~picom~~
* Terminal Multiplexer: tmux

2025
![screenshot 2025](https://github.com/ostadsgo/dotfiles/blob/master/bin/screenshots/2025-04-15-01%3A49%3A39-screenshot.png)

2023
![screenshot 2023](https://github.com/ostadsgo/dotfiles/blob/master/bin/screenshots/2023-01-29-04_45_51-screenshot.png)
