set -e

# Color functions
red() { printf "\e[31m%b\e[0m\n" "$*"; }
green() { printf "\e[32m%b\e[0m\n" "$*"; }
yellow() { printf "\e[33m%b\e[0m\n" "$*"; }
blue() { printf "\e[34m%b\e[0m\n" "$*"; }
magenta() { printf "\e[35m%b\e[0m\n" "$*"; }
cyan() { printf "\e[36m%b\e[0m\n" "$*"; }
bold() { printf "\e[1m%b\e[0m\n" "$*"; }
underlined() { printf "\e[4m%b\e[0m\n" "$*"; }

# Output functions
say() { printf "%-20s | %s\n" "$(cyan $(basename $PWD))" "$*"; }
attention() { printf "%-20s | %s\n" "$(cyan $(basename $PWD))" "$(green "$*")"; }
warning() { printf "%-20s | %s\n" "$(cyan $(basename $PWD))" "$(red "$*")"; }

# Utility functions
get_github_release_version() {
  curl -s https://api.github.com/repos/$1/releases/latest | grep "tag_name" | cut -d : -f 2,3 | tr -d \"\ ,v
}

is_installed() {
  local cmd=$1
  local version_flag=${2:---version}
  hash $cmd 2> /dev/null && $cmd $version_flag 2>&1 | grep "$version" > /dev/null 2>&1
}

command_exist() {
  [[ -x "$(command -v $1)" ]]
}

needs() {
  say "installing dependencies"
  for pack in $* ; do
    if [[ $pack =~ .*:.* ]]; then
      rush get "$pack" --clone
    else
      rush get "$REPO:$pack"
    fi
  done
}

discard() {
  say "uninstalling dependencies"
  for pack in $* ; do
    if [[ $pack =~ .*:.* ]]; then
      rush undo "$pack"
    else
      rush undo "$REPO:$pack"
    fi
  done
}

github_install_helper() {
  binary_name="$1"
  github_repo="$2"
  version_flag="${3:---version}"

  say "identifying latest version for $github_repo"
  version=$(get_github_release_version "$github_repo")
  say "latest version is $version"

  if is_installed "$binary_name" "$version_flag"; then
    say "$binary_name is already at the latest version"
  else
    say "installing $binary_name"
    install_function
    "$binary_name" $version_flag
    say "$binary_name installation complete"
  fi
}

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

# Get a standardized tmp dir
temp_dir() {
  mktemp -d -t rush-XXX
}