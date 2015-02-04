# Load .Xresources to style emacs / urxvt / ect...
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# Call xmodmap to configure keyboard
xmodmap .Xmodmaprc

# Set the typematic delay and rate
xset r rate 250 30    #A 250ms delay, and 30Hz repeat

# Set mouse pointer
xsetroot -cursor_name left_ptr

# Set desktop using feh
feh --bg-fill ~/Pictures/wallpaper

# Start compton for composting (allows transperancy)
# Compton hangs with -b... not sure why. This will do.
compton --config ~/.config/compton.conf &

# Start trayer, a system tray to host my icons for things.
#Alpha is set to 0 so that compton will set the alpha for us
trayer --edge top --align right --SetDockType true --SetPartialStrut true \
 --expand true --width 10 --transparent true --alpha 0 --tint 0x101011 --height 20 &

# Start things that I want on on startup
spotify &
dropboxd &

# Start xmonad. Will kill X when xmonad quits
exec xmonad
