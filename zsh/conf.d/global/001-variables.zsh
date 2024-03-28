if is-tmux; then
	return 0
fi

export LOCAL="$HOME/.local"
export CONFIG="$HOME/.config"

export LC_ALL=en_US.UTF-8

export XDG_CONFIG_HOME="$CONFIG"
export XDG_DATA_HOME="$LOCAL/share"
export XDG_STATE_HOME="$LOCAL/state"
export XDG_CACHE_HOME="$HOME/.cache"

export CARGO_HOME="$HOME/.cargo"
export RUSTUP_HOME="$HOME/.rustup"

extra_bins=(
	"$LOCAL/bin"
	"$LOCAL/share/nvim/mason/bin"
	"$CARGO_HOME/bin"
)

for extra in "${extra_bins[@]}"; do
  if [[ -d "$extra" ]]; then
    export PATH="$extra:$PATH"
  fi
done
