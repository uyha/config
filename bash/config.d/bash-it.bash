config-bash-it() {
  BASH_IT="$LOCAL_OPT/bash-it"
  BASH_IT_SCRIPT="$BASH_IT/bash_it.sh"
  if [[ -d "$BASH_IT" ]] && [[ -f "$BASH_IT_SCRIPT" ]]; then
    export BASH_IT="$BASH_IT"
    source "$BASH_IT_SCRIPT"
  fi
}

config-bash-it

unset -f config-bash-it
