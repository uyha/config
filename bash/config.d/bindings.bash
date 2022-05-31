# shellcheck shell=bash
# shellcheck source=/dev/null

for completion_file in /usr/local/share/bash-binding/bindings/*.bash; do
  source "$completion_file"
done
