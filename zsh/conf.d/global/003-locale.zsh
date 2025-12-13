declare -A locales
locales["ubuntu-20.04"]=en_US.UTF-8
locales["ubuntu-24.04"]=en_US.UTF-8

distro=
if [[ "$(lsb_release -d)" =~ Ubuntu ]]; then
  distro=ubuntu
fi
distro_version="$(lsb_release -r | awk '{print $2}' | xargs)"

if [[ -n "${locales["$distro-$distro_version"]}" ]]; then
  export LC_ALL="${locales["$distro-$distro_version"]}"
fi
