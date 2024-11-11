if [[ -f "$HOMEBREW_PREFIX/opt/fzf/shell/key-bindings.zsh" ]]; then
  source "$HOMEBREW_PREFIX/opt/fzf/shell/key-bindings.zsh"
fi

bindkey -v

bindkey '^[[Z' reverse-menu-complete
bindkey '^f' autosuggest-accept
bindkey '^[[1~' vi-beginning-of-line
bindkey '^[[3~' vi-delete-char
bindkey '^[[4~' vi-end-of-line
bindkey '^A' vi-beginning-of-line
bindkey '^E' vi-end-of-line
