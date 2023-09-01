# Install a .deb package from a URL using apt
apt_install_deb() {
  url="$1"
  tmpdir=$(temp_dir)
  pushd "$tmpdir" || fail "cannot pushd"
  wget -O package.deb "$url"
  sudo apt-get -yf install ./package.deb
  popd || fail "cannot popd"
  rm -rf "$tmpdir"
}
