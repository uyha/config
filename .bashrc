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
export PATH+=:$LOCAL_OPT/python/bin
export PATH+=:$LOCAL_OPT/nodejs/bin
export PATH+=:$LOCAL_OPT/poetry/bin
export PATH+=:$LOCAL_OPT/cargo/bin
export PATH+=:$LOCAL_OPT/nvim/bin
export PATH+=:$LOCAL_OPT/fzf/bin

export POETRY_HOME=$LOCAL_OPT/poetry
export RUSTUP_HOME=$LOCAL_OPT/rustup
export CARGO_HOME=$LOCAL_OPT/cargo

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

local FZF_COMPLETION=$LOCAL_OPT/fzf/share/shell/completion.bash
local FZF_KEY_BINDINGS=$LOCAL_OPT/fzf/share/shell/key-bindings.bash
[[ -f $FZF_COMPLETION ]] && source $FZF_COMPLETION
[[ -f $FZF_KEY_BINDINGS ]] && source $FZF_KEY_BINDINGS

exists thefuck && eval "$(thefuck --alias)"
exists starship && eval "$(starship init bash)"

unset -f exists
