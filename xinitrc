# Load .Xresources to style emacs / urxvt / ect...
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# Call xmodmap to configure keyboard
xmodmap .Xmodmaprc

# Set the typematic delay and rate
xset r rate 300 30    #A 250ms delay, and 30Hz repeat

# Set mouse pointer
xsetroot -cursor_name left_ptr

# Start xmonad. Will kill X when xmonad quits
exec i3
