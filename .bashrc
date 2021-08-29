export PATH+=:$HOME/.local/bin:$HOME/.cargo/bin:$HOME/.local/python/bin

export config=$HOME/.config
export local=$HOME/.local

# Use `vim` as the man page viewr if it exists
if command -v vim &> /dev/null; then
  export MANPAGER='vim +Man!'
fi

# Use `exa` instead of built-in `ls` if it exists
if command -v exa &> /dev/null; then
  alias ls="exa"
  alias la="ls -a"
  alias ll="ls -la"
fi

eval "$(starship init bash)"
