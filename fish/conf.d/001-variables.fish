set -gx LOCAL $HOME/.local
set -gx CONFIG $HOME/.config

set -gx POETRY_HOME $LOCAL/opt/poetry
set -gx RUSTUP_HOME $LOCAL/opt/rustup
set -gx CARGO_HOME $LOCAL/opt/cargo

set -gx LANG en_US.UTF-8

set -gx XDG_CONFIG_HOME $CONFIG
set -gx XDG_DATA_HOME $LOCAL/share
set -gx XDG_STATE_HOME $LOCAL/state
set -gx XDG_CACHE_HOME $HOME/.cache

for dir in $LOCAL/bin $LOCAL/opt/*/bin; set -gx PATH $PATH $dir; end
if [ -d "$RUSTUP_HOME/toolchains/stable-x86_64-unknown-linux-gnu/bin" ];
  set -gx PATH "$RUSTUP_HOME/toolchains/stable-x86_64-unknown-linux-gnu/bin" $PATH
end

if command --query nvim; set -gx MANPAGER 'nvim +Man!'; end

if [ -f /home/linuxbrew/.linuxbrew/bin/brew ];
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
end

