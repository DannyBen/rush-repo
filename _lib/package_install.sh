package_install() {
  say "installing $*"
  
  case "$DISTRO" in
    "ubuntu") sudo apt-get install -y "$@" ;;
    "arch") sudo pacman -S --noconfirm "$@" ;;
  esac    
}
