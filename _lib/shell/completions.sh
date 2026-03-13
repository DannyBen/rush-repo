copy_completions() {
  say "copying completions"
  mkdir -p ~/.local/share/bash-completion/completions
  cp "$1" ~/.local/share/bash-completion/completions/"$2"
}

remove_completions() {
  say "removing completions"
  rm -f ~/.local/share/bash-completion/completions/"$1"
}
