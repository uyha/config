if ! [[ -f /home/linuxbrew/.linuxbrew/bin/brew ]] || is-tmux; then
  return 0
fi

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

extra_bins=(
	"$HOMEBREW_PREFIX/opt/clang-format/bin"
)

for extra in "${extra_bins[@]}"; do
  if [[ -d "$extra" ]]; then
    export PATH="$extra:$PATH"
  fi
done
