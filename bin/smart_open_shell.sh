#!/usr/bin/env bash

# Opens a new terminal preserving:
#  1) The directory of the current focused window
#  2) The ssh connection of the current focused window
# Otherwise opens a fresh terminal.

set -x
TERM=alacritty

function cdterm {
  DIR=${1}
  shift 1
  ${TERM} ${@} --working-directory "${DIR}"
}

function sshterm {
  SSH_CMD=${1}
  shift 1
  ${TERM} ${@} -e /bin/sh -c "exec ${SSH_CMD}"
}

# Get focused window PID — sway or X11
function get_focused_pid {
  if [[ -n "$SWAYSOCK" ]]; then
    swaymsg -t get_tree | jq '.. | select(.focused? and .pid?) | .pid'
  elif [[ -n "$DISPLAY" ]]; then
    xdotool getwindowfocus getwindowpid
  fi
}

FOCUSED_PID=$(get_focused_pid)
FOCUSED_CMD=$(basename "$(cut -d '' -f 1 "/proc/${FOCUSED_PID}/cmdline" 2>/dev/null)")

if ! [[ "${FOCUSED_PID}" ]] || [[ "${FOCUSED_CMD}" != "$TERM" ]]; then
  $TERM
  exit
fi

# Detect ssh or shell child of the terminal process
SSH_PID=$(pstree -p "${FOCUSED_PID}" | grep -o 'ssh([0-9]*)' | sed 's/[^0-9]//g')
SHELL_PID=$(pgrep -P "${FOCUSED_PID}" "$(basename "${SHELL}")")

if [[ ${SSH_PID} ]]; then
  SSH_CMD=$(tr "\0" " " < "/proc/${SSH_PID}/cmdline")
  sshterm "${SSH_CMD}" "${@}"
elif [[ ${SHELL_PID} ]]; then
  DIR=$(readlink "/proc/${SHELL_PID}/cwd")
  cdterm "${DIR}" "${@}"
else
  $TERM
fi
set +x
