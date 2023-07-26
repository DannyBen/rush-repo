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

general_install_helper() {
  binary_name="$1"
  version_flag="${2:---version}"

  if [[ -z "$FORCE" ]] && is_installed "$binary_name"; then
    say "already installed (--force to install anyway)"
  else
    # prevent nested tools from being forced
    unset FORCE
    say "installing"
    install_function
    "$binary_name" $version_flag
    say "installation complete"
  fi
}

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

  if [[ -z "$FORCE" ]] && is_installed "$binary_name" "$version_flag"; then
    say "$binary_name is already at the latest version"
  else
    # prevent nested tools from being forced
    unset FORCE
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

# Install/uninstall simple packages with pacman or apt
package_install() {
  package="$1"
  command_name="${2:-$1}"
  if [[ "$command_name" == $package ]]; then
    display_name="$command_name"
  else
    display_name="$command_name ($package)"
  fi

  if command_exist "$command_name" ; then
    say "$display_name is already installed"
  else
    say "installing $display_name"
    case "$DISTRO" in
      "ubuntu") sudo apt-get install -y "$package" ;;
      "arch") sudo pacman -S --noconfirm "$package" ;;
    esac    
  fi
}

package_uninstall() {
  package="$1"
  display_name="${2:-$1}"
  say "uninstalling $display_name"
  case "$DISTRO" in
    "ubuntu") sudo apt-get remove -y "$package" ;;
    "arch") sudo pacman -Rs --noconfirm "$package" ;;
  esac    
}

uninstall_bin() {
  package="$1"
  say "uninstalling $package"
  sudo rm -f "/usr/local/bin/$package"
}

# Get a standardized tmp dir
temp_dir() {
  mktemp -d -t rush-XXX
}

# Use `pushtmp` to start working in a temp dir, then `popd`
pushtmp() {
  pushd "$(temp_dir)"
}

# Return the linux distro as a lowercase string
linux_distro() {
  if [ -f "/etc/os-release" ]; then
    source /etc/os-release
    echo "$ID" | tr '[:upper:]' '[:lower:]'
  elif [ -f "/etc/lsb-release" ]; then
    source /etc/lsb-release
    echo "$DISTRIB_ID" | tr '[:upper:]' '[:lower:]'
  elif [ -f "/etc/debian_version" ]; then
    echo "debian"
  elif [ -f "/etc/redhat-release" ]; then
    echo "centos"
  else
    echo "unknown"
  fi
}

DISTRO="$(linux_distro)"
