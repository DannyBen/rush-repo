package_install() {
  say "installing $*"

  case "$DISTRO" in
    arch)          sudo pacman -S --noconfirm "$@" ;;
    debian|ubuntu) sudo apt-get install -y "$@" ;;
    fedora)        sudo dnf install -y "$@" ;;
    *)             fail "unsupported distro:$DISTRO"
  esac
}

package_uninstall() {
  say "uninstalling $*"

  case "$DISTRO" in
    arch)          sudo pacman -Rs --noconfirm "$@" || true ;;
    debian|ubuntu) sudo apt-get remove -y "$@" ;;
    fedora)        sudo dnf remove -y "$@" ;;
    *)             fail "unsupported distro:$DISTRO"
  esac
}
