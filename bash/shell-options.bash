# shellcheck shell=bash

# Prevent * glob becoming literal when none is match
shopt -s nullglob

# Allow **
shopt -s globstar

# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend
