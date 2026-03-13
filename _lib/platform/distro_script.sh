distro_script() {
  prefix=${1:-main}
  script="${prefix}-${DISTRO}"

  if [[ -f "$script" ]]; then
    . "$script"
  else
    fail "not available for distro:$DISTRO"
  fi
}
