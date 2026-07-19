#!/usr/bin/env bash
set -euo pipefail

branch_ref="${1:-}"
tags_input="${2:-}"
ref_type="${GITHUB_REF_TYPE:-}"
ref_name="${GITHUB_REF_NAME:-}"
short_sha="${GITHUB_SHA:-}"

if [[ -z "$branch_ref" ]]; then
  for candidate in "${GITHUB_HEAD_REF:-}" "${GITHUB_REF_NAME:-}" "${GITHUB_BASE_REF:-}"; do
    if [[ -n "$candidate" ]]; then
      branch_ref="$candidate"
      break
    fi
  done
fi

if [[ -z "$branch_ref" ]]; then
  branch_ref="$(git rev-parse --abbrev-ref HEAD 2>/dev/null || true)"
fi

if [[ -z "$branch_ref" ]]; then
  echo "Unable to determine branch name" >&2
  exit 1
fi

if [[ "$ref_type" == "tag" && -n "$ref_name" ]]; then
  echo "$ref_name"
  exit 0
fi

if [[ -z "$tags_input" ]]; then
  if command -v git >/dev/null 2>&1; then
    tags_input="$(git tag --list 'v*' | sort -V || true)"
  fi
fi

major=""
if [[ "$branch_ref" =~ ^([0-9]+)(/|$) ]]; then
  major="${BASH_REMATCH[1]}"
else
  if [[ "$branch_ref" =~ ^(release|maint|hotfix)[/-]([0-9]+) ]]; then
    major="${BASH_REMATCH[2]}"
  fi
fi

if [[ -z "$major" ]]; then
  echo "0.0.0"
  exit 0
fi

pattern="^v${major}\.([0-9]+)\.([0-9]+)$"

latest_patch=0
latest_minor=0

while IFS= read -r tag; do
  [[ -z "$tag" ]] && continue
  if [[ "$tag" =~ $pattern ]]; then
    minor="${BASH_REMATCH[1]}"
    patch="${BASH_REMATCH[2]}"

    if (( minor > latest_minor )) || { (( minor == latest_minor )) && (( patch > latest_patch )); }; then
      latest_minor="$minor"
      latest_patch="$patch"
    fi
  fi
done <<< "$tags_input"

if (( latest_minor == 0 && latest_patch == 0 )); then
  echo "${major}.0.0-pre-${short_sha:0:7}"
else
  echo "${major}.${latest_minor}.$((latest_patch + 1))-pre-${short_sha:0:7}"
fi
