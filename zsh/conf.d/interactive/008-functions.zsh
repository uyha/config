function is-wsl(){
  [[ "$(uname -a | perl -ne 'print lc')" =~ wsl ]]
}

is-wsl && function wsl-shutdown() {
  /mnt/c/Windows/System32/wsl.exe --shutdown
}
