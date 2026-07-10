#!/usr/bin/env bash
shopt -s globstar
set -e
source _lib/core/colors.sh

green "==> shellcheck lib files"

for file in _lib/**/*.sh ; do
  echo "==> shellcheck $file"
  # shellcheck --external-sources --source-path=SCRIPTDIR:"$PWD" "$file"
  shellcheck --exclude SC1090,SC1091 --shell bash "$file"
done

green "==> shellcheck primary files"

for file in **/{main,undo}* ; do
  echo "==> shellcheck $file"
  # shellcheck --external-sources --source-path=SCRIPTDIR:"$PWD" "$file"
  shellcheck "$file"
done

green "==> typos"

command -v typos >/dev/null 2>&1 && typos

green "==> all done"
