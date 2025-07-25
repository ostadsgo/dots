
# Disable beep sound
xset -b

# Persian Keyboard Layout
setxkbmap -layout us,ir -option grp:alt_shift_toggle

# Disable touch pad
xinput disable "AlpsPS/2 ALPS GlidePoint" &

# incerese speed of repeated key.
xset r rate 200 35 &

# clear right side of dwm statusbar
xsetroot -name "" &

# Run st terminal at first tag.
st -e tmux &

exec dwm
