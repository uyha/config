config-fd() {
  local FD_COMPLETION=$LOCAL_OPT/fd/share/autocomplete/fd.bash-completion
  [[ -f $FD_COMPLETION ]] && source $FD_COMPLETION
}

config-fd

unset -f config-fd
