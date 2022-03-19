# shellcheck shell=bash
# shellcheck source=/dev/null
for f in "$LOCAL"/share/bash-completion/completions/*; do
  source "$f"
done
