github_install_helper() {
  binary_name="$1"
  github_repo="$2"
  version_flag="${3:---version}"
  version="$4"

  if [[ -n "$version" ]]; then
    attention "forcing version $version"
  else
    say "identifying latest version for $github_repo"
    version=$(get_github_release_version "$github_repo")
    say "latest version is $version"
  fi

  if [[ -z "$FORCE" ]] && is_installed "$binary_name" "$version_flag" "$version"; then
    say "$binary_name is already at the latest version"
  else
    # prevent nested tools from being forced
    unset FORCE
    say "installing $binary_name"
    install_function
    "$binary_name" "$version_flag"
    say "$binary_name installation complete"
  fi
}

get_github_release_version() {
  curl -s "https://api.github.com/repos/$1/releases/latest" | grep "tag_name" | cut -d : -f 2,3 | tr -d \"\ ,v
}
