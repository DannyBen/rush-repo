general_install_helper() {
  binary_name="$1"
  version_flag="${2:---version}"

  if [[ -z "$FORCE" ]] && command_exist "$binary_name"; then
    say "already installed (--force to install anyway)"
  else
    # prevent nested tools from being forced
    unset FORCE
    say "installing"
    install_function
    "$binary_name" "$version_flag"
    say "installation complete"
  fi
}
