#!/usr/bin/env bash

set -x

function log() {
  logger --stderr -- update_screens.sh: "$@"
}

log 'script started...'
LID=$( rg closed /proc/acpi/button/lid/LID*/state --no-line-number -o \
    || rg open   /proc/acpi/button/lid/LID*/state --no-line-number -o)
SCREENS=$(xrandr | rg ' connected' -c)
log "LID=${LID} ; SCREENS=${SCREENS}"

if [[ $LID == "open" ]]   && [[ $SCREENS == "1" ]]; then
  log "Running laptop.sh..."
  ~/.screenlayout/laptop.sh
fi
if [[ $LID == "open" ]]   && [[ $SCREENS == "2" ]]; then
  log "Running two-monitor.sh..."
  ~/.screenlayout/two-monitor.sh
fi
if [[ $LID == "closed" ]] && [[ $SCREENS == "2" ]]; then
  log "Running clam.sh..."
  ~/.screenlayout/clam.sh
fi

set +x
