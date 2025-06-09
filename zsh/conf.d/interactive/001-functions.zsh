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

add() (
  if ! [[ $# -eq 2 ]]; then
    echo "Expecting exactly 2 arguments" >&2
    return 22
  fi

  manager=$1
  program=$2

  set -euo pipefail

  case "$manager" in
    apt)
      list_file=$HOME/.local/share/personal/apt/programs
      sudo apt install "$program"
      ;;
    brew)
      list_file=$HOME/.local/share/personal/brew/programs
      brew install "$program"
      ;;
    flatpak)
      list_file=$HOME/.local/share/personal/flatpak/programs
      flatpak install --app "$program"
      ;;
    *)
      printf "%s is not supported\n" "$manager"
      exit 1
      ;;
  esac

  echo "$program" >> "$list_file"
  sort --unique --output "$list_file" "$list_file"
)

remove() (
  if ! [[ $# -eq 2 ]]; then
    echo "Expecting exactly 2 arguments" >&2
    return 22
  fi

  manager=$1
  program=$2

  set -euo pipefail

  case "$manager" in
    apt)
      list_file=$HOME/.local/share/personal/apt/programs
      sudo apt remove "$program"
      ;;
    brew)
      list_file=$HOME/.local/share/personal/brew/programs
      brew uninstall "$program"
      ;;
    flatpak)
      list_file=$HOME/.local/share/personal/flatpak/programs
      flatpak uninstall --app "$program"
      ;;
    *)
      printf "%s is not supported\n" "$manager"
      exit 1
      ;;
  esac

  perl -i -ne "print unless /$program/" "$list_file"
)
