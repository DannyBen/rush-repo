command_exist() {
  [[ -x "$(command -v "$1")" ]]
}
