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

cprev() {
  git rev-parse @ | tr -d '\n' | xclip -selection clipboard
}

c2f() {
  if ! [[ $# -eq 1 ]]; then
    echo "Expecting exactly 1 number" >&2
    return 22
  fi

  if ! [[ $1 =~ ^[+-]?[0-9]*\.?[0-9]+$ ]]; then
    echo "$1 is not a number" >&2
    return 22
  fi

  echo $(($1 * 1.8 + 32))
}

f2c() {
  if ! [[ $# -eq 1 ]]; then
    echo "Expecting exactly 1 number" >&2
    return 22
  fi

  if ! [[ $1 =~ ^[+-]?[0-9]*\.?[0-9]+$ ]]; then
    echo "$1 is not a number" >&2
    return 22
  fi

  echo $((($1 - 32) / 1.8 ))
}
