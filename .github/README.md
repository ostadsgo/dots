## Arch
---------

#### Connect to Wifi
```
$ iwctl
#[iwd] device list
#[iwd] station <device_name> get-networks
#[iwd] station <device_name> connect <network_name>
# network-password:
```
*Check connection*
`ping -c 5 archlinux.org`

#### Arch Pre Install
```
# reflector --country Iran,Denmark,Germany --sort rate --save /etc/pacman.d/mirrorlist
# pacman -Sy archlinux-keyring
```
[Arch installation guid](https://wiki.archlinux.org/title/installation_guide)

#### Arch Post Install
##### Apps
```
# pacman -S neovim git sudo networkmanager
```
##### Config
```
# EDITOR=/usr/bin/nvim
```
##### User Management
```
# useradd -m saeed
# usermod -aG wheel,audio,video,storage,optical saeed
# passwd 
# visduo    # uncomment `Wheel ALL(ALL=ALL)` 
```
##### Network Management
```
# systemctl enable NetworkManager.service
```
*Connect to wifi with nmcli*
```
$ nmcli device wifi list
$ nmcli device wifi connect <wifi_name> password <wifi_passwd>
```






## Applications

### Zsh

### Neovim

### Qtile


