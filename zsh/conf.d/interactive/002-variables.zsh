# zsh-autosuggestions
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)

export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=10000
export SAVEHIST=10000

# Catppuccin for fzf
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

[[ -d "$XDG_DATA_HOME/zsh-completions" ]] && export fpath=("$XDG_DATA_HOME/zsh-completions" $fpath)
