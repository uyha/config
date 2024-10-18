if [[ -f "$HOMEBREW_PREFIX/opt/fzf/shell/key-bindings.zsh" ]]; then
  source "$HOMEBREW_PREFIX/opt/fzf/shell/key-bindings.zsh"
fi

bindkey -v
bindkey -r '^['
bindkey -M viins '^a' vi-cmd-mode
bindkey -M vicmd '^a' vi-insert

bindkey '^[[Z' reverse-menu-complete
bindkey '^f' autosuggest-accept
