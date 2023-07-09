is-tmux() {
  [[ -n "$TMUX" ]] && [[ "$TERM" == tmux* ]]
}

for f in "$HOME"/.config/zsh/conf.d/global/*; do
  source "$f"
done

if [[ $- == *i* ]]; then
  for f in "$HOME"/.config/zsh/conf.d/interactive/*; do
    source "$f"
  done
fi
