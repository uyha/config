config-dircolors() {
  local DIRCOLORS=$LOCAL_OPT/dircolors-solarized/dircolors.ansi-dark
  [[ -f $DIRCOLORS ]] && eval "$(dircolors $DIRCOLORS)"
}

config-dircolors

unset -f config-dircolors
