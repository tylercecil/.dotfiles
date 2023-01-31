#!/usr/bin/env bash

function log() {
  logger --stderr -- update_screens.sh: "$@"
}

log 'script started...'
LID=$( rg closed /proc/acpi/button/lid/LID/state --no-line-number -o \
    || rg open   /proc/acpi/button/lid/LID/state --no-line-number -o)
SCREENS=$(xrandr | rg ' connected' -c)
log "LID=${LID} ; SCREENS=${SCREENS}"

if [[ $LID == "open" ]]   && [[ $SCREENS == "1" ]]; then
  log "Running laptop.sh..."
  /home/tyler/.screenlayout/laptop.sh
fi
if [[ $LID == "open" ]]   && [[ $SCREENS == "2" ]]; then
  log "Running two-monitor.sh..."
  /home/tyler/.screenlayout/two-monitor.sh
fi
if [[ $LID == "closed" ]] && [[ $SCREENS == "2" ]]; then
  log "Running clam.sh..."
  /home/tyler/.screenlayout/clam.sh
fi

