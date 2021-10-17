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

export POETRY_HOME=$LOCAL_OPT/poetry
export RUSTUP_HOME=$LOCAL_OPT/rustup
export CARGO_HOME=$LOCAL_OPT/cargo
export INPUTRC=$CONFIG/inputrc

export LOCALE_ARCHIVE=/usr/lib/locale/locale-archive
export LANG=en_US.UTF-8

shopt -s globstar direxpand

while IFS="<newline>" read dir; do
  export PATH="$dir:$PATH"
done < <(find $LOCAL_OPT -maxdepth 2 -mindepth 2 -type d -wholename '*/bin' -exec realpath {} \;)


if [[ -d $CONFIG/bash/config.d ]]; then
  while IFS="<newline>" read config_file; do
    [[ -f $config_file ]] && source $config_file
  done < <(find $CONFIG/bash/config.d -type f -name '*.bash')
fi

if exists tmux && [[ "$-" =~ i ]] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [[ -z "$TMUX" ]]; then
 exec tmux
fi

# Use `nvim` as the man page viewr if it exists
exists nvim && export MANPAGER='nvim +Man!'
exists starship && eval "$(starship init bash)"

unset -f exists
unset nix_profile

