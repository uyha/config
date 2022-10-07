if ! status is-interactive
  exit 0
end

if command --query starship; starship init fish | source; end

if command --query tmux && [ "$TERM" != screen ] && [ "$TERM" != tmux ] && [ -z "$TMUX" ];
  exec tmux
end
