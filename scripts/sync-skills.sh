#!/usr/bin/env bash
# Pull the latest coreyhaines31/marketingskills and vendor it into this repo.
#   skills/*  -> .claude/skills/   (Claude Code project skills)
#   tools/    -> tools/            (skills reference tools/REGISTRY.md etc. from repo root)
# Only skills this script installed (see .claude/skills/.marketingskills.list) are replaced.
# Usage: scripts/sync-skills.sh [git-ref]   (default: main)
set -euo pipefail

REF="${1:-main}"
UPSTREAM="https://github.com/coreyhaines31/marketingskills.git"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

git clone --quiet --depth 1 --branch "$REF" "$UPSTREAM" "$TMP/ms"
SHA="$(git -C "$TMP/ms" rev-parse HEAD)"
VERSION="$(grep -m1 '"version"' "$TMP/ms/.claude-plugin/plugin.json" | sed -E 's/.*"([0-9.]+)".*/\1/')"

mkdir -p "$ROOT/.claude/skills"
# Remove only the skills a previous sync installed (tracked in a manifest), then copy fresh.
# Anything else in .claude/skills (streamline-*, agent-reach, the extra writing/design skills) is left alone.
MANIFEST="$ROOT/.claude/skills/.marketingskills.list"
if [ -f "$MANIFEST" ]; then
  while read -r name; do [ -n "$name" ] && rm -rf "$ROOT/.claude/skills/$name"; done < "$MANIFEST"
fi
: > "$MANIFEST"
for d in "$TMP"/ms/skills/*/; do
  name="$(basename "$d")"
  rm -rf "$ROOT/.claude/skills/$name"
  cp -R "$d" "$ROOT/.claude/skills/$name"
  rm -rf "$ROOT/.claude/skills/$name/evals"   # upstream test fixtures, not needed at runtime
  echo "$name" >> "$MANIFEST"
done

rm -rf "$ROOT/tools"
cp -R "$TMP/ms/tools" "$ROOT/tools"

cp "$TMP/ms/LICENSE" "$ROOT/THIRD_PARTY_LICENSE-marketingskills"
cat > "$ROOT/.claude/skills/UPSTREAM.md" <<MD
# Vendored skills

The skills listed in \`.marketingskills.list\` are vendored from
[coreyhaines31/marketingskills](https://github.com/coreyhaines31/marketingskills) (MIT).

- Version: ${VERSION}
- Commit: ${SHA}
- Synced: $(date -u +%Y-%m-%d)

Do not edit vendored skills in place; changes are overwritten by \`scripts/sync-skills.sh\`.
Other vendored skills carry their own UPSTREAM file. Put Streamline-specific behavior in \`streamline-*\` skills, \`CLAUDE.md\`, or \`verticals/\`.
MD

echo "Synced marketingskills ${VERSION} (${SHA:0:7}): $(ls "$TMP"/ms/skills | wc -l) skills"
