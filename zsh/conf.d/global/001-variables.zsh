export LOCAL="$HOME/.local"
export CONFIG="$HOME/.config"

export LANG=en_US.UTF-8

export XDG_CONFIG_HOME="$CONFIG"
export XDG_DATA_HOME="$LOCAL/share"
export XDG_STATE_HOME="$LOCAL/state"
export XDG_CACHE_HOME="$HOME/.cache"

if command -v nvim &>/dev/null; then
  export MANPAGE="nvim +Man!"
fi

# zsh-autosuggestions
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)

if [[ -d "$LOCAL/bin" ]]; then
  export PATH="$LOCAL/bin:$PATH"
fi
