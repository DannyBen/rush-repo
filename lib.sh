set -e

for file in "$REPO_PATH"/_lib/*.sh; do
  source $file
done

# globals
version=""  # for github helper
DISTRO="$(linux_distro)"
