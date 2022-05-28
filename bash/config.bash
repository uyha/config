# shellcheck shell=bash source=/dev/null
# shellcheck disable=SC2038

exists() {
  command -v "$1" &>/dev/null
  return $?
}

source "$HOME/.config/bash/env-var.bash"
source "$HOME/.config/bash/shell-options.bash"


if [[ -d $HOME/.config/bash/config.d ]]; then
  for config_file in "$HOME/.config/bash/config.d"/*.bash; do
    source "$config_file"
  done
fi

unset -f exists
