# shellcheck shell=bash
config-fzf() {
  if [[ -f /usr/share/doc/fzf/examples/key-bindings.bash ]]; then
    source /usr/share/doc/fzf/examples/key-bindings.bash
  fi
}

config-fzf

unset -f config-fzf
