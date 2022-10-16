if ! [[ -f /home/linuxbrew/.linuxbrew/bin/brew ]]; then
  return 0
fi

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
