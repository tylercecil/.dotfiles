#!/bin/sh

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

xset -b                        # Disable audible bell
xsetroot -cursor_name left_ptr # Set mouse pointer

# ibus-daemon -drx

# Don't want this to auto-run until I figure out crash issue.
# [[ -f ~/.bin/update_screens.sh ]] && ~/.bin/update_screens.sh
exec i3
