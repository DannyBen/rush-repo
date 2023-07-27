is_installed() {
  local cmd=$1
  local version_flag=${2:---version}
  hash $cmd 2> /dev/null && $cmd $version_flag 2>&1 | grep "$version" > /dev/null 2>&1
}
