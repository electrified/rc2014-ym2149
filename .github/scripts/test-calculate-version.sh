#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
script_path="$script_dir/calculate-version.sh"

if [[ ! -x "$script_path" ]]; then
  echo "expected test script to find an executable calculate-version.sh" >&2
  exit 1
fi

assert_version() {
  local branch="$1"
  local tags="$2"
  local expected="$3"
  local ref_type="$4"
  local ref_name="$5"
  local actual

  actual="$(GITHUB_REF_TYPE="$ref_type" GITHUB_REF_NAME="$ref_name" GITHUB_SHA="1234567" "$script_path" "$branch" "$tags")"
  if [[ "$actual" != "$expected" ]]; then
    echo "expected '$branch' -> '$expected' but got '$actual'" >&2
    exit 1
  fi
}

assert_version "5" $'v5.0.0\nv5.0.1' "5.0.1-pre-1234567" "branch" "5"
assert_version "release/6" $'v6.1.0\nv6.2.3' "6.2.3-pre-1234567" "branch" "release/6"
assert_version "maint-7" "" "7.0.0-pre-1234567" "branch" "maint-7"
assert_version "7" $'v7.1.0\nv7.0.5' "7.1.0-pre-1234567" "branch" "7"

echo "calculate-version.sh tests passed"
