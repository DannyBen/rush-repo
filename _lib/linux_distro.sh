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
  elif [ "$(uname)" == "Darwin" ]; then
    echo "mac"
  else
    echo "unknown"
  fi
}
