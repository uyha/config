# shellcheck shell=bash
starship-precmd() {
  history -a
  history -c
  history -r
}
export starship_precmd_user_func=starship-precmd
