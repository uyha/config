# shellcheck shell=bash source=/dev/null
# shellcheck disable=SC2038

exists() {
  command -v "$1" &>/dev/null
  return $?
}

# Prevent * glob becoming literal when none is match
shopt -s nullglob

# Allow **
shopt -s globstar

# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend

if [[ -d $CONFIG/bash/config.d ]]; then
  for config_file in "$CONFIG/bash/config.d"/*.bash; do
    source "$config_file"
  done
fi

unset -f exists
