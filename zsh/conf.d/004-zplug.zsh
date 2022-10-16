if ! [[ $- == *i* && -d "$HOMEBREW_PREFIX/opt/zplug" ]]; then
  exit 0
fi

export ZPLUG_HOME="$HOMEBREW_PREFIX/opt/zplug"
source "$ZPLUG_HOME/init.zsh"

zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-completions"

zplug load
