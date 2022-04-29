# shellcheck shell=bash
if exists exa; then
  alias ls="exa --icons"
  alias tree="ls --tree"
fi
alias la="ls -a"
alias ll="ls -la"

alias rm="rm -I"
alias mv="mv -i"
alias cp="cp -i"

alias gim="vim +0G"

exists thefuck && eval "$(thefuck --alias)"
exists explorer.exe && alias explorer="explorer.exe"
exists nvim && alias vim="nvim"
