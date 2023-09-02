package_install() {
  say "installing $*"
  
  case "$DISTRO" in
    arch)          sudo pacman -S --noconfirm "$@" ;;
    debian|ubuntu) sudo apt-get install -y "$@" ;;
    fedora)        sudo dnf install -y "$@" ;;
    *)             fail "unsupported distro:$DISTRO"
  esac    
}
