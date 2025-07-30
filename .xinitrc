
# Disable beep sound
xset -b

# Persian Keyboard Layout
setxkbmap -layout us,ir -option grp:alt_shift_toggle

# Disable touch pad
xinput disable "AlpsPS/2 ALPS GlidePoint" &

# incerese speed of repeated key.
xset r rate 200 35 &

# Add wallpaper
xwallpaper --stretch ~/pix/wall.jpg

# Run picom in background
picom &

# Run st terminal at first tag.
st -e tmux &

# Run dwm
exec dwm
