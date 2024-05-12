zstyle ':completion:*' menu yes select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*' # Allow case insensitive matching

setopt share_history
setopt hist_ignore_all_dups
setopt auto_cd
setopt null_glob
