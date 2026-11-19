#!/usr/bin/env bash
# Vendor the six writing and design skills into .claude/skills/, each pinned to a reviewed commit.
# To update one: read the upstream diff, change its commit below, run this script, review `git diff`.
# Format: name | github repo | commit | path of the skill folder inside the repo ("." = repo root)
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

SKILLS='
humanizer|blader/humanizer|b48c832|.
no-ai-slop|petergyang/no-ai-slop|000650b|skills/no-ai-slop
anti-ai-slop-writing|jalaalrd/anti-ai-slop-writing|63255f9|skills/anti-ai-slop-writing
make-interfaces-feel-better|jakubkrehel/make-interfaces-feel-better|6d9f2f1|skills/make-interfaces-feel-better
better-icons|better-auth/better-icons|033316e|skills
superdesign|superdesigndev/superdesign-skill|f9f05cd|skills/superdesign
'

echo "$SKILLS" | while IFS='|' read -r name repo commit path; do
  [ -n "$name" ] || continue
  src="$TMP/$name"
  git clone --quiet "https://github.com/$repo.git" "$src"
  git -C "$src" -c advice.detachedHead=false checkout --quiet "$commit"
  full="$(git -C "$src" rev-parse HEAD)"
  dest="$ROOT/.claude/skills/$name"
  rm -rf "$dest"; mkdir -p "$dest"
  if [ "$path" = "." ]; then
    cp "$src/SKILL.md" "$dest/"            # repo root is the skill; take only the skill file
  else
    cp -R "$src/$path/." "$dest/"
  fi
  rm -rf "$dest/agents" "$dest/evals"      # other agents' metadata and test fixtures
  [ -f "$dest/SKILL.md" ] || { echo "$name: no SKILL.md at $path" >&2; exit 1; }
  if ls "$src"/LICENSE* >/dev/null 2>&1; then
    cp "$src"/LICENSE* "$dest/LICENSE"
  else
    printf 'Upstream ships no LICENSE file. Its README states: "License: MIT".\nSource: https://github.com/%s\n' "$repo" > "$dest/LICENSE"
  fi
  printf 'Vendored from https://github.com/%s\nCommit: %s\nDo not edit in place; overwritten by scripts/sync-extra-skills.sh\n' "$repo" "$full" > "$dest/UPSTREAM"
  echo "  $name  <- $repo@${full:0:7}"
done
