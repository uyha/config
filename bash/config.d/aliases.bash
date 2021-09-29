config-aliases() {
  if exists exa; then
    alias ls="exa"
    alias tree="ls --tree"
  fi
  alias la="ls -a"
  alias ll="ls -la"

  exists thefuck && eval "$(thefuck --alias)"
  exists explorer.exe && alias explorer="explorer.exe"
}

config-aliases

unset -f config-aliases
