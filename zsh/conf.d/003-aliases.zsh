if ! [[ $- == *i* ]]; then
  exit 0
fi

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
command -v fd &>/dev/null && alias fa="fd --no-ignore"
command -v explorer.exe &>/dev/null && alias explorer="explorer.exe"

if command -v git &>/dev/null; then
  alias g="git"
  alias pgit="GIT_SSH_COMMAND='ssh -i ~/.ssh/personal' git"
  alias wgit="GIT_SSH_COMMAND='ssh -i ~/.ssh/work' git"
fi
