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
exists bat && alias cat="bat"
exists lazygit && alias lzg="lazygit"
exists fdfind && alias fd="fdfind"

if exists git; then
  alias pgit="GIT_SSH_COMMAND='ssh -i ~/.ssh/personal' git"
  alias wgit="GIT_SSH_COMMAND='ssh -i ~/.ssh/work' git"
fi
