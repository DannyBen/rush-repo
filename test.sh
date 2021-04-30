#!/usr/bin/env bash

shopt -s globstar 
set -e

echo "==> shellcheck started"

for file in **/{main,undo} ; do
  echo "==> shellcheck $file"
  pushd ./$(dirname $file) > /dev/null
  shellcheck -x $(basename $file)
  popd $wd > /dev/null
done

echo "==> shellcheck done, all good"