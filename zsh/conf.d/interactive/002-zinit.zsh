if ! [[ -f "$HOMEBREW_PREFIX/opt/zinit/zinit.zsh" ]]; then
  return 0
fi

export ZINIT_HOME="$HOMEBREW_PREFIX/opt/zinit"
source "$ZINIT_HOME/zinit.zsh"

zinit load "zsh-users/zsh-autosuggestions"
zinit load "zsh-users/zsh-syntax-highlighting"
zinit load "zsh-users/zsh-completions"

