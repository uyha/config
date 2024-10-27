if [[ -f "$HOMEBREW_PREFIX/opt/fzf/shell/key-bindings.zsh" ]]; then
  source "$HOMEBREW_PREFIX/opt/fzf/shell/key-bindings.zsh"
fi

bindkey -v

bindkey '^[[Z' reverse-menu-complete
bindkey '^f' autosuggest-accept
