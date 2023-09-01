discard() {
  say "uninstalling dependencies"
  for pack in "$@" ; do
    if [[ $pack =~ .*:.* ]]; then
      rush undo "$pack"
    else
      rush undo "$REPO:$pack"
    fi
  done
}