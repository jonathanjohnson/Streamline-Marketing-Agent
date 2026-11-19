#!/usr/bin/env bash
# Install Agent Reach (github.com/Panniantong/agent-reach) for this agent.
# - Pinned to a release tag; installed from a git clone because some networks
#   (including Claude Code cloud sessions) block GitHub archive/release downloads.
#   Never install the PyPI package named "agent-reach": it is a different project.
# - English skill, registered per project in .claude/skills/agent-reach (committed),
#   not user-wide, so it isn't loaded twice.
# Usage: scripts/install-agent-reach.sh            install if missing, run setup
#        scripts/install-agent-reach.sh --vendor   also refresh .claude/skills/agent-reach from the installed version
set -euo pipefail

VERSION="${AGENT_REACH_VERSION:-v1.6.1}"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
export PATH="$HOME/.local/bin:$PATH"
export AGENT_REACH_LANG=en

if ! command -v uv >/dev/null 2>&1; then
  echo "uv not found. Install it: curl -LsSf https://astral.sh/uv/install.sh | sh" >&2
  exit 1
fi

current="$(agent-reach version 2>/dev/null | sed -nE 's/.*"version": "([^"]+)".*/v\1/p' || true)"
if [ "$current" != "$VERSION" ]; then
  src="$(mktemp -d)"
  trap 'rm -rf "$src"' EXIT
  git clone --quiet --depth 1 --branch "$VERSION" https://github.com/Panniantong/agent-reach.git "$src/agent-reach" 2>/dev/null
  uv tool install --force --quiet "$src/agent-reach"
fi

agent-reach setup >/dev/null
# Project-level registration: drop the user-wide link setup creates, so the skill isn't
# loaded twice. (v1.6.1 has no `skill unlink`; remove only our own symlink.)
link="$HOME/.claude/skills/agent-reach"
if [ -L "$link" ] && [ "$(readlink "$link")" = "$HOME/.agents/skills/agent-reach" ]; then
  rm "$link"
fi

if [ "${1:-}" = "--vendor" ]; then
  rm -rf "$ROOT/.claude/skills/agent-reach"
  cp -R "$HOME/.agents/skills/agent-reach" "$ROOT/.claude/skills/agent-reach"
  chmod -R u+rwX,go+rX "$ROOT/.claude/skills/agent-reach"
fi

agent-reach version
