bin_uninstall() {
  package="$1"
  say "uninstalling $package"
  sudo rm -f "/usr/local/bin/$package"
}
