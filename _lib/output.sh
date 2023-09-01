# Output functions
say() {
  printf "%-20s | %s\n" "$(cyan "$(basename "$PWD")")" "$*"
}

attention() {
  printf "%-20s | %s\n" "$(cyan "$(basename "$PWD")")" "$(green "$*")"
}

warning() {
  printf "%-20s | %s\n" "$(cyan "$(basename "$PWD")")" "$(red "$*")"
}

fail() {
  warning "$*"
  return 1
}
