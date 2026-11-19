#!/usr/bin/env bash
# Pull the latest coreyhaines31/marketingskills and vendor it into this repo.
#   skills/*  -> .claude/skills/   (Claude Code project skills)
#   tools/    -> tools/            (skills reference tools/REGISTRY.md etc. from repo root)
# Streamline-owned skills (prefix "streamline-") are never touched.
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
# Remove previously vendored upstream skills (keeps streamline-* skills), then copy fresh.
for d in "$ROOT"/.claude/skills/*/; do
  [ -d "$d" ] || continue
  name="$(basename "$d")"
  case "$name" in streamline-*) ;; *) rm -rf "$d" ;; esac
done
for d in "$TMP"/ms/skills/*/; do
  name="$(basename "$d")"
  cp -R "$d" "$ROOT/.claude/skills/$name"
  rm -rf "$ROOT/.claude/skills/$name/evals"   # upstream test fixtures, not needed at runtime
done

rm -rf "$ROOT/tools"
cp -R "$TMP/ms/tools" "$ROOT/tools"

cp "$TMP/ms/LICENSE" "$ROOT/THIRD_PARTY_LICENSE-marketingskills"
cat > "$ROOT/.claude/skills/UPSTREAM.md" <<MD
# Vendored skills

Everything in this folder except \`streamline-*\` is vendored from
[coreyhaines31/marketingskills](https://github.com/coreyhaines31/marketingskills) (MIT).

- Version: ${VERSION}
- Commit: ${SHA}
- Synced: $(date -u +%Y-%m-%d)

Do not edit vendored skills in place; changes are overwritten by \`scripts/sync-skills.sh\`.
Put Streamline-specific behavior in \`streamline-*\` skills, \`CLAUDE.md\`, or \`verticals/\`.
MD

echo "Synced marketingskills ${VERSION} (${SHA:0:7}): $(ls "$TMP"/ms/skills | wc -l) skills"
