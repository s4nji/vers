#!/bin/bash
set -ex

export INPUT_REPOSITORY="$1"
export INPUT_ACCESS_TOKEN="$2"
export INPUT_INITIAL_VERSION="$3"

SCRIPT_DIR=$(dirname "$0")
source "${SCRIPT_DIR}/semver.sh"
source "${SCRIPT_DIR}/latest-tag.sh"
source "${SCRIPT_DIR}/bump.sh"
source "${SCRIPT_DIR}/release.sh"

LATEST_TAG="$(get_latest_tag)"
BUMP="$(get_bump_type)"
NEW_TAG="$(semver bump $BUMP $LATEST_TAG)"

echo "::set-output name=version::$(echo $NEW_TAG)"

tag_or_release "$NEW_TAG"
