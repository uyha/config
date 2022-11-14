if command -v exa &>/dev/null; then
  alias ls="exa"
  alias tree="ls --tree"
fi

alias la="ls -a"
alias ll="ls -la"

alias rm="rm -I"
alias mv="mv -i"
alias cp="cp -i"

command -v nvim &>/dev/null && alias vim="nvim"
command -v bat &>/dev/null && alias cat="bat"
command -v lazygit &>/dev/null && alias lzg="lazygit"
command -v fd &>/dev/null && alias fa="fd --no-ignore --hidden"
command -v explorer.exe &>/dev/null && alias explorer="explorer.exe"
command -v ssh &>/dev/null && alias unsafe-ssh="ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
command -v scp &>/dev/null && alias unsafe-scp="scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"

if command -v git &>/dev/null; then
  alias g="git"
  alias pgit="GIT_SSH_COMMAND='ssh -i ~/.ssh/personal' git"
  alias wgit="GIT_SSH_COMMAND='ssh -i ~/.ssh/work' git"
fi
