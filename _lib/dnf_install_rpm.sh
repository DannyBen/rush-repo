# Install an .rpm package from a URL using dnf
dnf_install_rpm() {
  url="$1"
  tmpdir=$(temp_dir)
  pushd "$tmpdir" || fail "cannot pushd"
  wget -O package.rpm "$url"
  sudo dnf -y install ./package.rpm
  popd || fail "cannot popd"
  rm -rf "$tmpdir"
}