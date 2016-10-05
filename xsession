#!/bin/sh

# necessary to make chrome pick up the proxy settings stored in gconf.
export DESKTOP_SESSION=gnome

# necessary for perforce
export P4CONFIG=.p4config
export P4DIFF="colordiff -u "
export P4MERGE=/google/src/files/head/depot/eng/perforce/mergep4.tcl
export P4EDITOR=$EDITOR

# Disable audible bell
xset -b

# Keyboard setup. Repeat rate, nocapslock, swap alt w/ win (used to osx)
# and activate the compose key (so I can actually type in other languages).
xset r rate 300 30    #A 250ms delay, and 30Hz repeat
setxkbmap -option  altwin:swap_alt_win,compose:ralt,caps:ctrl_modifier

# NOTE: This may break your compose key https://groups.google.com/a/google.com/forum/#!topic/i3-users/YBexXGbik7E
export GTK_IM_MODULE=xim

# Background color
xsetroot -solid "#333333"
# Start urxvtd
urxvtd -q -f -o

exec i3
