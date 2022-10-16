if ! [[ -f /home/linuxbrew/.linuxbrew/bin/brew ]]; then
  exit 0
fi

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

if ! [[ $- == *i* ]]; then
  exit 0
fi

completions=()

