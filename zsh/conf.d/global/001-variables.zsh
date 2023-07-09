export LOCAL="$HOME/.local"
export CONFIG="$HOME/.config"

export LC_ALL=en_US.UTF-8

export XDG_CONFIG_HOME="$CONFIG"
export XDG_DATA_HOME="$LOCAL/share"
export XDG_STATE_HOME="$LOCAL/state"
export XDG_CACHE_HOME="$HOME/.cache"

export CARGO_HOME="$HOME/.cargo"
export RUSTUP_HOME="$HOME/.rustup"

[[ -d "$LOCAL/bin" ]] && export PATH="$LOCAL/bin:$PATH"
[[ -d "$LOCAL/share/nvim/mason/bin" ]] && export PATH="$LOCAL/share/nvim/mason/bin:$PATH"
[[ -d "$CARGO_HOME/bin" ]] && export PATH="$CARGO_HOME/bin:$PATH"
