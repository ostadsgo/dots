
# Set capslock to be <Escape>
setxkbmap -option caps:escape

# Disable touch pad
xinput disable "AlpsPS/2 ALPS GlidePoint" &

# Disable touch pad
xinput disable "AlpsPS/2 ALPS GlidePoint" &

# incerese speed of repeated key.
xset r rate 200 30 &

# clear right side of dwm statusbar
xsetroot -name " " &

exec dwm
