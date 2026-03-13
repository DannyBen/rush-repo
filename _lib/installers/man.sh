# Install man page
man_install() {
  file="$1"
  target="${2:-man1}"
  say "installing man page"
  sudo mkdir -p "/usr/local/share/man/$target"
  sudo cp "$file" "/usr/local/share/man/$target/"

  if command_exist makewhatis ; then
    sudo makewhatis /usr/local/man
  fi
}

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
