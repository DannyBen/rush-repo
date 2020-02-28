#!/usr/bin/env bash

shopt -s globstar 
set -e

echo "==> shellcheck started"

for file in **/{main,undo} ; do
  echo "==> shellcheck $file"
  wd=$PWD
  cd ./$(dirname $file)
  shellcheck -x $(basename $file)
  cd $wd
done

echo "==> shellcheck done, all good"