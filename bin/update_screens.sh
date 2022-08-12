#!/usr/bin/env bash

LID=$( rg closed /proc/acpi/button/lid/LID/state --no-line-number -o \
    || rg open   /proc/acpi/button/lid/LID/state --no-line-number -o)
SCREENS=$(xrandr | rg ' connected' -c)

if [[ $LID == "open" ]]   && [[ $SCREENS == "1" ]]; then
  /home/tyler/.screenlayout/laptop.sh
fi
if [[ $LID == "open" ]]   && [[ $SCREENS == "2" ]]; then
  /home/tyler/.screenlayout/two-monitor.sh
fi
if [[ $LID == "closed" ]] && [[ $SCREENS == "2" ]]; then
  /home/tyler/.screenlayout/clam.sh
fi
