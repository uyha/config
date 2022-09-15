if ! status is-interactive;
  exit 0
end

if [ -f /usr/local/share/fish-binding/fzf.fish ];
  source /usr/local/share/fish-binding/fzf.fish
  fzf_key_bindings
end
