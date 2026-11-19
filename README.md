# Streamline Marketing Agent

A Claude Code marketing agent for Streamline's local-service clients (pool service, pest control, HVAC, HOA management, med spas).

It's built on [coreyhaines31/marketingskills](https://github.com/coreyhaines31/marketingskills): 53 skills covering CRO, copy, SEO, AI search, paid ads, email/SMS, offers, pricing and outbound, vendored into `.claude/skills/`. Streamline's layer adds a context workspace per client, vertical playbooks, and routing to the connected data tools.

## Quick start

```bash
git clone <this repo> && cd Streamline-Marketing-Agent
claude                                   # skills in .claude/skills load automatically
```

Then, inside Claude Code:

```
Onboard Bluewave Pools, bluewavepools.com, pool service in Scottsdale.
```

The `streamline-client` skill scaffolds `clients/bluewave-pools/` and activates it. It then drafts the context from the client's site, GBP, reviews, and Ahrefs/Semrush data, and returns the TODOs that only the client can answer (average ticket, LTV, close rate, capacity).

After that, ask for work directly:

```
Build a spring opening campaign: Google Search + LSA + Meta, with ad copy and a landing page.
Audit their local SEO and give me a prioritized fix list.
Plan 3 months of content around green-pool and equipment keywords.
Design a weekly-service offer that converts green-to-clean jobs into recurring accounts.
Switch to Apex Pest. Write the termite swarm-season landing page.
```

## Layout

```
.claude/skills/            53 upstream skills + agent-reach + streamline-client + streamline-local-services
  UPSTREAM.md              vendored version + commit
clients/
  _template/               product-marketing.md + brand.md scaffold (local-business fields added)
  <slug>/                  one folder per client: context, brand, deliverables/
verticals/                 pool-service, pest-control, hvac, hoa-management, med-spa playbooks
tools/                     upstream tool registry, integration guides, zero-dependency CLIs
scripts/
  new-client.sh            scripts/new-client.sh <slug> <vertical> "Business Name"
  use-client.sh            scripts/use-client.sh <slug>   |  --show
  sync-skills.sh           pull the latest upstream skills
  install-agent-reach.sh   install the Agent Reach CLI (pinned) and refresh its skill
CLAUDE.md                  agent operating procedure and hard rules
```

## How client context works

Every upstream skill reads `.agents/product-marketing.md`. Here, `.agents/*.md` are gitignored symlinks to the active client's files, so:

- one command switches every skill to a different client (`scripts/use-client.sh <slug>`)
- writes from skills (changelog entries, learnings) land in that client's own file, which is version-controlled
- clients never bleed into each other

The symlinks are per-checkout state, so re-run `use-client.sh` (or just name the client to Claude) at the start of a session.

## Connected tools it uses

The agent uses whichever of these are connected to the Claude Code session: Ahrefs, Semrush, GMB Crush (GBP, reviews, geo-grids, GSC/GA), GoHighLevel, Meta Ads, Google Sheets/Docs/Drive, ClickUp, Slack, WPvibe, Lovable, Arcads, Higgsfield. Everything is read-only unless you approve a specific write.

For accounts without an MCP connector (Google Ads, GA4 direct, call tracking), see `tools/REGISTRY.md` and `tools/integrations/` for the API and CLI setup.

## Agent Reach (platform access)

[Agent Reach](https://github.com/Panniantong/agent-reach) gives the agent read-only access to Reddit threads and comments, YouTube search and transcripts, LinkedIn jobs, GitHub, and a fallback web reader, all as one JSON shape. The agent uses it for voice-of-customer mining, objection research, competitor video teardowns, and hiring signals (plays in `.claude/skills/streamline-local-services/references/agent-reach-playbook.md`).

```bash
scripts/install-agent-reach.sh      # installs the pinned release (v1.6.1) with uv, runs setup
```

- The skill is committed at `.claude/skills/agent-reach/` (English). The CLI installs to `~/.local/bin/agent-reach`, with state in `~/.agent-reach/`.
- Installs from a git clone of the release tag. Never `pip install agent-reach`: the PyPI package of that name is a different project.
- Strictly read-only: no posting, commenting, or messaging. Login-walled channels (X, Instagram, Facebook, LinkedIn search) use your own logins on your own machine via `agent-reach login <channel>`; the agent never handles passwords.

**Cloud sessions:** the environment's network policy has to allow the hosts the channels call, or they fail with `UPSTREAM_BROKEN ... 403`. GitHub works out of the box. For the rest, add these under the environment's Network access > Allowed domains:

| Host | Channel |
|---|---|
| `r.jina.ai`, `mcp.exa.ai` | web read / web search |
| `www.youtube.com` | YouTube search, info, subtitles |
| `www.reddit.com` | Reddit public read and search |
| `www.linkedin.com` | LinkedIn public jobs |

To install it automatically in new cloud sessions, add this line to the environment's setup script:

```bash
if [ -x Streamline-Marketing-Agent/scripts/install-agent-reach.sh ]; then Streamline-Marketing-Agent/scripts/install-agent-reach.sh; fi
```

## Updating the upstream skills

```bash
scripts/sync-skills.sh          # or: scripts/sync-skills.sh <tag>
git diff --stat && git commit -am "Sync marketingskills <version>"
```

`streamline-*` skills are never touched by the sync.

## License

Upstream skills and tools: MIT, Copyright (c) 2025 Corey Haines (`THIRD_PARTY_LICENSE-marketingskills`).
Agent Reach skill: MIT, Copyright (c) 2025 Agent Eyes (`THIRD_PARTY_LICENSE-agent-reach`).
