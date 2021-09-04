config-aliases() {
  if exists exa; then
    alias ls="exa"
    alias la="ls -a"
    alias ll="ls -la"
    alias tree="ls --tree"
  fi

  exists thefuck && eval "$(thefuck --alias)"
  exists explorer.exe && alias explorer="explorer.exe"
  exists clip.exe && alias clip="clip.exe"
}

config-aliases

unset -f config-aliases
