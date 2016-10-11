#!/bin/sh

# Load .Xresources to style emacs / urxvt / ect...
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# Disable audible bell
xset -b

# Init keys
~/.bin/initkeyboard.sh

# Background color
xsetroot -solid "#333333"

# Set mouse pointer
xsetroot -cursor_name left_ptr

# Start urxvtd
urxvtd -q -f -o

# Start window manager. Will kill X when it quits.
exec i3
