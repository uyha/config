exists() {
  command -v "$1" &>/dev/null
}

if exists eza; then
  alias ls="eza"
  alias tree="ls --tree"
fi

alias la="ls -a"
alias ll="ls -la"

alias rm="rm -I"
alias mv="mv -i"
alias cp="cp -i"

exists nvim && alias vim="nvim"
exists bat && alias cat="bat"
exists lazygit && alias lzg="lazygit"
exists fd && alias fa="fd --no-ignore --hidden"
exists explorer.exe && alias explorer="explorer.exe"
exists ssh && alias ussh="ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
exists scp && alias uscp="scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
exists btm && alias top="btm"
exists df && alias df="df -h"
exists xdg-open && alias open="xdg-open"

if exists rg; then
  alias rg="rg --smart-case"
  alias ra="rg --no-ignore --hidden"
fi

if exists exit; then
  alias :q="exit"
  alias :qa="exit"
fi

if exists rsync; then
  alias rsync="rsync --info=progress2 -tv"
  alias dsync="rsync --recursive --dirs"
  if exists ssh; then
    alias ursync="rsync --info=progress2 -v --rsh='ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'"
  fi
fi

if exists git; then
  alias g="git"
  alias pgit="GIT_SSH_COMMAND='ssh -i ~/.ssh/personal' git"
  alias wgit="GIT_SSH_COMMAND='ssh -i ~/.ssh/work' git"
fi

if exists dust; then
  alias du="dust"
  alias du1="du -d1"
fi

unfunction exists
