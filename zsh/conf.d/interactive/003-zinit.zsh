if ! [[ -f "$HOMEBREW_PREFIX/opt/zinit/zinit.zsh" ]]; then
  return 0
fi

declare -A ZINIT
export ZINIT[HOME_DIR]="$HOMEBREW_PREFIX/opt/zinit"
export ZINIT[MAN_DIR]="${ZINIT[HOME_DIR]}/share/man"
source "${ZINIT[HOME_DIR]}/zinit.zsh"

zinit ice wait lucid
zinit load "Aloxaf/fzf-tab"

zinit ice wait lucid
zinit load "zsh-users/zsh-autosuggestions"

zinit ice wait lucid
zinit load "zsh-users/zsh-syntax-highlighting"

zinit for atload"zicompinit; zicdreplay" blockf lucid wait "zsh-users/zsh-completions"
