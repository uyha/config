if ! status is-interactive;
  exit 0
end

if command --query exa;
  alias ls="exa"
  alias tree="ls --tree"
end


alias la="ls -a"
alias ll="ls -la"

alias rm="rm -I"
alias mv="mv -i"
alias cp="cp -i"

alias g="git"

command --query nvim && alias vim="nvim"
command --query bat && alias cat="bat"
command --query lazygit && alias lzg="lazygit"
command --query fd && alias fa="fd --no-ignore"
command --query explorer.exe && alias explorer="explorer.exe"

if command --query git;
  alias pgit="GIT_SSH_COMMAND='ssh -i ~/.ssh/personal' git"
  alias wgit="GIT_SSH_COMMAND='ssh -i ~/.ssh/work' git"
end
