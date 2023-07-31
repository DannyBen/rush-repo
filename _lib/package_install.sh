# Install simple packages with pacman or apt
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
