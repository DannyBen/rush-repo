set -e

for group in core platform installers rush shell; do
  for file in "$REPO_PATH"/_lib/"$group"/*.sh; do
    source "$file"
  done
done

# globals
version=""  # for github helper
DISTRO="$(linux_distro)"
