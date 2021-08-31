export PATH+=:$HOME/.local/bin:$HOME/.cargo/bin:$HOME/.local/python/bin

export config=$HOME/.config
export local=$HOME/.local


exists() {
  command -v $1 &>/dev/null
  return $?
}

# Use `vim` as the man page viewr if it exists
exists vim && export MANPAGER='vim +Man!'

# Use `exa` instead of built-in `ls` if it exists
if command -v exa &>/dev/null; then
  alias ls="exa"
  alias la="ls -a"
  alias ll="ls -la"
fi

exists starship && eval "$(starship init bash)"

