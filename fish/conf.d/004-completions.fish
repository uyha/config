if ! status is-interactive;
  exit 0
end

if [ -d /home/linuxbrew/.linuxbrew/share/fish/vendor_completions.d ]
  for f in brew dasel exa fd git-cliff rg starship tldr;
    source "/home/linuxbrew/.linuxbrew/share/fish/vendor_completions.d/$f.fish"
  end
end
