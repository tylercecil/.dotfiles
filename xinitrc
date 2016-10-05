# Load .Xresources to style emacs / urxvt / ect...
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# Call xmodmap to configure keyboard
xmodmap .Xmodmaprc

# Keyboard setup. Repeat rate, nocapslock, swap alt w/ win (used to osx)
# and activate the compose key (so I can actually type in other languages).
xset r rate 300 30    #A 250ms delay, and 30Hz repeat
setxkbmap -option  altwin:swap_alt_win,compose:ralt,caps:ctrl_modifier

# Set mouse pointer
xsetroot -cursor_name left_ptr

# Start xmonad. Will kill X when xmonad quits
exec i3
