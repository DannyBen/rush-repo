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
say() { printf "%-20s | %s\n" "$(cyan $(basename $PWD))" "$(bold "$*")"; }

# Utility functions
get_github_release_version() {
  curl -s https://api.github.com/repos/$1/releases/latest | grep "tag_name" | cut -d : -f 2,3 | tr -d \"\ ,v
}

is_installed() {
  local cmd=$1
  local version_flag=${2:---version}
  hash $cmd 2> /dev/null && $cmd $version_flag 2>&1 | grep "$version" > /dev/null 2>&1
}

needs() {
  for pack in $* ; do
    rush "$REPO:$pack"
  done
}