#shellcheck shell=bash

if [[ -d "$LOCAL/opt/cargo/bin" ]]; then
  export PATH="$PATH:$LOCAL/opt/cargo/bin"
fi
