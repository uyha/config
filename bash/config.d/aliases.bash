config-aliases() {
  if exists exa; then
    alias ls="exa"
    alias tree="ls --tree"
  fi
  alias la="ls -a"
  alias ll="ls -la"

  alias rm="rm -I"
  alias mv="rm -i"
  alias cp="rm -i"

  exists thefuck && eval "$(thefuck --alias)"
  exists explorer.exe && alias explorer="explorer.exe"
  exists nvim && alias vim="nvim"
}

config-aliases

unset -f config-aliases
