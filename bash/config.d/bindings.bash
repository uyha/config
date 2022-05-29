# shellcheck shell=bash
# shellcheck source=/dev/null

for completion_file in /usr/local/share/bindings/*.bash; do
  source "$completion_file"
done
