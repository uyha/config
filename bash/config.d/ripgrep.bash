config-ripgrep() {
  local RG_COMPLETION=$LOCAL_OPT/ripgrep/share/autocomplete/rg.bash
  [[ -f $RG_COMPLETION ]] && source $RG_COMPLETION
}

config-ripgrep

unset -f config-ripgrep
