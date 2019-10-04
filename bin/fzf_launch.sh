#!/usr/bin/env bash
PATH=~/.bin/:$PATH
CMD=$(echo -n "$PATH" | \
  xargs -d: -I{} -r -- \
  find -L {} -maxdepth 1 -mindepth 1 -type f -executable -printf '%P\n' \
  2>/dev/null | \
  sort -u | \
  fzf --reverse --border --color=bw)

# I've tried this, and `$CMD & disown`. Same result.
# $CMD & disown
nohup $CMD &> /dev/null &
sleep 1
# $CMD &
# PID=$!
# disown $PID
# exit $PID
