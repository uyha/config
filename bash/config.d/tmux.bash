# shellcheck shell=bash

if exists tmux &&
  [[ "$-" =~ i ]] &&
  [[ ! "$TERM" =~ screen ]] &&
  [[ ! "$TERM" =~ tmux ]] &&
  [[ -z "$TMUX" ]]; then
  exec tmux
fi
