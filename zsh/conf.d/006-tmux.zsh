if ! [[ $- == *i* ]]; then 
  exit 0
fi

if command -v tmux &>/dev/null && [[ "$TERM" != screen ]] && [[ "$TERM" != tmux ]] && [[ -z "$TMUX" ]]; then
  exec tmux
fi
