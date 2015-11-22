# Load .Xresources to style emacs / urxvt / ect...
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# Call xmodmap to configure keyboard
xmodmap .Xmodmaprc

# Set the typematic delay and rate
xset r rate 300 30    #A 250ms delay, and 30Hz repeat

# Set mouse pointer
xsetroot -cursor_name left_ptr

# Set desktop using feh
feh --bg-fill ~/Pictures/wallpaper

# Start things that I want on on startup
compton -b --backend glx --vsync opengl-swc \
        --glx-no-stencil --glx-no-rebind-pixmap \
        --glx-swap-method 2
syndaemon -i 1 -t -k -d

# Start xmonad. Will kill X when xmonad quits
exec i3
