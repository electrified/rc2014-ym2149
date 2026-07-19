#!/usr/bin/env bash
set -euo pipefail

branch_ref="${1:-}"
tags_input="${2:-}"
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

if [[ -z "$tags_input" ]]; then
  if command -v git >/dev/null 2>&1; then
    tags_input="$(git tag --list 'v*' | sort -V || true)"
  fi
fi

major=""
if [[ "$branch_ref" =~ ^([0-9]+)(/|$) ]]; then
  major="${BASH_REMATCH[1]}"
elif [[ "$branch_ref" =~ ^(release|maint|hotfix)[/-]([0-9]+) ]]; then
  major="${BASH_REMATCH[2]}"
fi

if [[ -z "$major" ]]; then
  echo "0.0.0-pre-${short_sha:0:7}"
  exit 0
fi

pattern="^v${major}\.([0-9]+)\.([0-9]+)$"
latest_version=""

while IFS= read -r tag; do
  [[ -z "$tag" ]] && continue
  if [[ "$tag" =~ $pattern ]]; then
    version="${BASH_REMATCH[1]}.${BASH_REMATCH[2]}"
    if [[ -z "$latest_version" ]]; then
      latest_version="$version"
    else
      if [[ "$version" > "$latest_version" ]]; then
        latest_version="$version"
      fi
    fi
  fi
done <<< "$tags_input"

if [[ -n "$latest_version" ]]; then
  echo "${major}.${latest_version}-pre-${short_sha:0:7}"
else
  echo "${major}.0.0-pre-${short_sha:0:7}"
fi
