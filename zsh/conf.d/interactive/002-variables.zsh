# zsh-autosuggestions
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)

export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=10000
export SAVEHIST=10000

[[ -d "$XDG_DATA_HOME/zsh-completions" ]] && export fpath=("$XDG_DATA_HOME/zsh-completions" $fpath)
