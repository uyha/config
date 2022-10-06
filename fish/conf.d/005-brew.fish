if ! status is-interactive || ! command -q brew;
  exit 0
end

if [ -f "$(brew --prefix)/opt/fzf/shell/key-bindings.fish" ]
  source "$(brew --prefix)/opt/fzf/shell/key-bindings.fish"
  fzf_key_bindings
end
