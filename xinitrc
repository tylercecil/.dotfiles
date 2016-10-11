#!/bin/sh

# Load .Xresources to style emacs / urxvt / ect...
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# Set mouse pointer
xsetroot -cursor_name left_ptr

# Init keys
~/.bin/initkeyboard.sh

# Start window manager. Will kill X when it quits.
exec i3
