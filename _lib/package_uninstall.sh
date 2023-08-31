package_uninstall() {
  say "uninstalling $*"

  case "$DISTRO" in
    "ubuntu") sudo apt-get remove -y "$@" ;;
    "arch") sudo pacman -Rs --noconfirm "$@" || true ;;
  esac    
}
