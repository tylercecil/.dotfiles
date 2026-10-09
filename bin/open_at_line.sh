#!/bin/bash
set -euo pipefail

input="${1:-}"
if [[ -z "$input" ]]; then
    echo "Usage: open_at_line.sh <file[:line]>" >&2
    exit 1
fi

if [[ "$input" == *:* ]]; then
    f="${input%%:*}"
    l="${input##*:}"
    exec nvim "+${l}" "${f}"
else
    exec nvim "${input}"
fi
