# shellcheck shell=bash

# fzf
if command -v fzf &>/dev/null; then
  _ble_contrib_fzf_base="$(realpath $(dirname $(which fzf))/..)"
  ble-import -d contrib/fzf-completion
  ble-import -d contrib/fzf-key-bindings
fi

# History
bleopt history_share=yes
