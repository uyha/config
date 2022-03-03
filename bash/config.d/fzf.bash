config-fzf() {
  local FZF_HOME=$HOME/.fzf
  local FZF_BIN=$FZF_HOME/bin
  local FZF_COMPLETION=$FZF_HOME/shell/completion.bash
  local FZF_KEY_BINDINGS=$FZF_HOME/shell/key-bindings.bash

  [[ -d $FZF_BIN ]] && PATH+=:$FZF_BIN
  [[ -f $FZF_COMPLETION ]] && source $FZF_COMPLETION
  [[ -f $FZF_KEY_BINDINGS ]] && source $FZF_KEY_BINDINGS
}

config-fzf

unset -f config-fzf
