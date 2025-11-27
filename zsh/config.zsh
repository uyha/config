is-tmux() {
  [[ -n "$TMUX" ]]
}

for f in "$HOME"/.config/zsh/conf.d/global/*.zsh; do
  source "$f"
done

if [[ $- == *i* ]]; then
  for f in "$HOME"/.config/zsh/conf.d/interactive/*.zsh; do
    source "$f"
  done

  autoload -Uz compinit
  compinit
fi
