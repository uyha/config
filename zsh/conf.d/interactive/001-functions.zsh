exists() {
  command -v "$1" &>/dev/null
}

is-wsl(){
  [[ "${$(uname -a):l}" =~ wsl ]]
}

exists docker && docker-nuke() {
  echo "This will stop all containers, remove all containers, images, and volumes"
  read "confirmed?Are you sure you want to continue (y/n)? "

  case "$confirmed" in
    y)
      ;;
    *)
      return
      ;;
  esac

  docker container ls -qa | xargs --no-run-if-empty docker container stop
  docker system prune --all --volumes --force
}

is-wsl && function wsl-shutdown() {
  /mnt/c/Windows/System32/wsl.exe --shutdown
}

free-swap() {
  sudo swapoff -a && sudo swapon -a
}
