setup-win32yank() {
  if exists win32yank.exe; then
    alias copy="win32yank.exe -i --crlf"
  fi
}

setup-win32yank

unset -f setup-win32yank
