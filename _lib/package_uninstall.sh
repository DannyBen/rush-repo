package_uninstall() {
  say "uninstalling $*"

  case "$DISTRO" in
    arch)          sudo pacman -Rs --noconfirm "$@" || true ;;
    debian|ubuntu) sudo apt-get remove -y "$@" ;;
    fedora|cenros) sudo dnf remove -y "$@" ;;
    *)             fail "unsupported distro:$DISTRO"
  esac    
}
