{
  eval "$(ssh-agent -s)" 
  [[ -f "$HOME/.ssh/work" ]] && ssh-add "$HOME/.ssh/work"
  [[ -f "$HOME/.ssh/personal" ]] && ssh-add "$HOME/.ssh/personal"
} &> /dev/null
