config-fzf() {
  local FZF_COMPLETION=$LOCAL_OPT/fzf/share/shell/completion.bash
  local FZF_KEY_BINDINGS=$LOCAL_OPT/fzf/share/shell/key-bindings.bash
  [[ -f $FZF_COMPLETION ]] && source $FZF_COMPLETION
  [[ -f $FZF_KEY_BINDINGS ]] && source $FZF_KEY_BINDINGS
}

config-fzf

unset -f config-fzf
