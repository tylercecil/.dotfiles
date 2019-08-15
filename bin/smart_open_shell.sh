#!/usr/bin/env bash
# Opens a new $TERM (urxvt) preserving
#  1) The directory of the current selected window
#  2) The ssh connection of the current selected window
# Otherwise opens up a fresh instance of urxvt.
set -x

# TODO: Using urxvtc presents a problem --- the pid is always of the deamon.
TERM_NAME=urxvt
TERM_CMD=urxvt

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
X_PID=$(xdotool getwindowfocus getwindowpid)

# Check if focused window isn't term. If not, launch term normally.
X_CMD=$(basename $(cat "/proc/${X_PID}/cmdline" | cut -d '' -f 1))
if ! [[ "${X_PID}" ]] || [[ "${X_CMD}" != $TERM_NAME ]]; then
  $TERM_CMD
  exit
fi

# Get shell or ssh information. 
SSH_PID=$(pstree -p ${X_PID} | grep -e 'ssh([0-9]*)' -o | sed 's/[^0-9]//g')
SHELL_PID=$(pgrep -P ${X_PID} $(basename ${SHELL}))
if [[ ${SSH_PID} ]]; then
  SSH_CMD=$(cat "/proc/${SSH_PID}/cmdline" | tr "\0" " ")
  sshterm "${SSH_CMD}" ${@}
elif [[ ${SHELL_PID} ]]; then
  DIR=$(readlink "/proc/$SHELL_PID/cwd")
  cdterm "${DIR}" ${@}
fi

set +x
