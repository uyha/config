# shellcheck shell=bash
# shellcheck source=/dev/null

if [[ "$-" == *i* ]]; then
  for completion_file in /usr/local/share/bash-completion/completions/*.bash; do
    source "$completion_file"
  done

  if [[ -f /usr/share/bash-completion/bash_completion ]]; then
    source /usr/share/bash-completion/bash_completion
  fi
fi
