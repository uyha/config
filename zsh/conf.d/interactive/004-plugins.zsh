add-plugin() {
  url=$1
  name=$(basename "$url")
  dir=$XDG_DATA_HOME/zsh-plugins/$name

  if ! [[ -d "$dir" ]]; then
    git clone "$url" "$dir"
  fi
}

add-plugin "https://github.com/Aloxaf/fzf-tab"
add-plugin "https://github.com/zsh-users/zsh-autosuggestions"
add-plugin "https://github.com/zsh-users/zsh-syntax-highlighting"
add-plugin "https://github.com/zsh-users/zsh-completions"
add-plugin "https://github.com/jeffreytse/zsh-vi-mode"

for script in $XDG_DATA_HOME/zsh-plugins/*/*.plugin.zsh; do
  source "$script"
done
