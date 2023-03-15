zstyle ':completion:*' menu yes select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*' # Allow case insensitive matching

setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt AUTO_CD
