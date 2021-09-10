add-local-opt-to-path() {
  for dir in $LOCAL_OPT/*/bin; do
    export PATH+=:$(realpath $dir)
  done
}

exists() {
  command -v $1 &>/dev/null
  return $?
}

# Environment variables
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
add-local-opt-to-path

export POETRY_HOME=$LOCAL_OPT/poetry
export RUSTUP_HOME=$LOCAL_OPT/rustup
export CARGO_HOME=$LOCAL_OPT/cargo
export INPUTRC=$CONFIG/bash/inputrc

shopt -s globstar direxpand

# Use `vim` as the man page viewr if it exists
exists vim && export MANPAGER='vim +Man!'
exists starship && eval "$(starship init bash)"

if [[ -d $CONFIG/bash/config.d ]]; then
  for config_file in $CONFIG/bash/config.d/**; do
    [[ -f $config_file ]] && source $config_file
  done
fi

unset -f exists
