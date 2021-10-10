config-nix(){
  local nix_share="$HOME/.nix-profile/share"

  local bash_comp="$nix_share/bash-completion/completions"
  if [[ -d "$bash_comp" ]]; then
    while IFS="<newline>" read config_file; do
      source "$config_file"
    done < <(find "$bash_comp" -type f,l)
  fi

  local fzf_comp="$nix_share/fzf/completion.bash"
  if [[ -e "$fzf_comp" ]]; then
    source "$fzf_comp"
  fi

  local fzf_key_bindings="$nix_share/fzf/key-bindings.bash"
  if [[ -e "$fzf_key_bindings" ]]; then
    source "$fzf_key_bindings"
  fi
}

config-nix

unset -f config-nix
