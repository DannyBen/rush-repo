# Uninstall man page
man_uninstall() {
  file="$1"
  say "uninstalling man page"
  sudo rm -f "/usr/local/share/man/man1/$file"
  sudo makewhatis /usr/local/man
}
