needs() {
  say "installing dependencies"
  for pack in "$@" ; do
    if [[ $pack =~ .*:.* ]]; then
      rush get "$pack" --clone
    else
      rush get "$REPO:$pack"
    fi
  done
}
