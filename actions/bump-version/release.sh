#!/bin/env bash
set -e

function create_release() {
  gh create release "$1"
}
