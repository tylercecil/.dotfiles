#!/bin/sh

# necessary to make chrome pick up the proxy settings stored in gconf.
export DESKTOP_SESSION=gnome

# necessary for perforce
export P4CONFIG=.p4config
export P4DIFF="colordiff -u "
export P4MERGE=/google/src/files/head/depot/eng/perforce/mergep4.tcl
export P4EDITOR=$EDITOR

# NOTE: This may break your compose key https://groups.google.com/a/google.com/forum/#!topic/i3-users/YBexXGbik7E
export GTK_IM_MODULE=xim

# Most of my configuration is kept in xinitrc, as at home I don't use a login
# manager.
~/.xinitrc
