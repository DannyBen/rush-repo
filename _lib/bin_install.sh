bin_install() {
  file="$1"
  say "copying $file to /user/local/bin"
  sudo chmod +x "$file"
  sudo cp "$file" /usr/local/bin/
}
