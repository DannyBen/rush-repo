# Uninstall man page
man_uninstall() {
  file="$1"
  dir="${2:-man1}"
  say "uninstalling man page"
  sudo rm -f "/usr/local/share/man/$dir/$file"

  if command_exist makewhatis ; then
    sudo makewhatis /usr/local/man
  fi
}
