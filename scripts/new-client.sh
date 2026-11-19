#!/usr/bin/env bash
# Scaffold a client workspace from the template and activate it.
# Usage: scripts/new-client.sh <slug> <vertical> ["Business Name"]
#   vertical: pool-service | pest-control | hvac | hoa-management | med-spa | other
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SLUG="${1:?slug required, e.g. bluewave-pools}"
VERTICAL="${2:?vertical required: pool-service|pest-control|hvac|hoa-management|med-spa|other}"
NAME="${3:-$SLUG}"
DIR="$ROOT/clients/$SLUG"

[[ "$SLUG" =~ ^[a-z0-9-]+$ ]] || { echo "slug must be lowercase letters, digits, hyphens" >&2; exit 1; }
[ -e "$DIR" ] && { echo "clients/$SLUG already exists" >&2; exit 1; }
if [ "$VERTICAL" != "other" ] && [ ! -f "$ROOT/verticals/$VERTICAL.md" ]; then
  echo "Unknown vertical '$VERTICAL'. Options: $(ls "$ROOT/verticals" | sed 's/\.md$//' | tr '\n' ' ')other" >&2; exit 1
fi

mkdir -p "$DIR"
TODAY="$(date -u +%Y-%m-%d)"
for f in "$ROOT"/clients/_template/*.md; do
  sed -e "s/{{CLIENT_NAME}}/$NAME/g" -e "s/{{VERTICAL}}/$VERTICAL/g" -e "s/{{DATE}}/$TODAY/g" "$f" > "$DIR/$(basename "$f")"
done
echo "Created clients/$SLUG ($VERTICAL)"
"$ROOT/scripts/use-client.sh" "$SLUG"
echo "Next: in Claude Code, run the streamline-client skill (or say 'onboard $NAME') to fill the context."
