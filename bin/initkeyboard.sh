# This script configures the keyboard the way I like it. Putting this in a
# script gives me a contained and portable way to launch the keyboard
# configuration.
# TODO: see if there is a way to detect if I'm using a mac keyboard. If so, don't
#       do an alt/win swap.

xset r rate 300 30    #A 250ms delay, and 30Hz repeat
setxkbmap -option  altwin:swap_alt_win,compose:ralt,caps:ctrl_modifier
