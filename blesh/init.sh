# shellcheck shell=bash

# fzf
_ble_contrib_fzf_base="$(which fzf)"
ble-import -d contrib/fzf-completion
ble-import -d contrib/fzf-key-bindings

# History
bleopt history_share=yes
