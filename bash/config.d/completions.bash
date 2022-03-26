# shellcheck shell=bash
# shellcheck source=/dev/null

completions=$(
  shopt -s nullglob
  echo "$LOCAL"/share/bash-completion/completions/*
)
if [[ -n "$completions" ]]; then
  for f in "$LOCAL"/share/bash-completion/completions/*; do
    source "$f"
  done
fi
