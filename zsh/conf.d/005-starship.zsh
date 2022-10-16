if ! [[ $- == *i* ]]; then
  exit 0
fi

if command -v starship >/dev/null; then
  eval "$(starship init zsh)"
fi
