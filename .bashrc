export PATH+=:$HOME/.local/bin
export PATH+=:$HOME/.cargo/bin
export PATH+=:$HOME/.local/python/bin
export PATH+=:/opt/nodejs/bin
export PATH+=:/opt/poetry/bin

export config=$HOME/.config
export local=$HOME/.local


exists() {
  command -v $1 &>/dev/null
  return $?
}

# Use `vim` as the man page viewr if it exists
exists vim && export MANPAGER='vim +Man!'

# Use `exa` instead of built-in `ls` if it exists
if exists exa; then
  alias ls="exa"
  alias la="ls -a"
  alias ll="ls -la"
fi

exists starship && eval "$(starship init bash)"

