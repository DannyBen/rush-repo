distro_script() {
  prefix=${1:-main}
  script="${prefix}-${DISTRO}"

  if [[ -f "$script" ]]; then
    . "$script"
  else
    warning "not available for distro:$DISTRO"
    return 1
  fi
}
