if ! [[ -f "$HOMEBREW_PREFIX/opt/zinit/zinit.zsh" ]]; then
  return 0
fi

export ZINIT_HOME="$HOMEBREW_PREFIX/opt/zinit"
source "$ZINIT_HOME/zinit.zsh"

zinit ice wait lucid
zinit load "Aloxaf/fzf-tab"

zinit ice wait lucid
zinit load "zsh-users/zsh-autosuggestions"

zinit ice wait lucid
zinit load "zsh-users/zsh-syntax-highlighting"

zinit for atload"zicompinit; zicdreplay" blockf lucid wait "zsh-users/zsh-completions"
