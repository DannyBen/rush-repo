package_uninstall() {
  package="$1"
  display_name="${2:-$1}"
  say "uninstalling $display_name"
  case "$DISTRO" in
    "ubuntu") sudo apt-get remove -y "$package" ;;
    "arch") sudo pacman -Rs --noconfirm "$package" || true ;;
  esac    
}
