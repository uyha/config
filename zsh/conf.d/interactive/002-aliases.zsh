if exists eza; then
  alias ls="eza --git --icons=always"
  alias tree="ls --tree"
  alias trea="ls --tree -a"
fi

alias la="ls -a"
alias ll="ls -la"

alias rm="rm -I"
alias mv="mv -i"
alias cp="cp -i"

if exists nvim; then alias vim="nvim"; fi
if exists lazygit; then alias lzg="lazygit"; fi
if exists fd; then alias fa="fd --no-ignore --hidden"; fi
if exists explorer.exe; then alias explorer="explorer.exe"; fi
if exists ssh; then alias ussh="ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"; fi
if exists scp; then alias uscp="scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"; fi
if exists btm; then alias top="btm"; fi
if exists df; then alias df="df -h"; fi
if exists xdg-open; then alias open="xdg-open"; fi
if exists just; then alias j="just"; fi
if exists watchexec; then alias we="watchexec"; fi
if exists bc; then alias bc="bc -l"; fi
if exists xclip; then alias xclip="xclip -selection clipboard"; fi

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

if is-tmux; then
  alias clear="clear -T tmux-256color"
fi
