uninstall_bin() {
  package="$1"
  say "uninstalling $package"
  sudo rm -f "/usr/local/bin/$package"
}
