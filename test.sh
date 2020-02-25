#!/usr/bin/env bash

shopt -s globstar 
set -e

echo "==> shellcheck started"

for file in **/{main,undo} ; do
  echo "==> shellcheck $file"
  shellcheck $file
done

echo "==> shellcheck done, all good"