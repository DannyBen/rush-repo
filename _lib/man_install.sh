# Install man page
man_install() {
  file="$1"
  target="${2:-man1}"
  say "installing man page"
  sudo mkdir -p "/usr/local/share/man/$target"
  sudo cp "$file" "/usr/local/share/man/$target/"
  sudo makewhatis /usr/local/man
}
