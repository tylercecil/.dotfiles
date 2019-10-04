#!/usr/bin/env bash
xdotool search --onlyvisible --classname URxvtUtil windowunmap \
  || xdotool search --classname URxvtUtil windowmap \
  || urxvt -name URxvtUtil -T URxvtUtil -geometry 40x8+300+1 -e $*
