if ! status is-interactive;
  exit 0
end

set vendor_completions "$HOMEBREW_PREFIX/share/fish/vendor_completions.d"

if [ -d "$vendor_completions" ]
  for f in brew dasel exa fd git-cliff rg starship tldr;
    set comp_file "$vendor_completions/$f.fish"
    [ -f "$comp_file" ] && source "$comp_file"
  end
end

set --erase vendor_completions comp_file
