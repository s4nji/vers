#!/bin/env bash
set -e

function tag_or_release() {
  if [ "$INPUT_TAG_ONLY" = "" ]; then
    git tag "$1"
    git push origin --tags
  else
    gh release create "$1"
  fi
}
