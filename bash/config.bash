export LOCAL=$HOME/.local
export LOCAL_OPT=$LOCAL/opt
export LOCAL_BIN=$LOCAL/bin
export LOCAL_SHARE=$LOCAL/share
export LOCAL_STATE=$LOCAL/state

export CONFIG=$HOME/.config

export XDG_CONFIG_HOME=$CONFIG
export XDG_DATA_HOME=$LOCAL_SHARE
export XDG_STATE_HOME=$LOCAL_STATE

export PATH+=:$LOCAL_BIN
for dir in $LOCAL_OPT/*/bin; do
  export PATH+=:$(realpath $dir)
done

export POETRY_HOME=$LOCAL_OPT/poetry
export RUSTUP_HOME=$LOCAL_OPT/rustup
export CARGO_HOME=$LOCAL_OPT/cargo
export INPUTRC=$CONFIG/bash/inputrc

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
  alias tree="ls --tree"
fi

exists thefuck && eval "$(thefuck --alias)"
exists starship && eval "$(starship init bash)"

if [[ -d $CONFIG/bash/config.d ]]; then
  # Remember original value of globstar
  if shopt globstar >/dev/null; then globstar_opt=s; else globstar_opt=u; fi
  shopt -s globstar

  for config_file in $CONFIG/bash/config.d/**; do
    [[ -f $config_file ]] && source $config_file
  done

  # Restore original value of globstar
  shopt -$globstar_opt globstar
fi

unset -f exists
