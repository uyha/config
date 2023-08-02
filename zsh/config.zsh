is-tmux() {
  [[ -n "$TMUX" ]]
}

for f in "$HOME"/.config/zsh/conf.d/global/*; do
  source "$f"
done

if [[ $- == *i* ]]; then
  for f in "$HOME"/.config/zsh/conf.d/interactive/*; do
    source "$f"
  done
fi
