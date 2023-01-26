exists() {
  command -v "$1" &>/dev/null
}

if exists exa; then
  alias ls="exa"
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
exists ssh && alias unsafe-ssh="ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
exists scp && alias unsafe-scp="scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
exists dust && alias du="dust"
exists btm && alias top="btm"
exists df && alias df="df -h"
exists xdg-open && alias open="xdg-open"

if exists git; then
  alias g="git"
  alias pgit="GIT_SSH_COMMAND='ssh -i ~/.ssh/personal' git"
  alias wgit="GIT_SSH_COMMAND='ssh -i ~/.ssh/work' git"
fi

unfunction exists
