if command -v tmux &>/dev/null && [[ "$TERM" != screen ]] && [[ "$TERM" != tmux ]] && [[ -z "$TMUX" ]]; then
  exec tmux
fi
