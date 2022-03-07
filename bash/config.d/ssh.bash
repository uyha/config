# shellcheck shell=bash
(
  eval "$(ssh-agent)"
  ssh-add "$HOME/.ssh/id_rsa"
  ssh-add "$HOME/.ssh/work"
) >/dev/null
