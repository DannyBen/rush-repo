# Get a standardized tmp dir
temp_dir() {
  mktemp -d -t rush-XXX
}

# Use `pushtmp` to start working in a temp dir, then `popd`
pushtmp() {
  pushd "$(temp_dir)" || fail 'cannot pushd'
}
