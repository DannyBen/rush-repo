# Uninstall man page
man_uninstall() {
  file="$1"
  dir="${2:-man1}"
  say "uninstalling man page"
  sudo rm -f "/usr/local/share/man/$dir/$file"
  sudo makewhatis /usr/local/man
}
