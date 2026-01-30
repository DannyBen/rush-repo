remove_completions() {
  say "removing completions"
  rm -f ~/.local/share/bash-completion/completions/"$1"
}