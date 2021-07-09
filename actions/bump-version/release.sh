#!/bin/env bash
set -e

function tag_or_release() {
  if [ "$INPUT_TAG_ONLY" = "" ]; then
    git tag "$1"
    git push origin --tags
  else
    export GITHUB_TOKEN="$INPUT_ACCESS_TOKEN"
    gh release create "$1" --title "$1"
  fi
}
