#!/bin/sh

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

xset -b                        # Disable audible bell
xsetroot -cursor_name left_ptr # Set mouse pointer
~/.bin/initkeyboard.sh         # Update keyboard

ibus-daemon -drx

exec i3
