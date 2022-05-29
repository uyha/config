# shellcheck shell=bash

options=(
  nullglob   # Prevent * glob becoming literal when none is match
  globstar   # Allow **
  histappend # When the shell exits, append to the history file instead of overwriting it
  direxpand  # Expand variable when using tab
)

shopt -s "${options[@]}"
