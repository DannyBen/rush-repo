# Install a .deb package from a URL using apt
apt_install_deb() {
  url="$1"
  tmpdir=$(temp_dir)
  pushd "$tmpdir"
  wget -O package.deb "$url"
  sudo apt-get -yf install ./package.deb
  popd
  rm -rf "$tmpdir"
}
