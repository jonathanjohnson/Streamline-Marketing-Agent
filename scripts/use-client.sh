#!/usr/bin/env bash
# Point every marketing skill at one client's context.
# Skills read/write .agents/product-marketing.md (+ brand.md, design.md, listening-sources.md,
# media-list.md). This symlinks those paths to clients/<slug>/, so reads AND writes
# (changelog, learnings) land in the client's own files.
# Usage: scripts/use-client.sh <slug>     |   scripts/use-client.sh --show
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
FILES=(product-marketing.md brand.md design.md listening-sources.md media-list.md)

if [ "${1:-}" = "--show" ] || [ -z "${1:-}" ]; then
  if [ -f "$ROOT/.agents/ACTIVE_CLIENT" ]; then
    echo "Active client: $(cat "$ROOT/.agents/ACTIVE_CLIENT")"
  else
    echo "No active client. Available:"; ls "$ROOT/clients" | grep -v '^_'
  fi
  exit 0
fi

SLUG="$1"
DIR="$ROOT/clients/$SLUG"
[ -d "$DIR" ] || { echo "No such client: clients/$SLUG (create it with scripts/new-client.sh)" >&2; exit 1; }

mkdir -p "$ROOT/.agents"
for f in "${FILES[@]}"; do
  rm -f "$ROOT/.agents/$f"
  if [ -f "$DIR/$f" ]; then
    ln -s "../clients/$SLUG/$f" "$ROOT/.agents/$f"
  fi
done
echo "$SLUG" > "$ROOT/.agents/ACTIVE_CLIENT"
echo "Active client: $SLUG"
for f in "${FILES[@]}"; do [ -L "$ROOT/.agents/$f" ] && echo "  .agents/$f -> clients/$SLUG/$f"; done
grep -m1 -i '^\*\*Vertical:\*\*' "$DIR/product-marketing.md" 2>/dev/null || true
