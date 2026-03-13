is_installed() {
  local cmd=$1
  local version_flag=${2:---version}
  local expected_version=${3}

  hash "$cmd" 2> /dev/null && "$cmd" "$version_flag" 2>&1 | grep "$expected_version" > /dev/null 2>&1
}
