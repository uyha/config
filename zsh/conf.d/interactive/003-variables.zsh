if is-tmux; then
  return 0
fi

# zsh-autosuggestions
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)

export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=10000
export SAVEHIST=10000

if command -v nvim &>/dev/null; then
  export MANPAGER="nvim +Man!"
fi

# Catppuccin for fzf
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

if [[ -d "$XDG_DATA_HOME/zsh-completions" ]]; then
  export fpath=("$XDG_DATA_HOME/zsh-completions" $fpath)
fi

if [[ -d /var/lib/flatpak/exports/share ]]; then
  export XDG_DATA_DIRS="$XDG_DATA_DIRS:/var/lib/flatpak/exports/share"
fi

if [[ -d "$XDG_DATA_HOME/flatpak/exports/share" ]] ; then
  export XDG_DATA_DIRS="$XDG_DATA_DIRS:$XDG_DATA_HOME/flatpak/exports/share"
fi

