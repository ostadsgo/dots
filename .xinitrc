# Disable beep sound
xset -b

# Persian Keyboard Layout
setxkbmap -layout us,ir -option grp:alt_shift_toggle

# incerese speed of repeated key.
xset r rate 200 35 

# Disable touch pad
xinput disable "AlpsPS/2 ALPS GlidePoint" &

# set wallpaper
setbg &

# Run picom in background
picom -b

# Run wm
exec dwm

