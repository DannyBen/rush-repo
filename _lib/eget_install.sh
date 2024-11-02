eget_install() {
  package="$1"
  shift
  say "installing $package"
  command_exist eget || needs eget
  sudo eget --upgrade-only --to=/usr/local/bin "$package" "$@"
}