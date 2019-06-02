#!/usr/bin/env bash
# Opens a new $TERM (urxvt) preserving
#  1) The directory of the current selected window
#  2) The ssh connection of the current selected window
# Otherwise opens up a fresh instance of urxvt.
set -x

TERM_NAME=urxvt
TERM_CMD=urxvtc

# Open a term at a directory
function cdterm {
  DIR=${1}
  shift 1
  ${TERM_CMD} ${@} -cd "${DIR}"
}

# Open a term with an SSH connection
function sshterm {
  SSH_CMD=${1}
  shift 1
  ${TERM_CMD} ${@} -e /bin/sh -c "exec ${SSH_CMD}"
}

# Get focused window PID.
# X_PID=$(xprop _NET_WM_PID | cut -d' ' -f3) # This is good for testing
X_PID=$(xdotool getwindowfocus getwindowpid)

# Check if focused window isn't term. If not, launch term normally.
X_CMD=$(basename $(cat "/proc/${X_PID}/cmdline" | cut -d '' -f 1))
if ! [[ "${X_PID}" ]] || [[ "${X_CMD}" != $TERM_NAME ]]; then
  $TERM_CMD
  exit
fi

# Get shell or ssh information. If SSH info found, launch sshterm. If shell,
# launch cdterm.
SSH_PID=$(pstree ${X_PID} -p | grep -e 'ssh([0-9]*)' -o | sed 's/[^0-9]//g')
# SHELL_PID=$(pgrep -P ${X_PID} $(echo ${SHELL} | grep -e '[^/]*$' -o))
SHELL_PID=$(pgrep -P ${X_PID} $(basename ${SHELL}))
if [[ ${SSH_PID} ]]; then
  SSH_CMD=$(cat "/proc/${SSH_PID}/cmdline" | tr "\0" " ")
  sshterm "${SSH_CMD}" ${@}
elif [[ ${SHELL_PID} ]]; then
  DIR=$(readlink "/proc/$SHELL_PID/cwd")
  cdterm "${DIR}" ${@}
fi

set +x
