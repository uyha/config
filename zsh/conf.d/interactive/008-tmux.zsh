if command -v tmux &>/dev/null &&
  [[ "$TERM" != screen ]] &&
  [[ "$TERM" != tmux ]] &&
  [[ -z "$SSH_CLIENT" ]] &&
  [[ -z "$SSH_TTY" ]] &&
  [[ -z "$TMUX" ]]; then
  exec tmux
fi
