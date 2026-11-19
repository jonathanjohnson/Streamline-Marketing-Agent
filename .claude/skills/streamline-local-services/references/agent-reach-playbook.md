# Agent Reach for Local-Services Marketing

Agent Reach (`agent-reach`, skill: `agent-reach`) is a read-only CLI that returns one JSON shape (`{ok, channel, action, backend, items, meta, error}`) for platforms the agent's own tools can't reach well. Use it to put real customer, competitor, and market evidence behind the upstream skills. Run `agent-reach channels` for the live list of actions and params.

Prefer built-in WebSearch/WebFetch and the MCP connectors first for public pages and account data. Use Agent Reach when you need comment threads, transcripts, platform search, or structured results those tools don't return.

## Plays by job

| Job | Command pattern | Feeds skill | Lands in |
|---|---|---|---|
| Voice of customer: how homeowners/patients describe the problem | `agent-reach reddit search "<problem phrase>" --limit 10`, then `agent-reach read <thread-url>` for comments | `customer-research`, `copywriting`, `product-marketing` | Customer Language, Objections, Problems in the client context (verbatim quotes, with thread URL) |
| Objection mining before an offer or landing page | Reddit search on "worth it", "scam", "cost", "regret" + service name | `offers`, `cro`, `copywriting` | Objections table |
| Competitor and industry video teardown | `agent-reach youtube search "<competitor or topic>" --limit 5`, then `agent-reach youtube subtitle <url>` | `competitor-profiling`, `reverse-engineer-marketing`, `video`, `ad-creative` | deliverables/ teardown; hooks and claims for creative |
| Content gaps and FAQ sourcing | YouTube subtitles of top-ranking "how much does X cost" videos; Reddit questions | `content-strategy`, `ai-seo`, `programmatic-seo` | Content plan, FAQ blocks |
| Competitor hiring signals (expansion, new service lines, new markets) | `agent-reach linkedin jobs "<competitor name>"` or role + city | `competitor-profiling`, `prospecting` | Competitor profile (dated) |
| B2B prospect signals (HOA management, commercial pest, property managers) | LinkedIn jobs for "community association manager [city]", "facilities manager [city]" | `prospecting`, `cold-email` | Prospect list notes |
| Read a pasted link the built-in fetch can't render | `agent-reach read <url>` | any | as needed |
| Tool and script discovery for builds | `agent-reach github search "<topic>"` | `free-tools`, `programmatic-seo` | build notes |

## Starting points by vertical (check each community is active before relying on it)

- **Pool service:** r/pools, r/swimmingpools; operator side: r/sweatystartup. Search phrases: "green pool", "pool guy", "weekly pool service worth it", "pool company ghosted".
- **Pest control:** r/pestcontrol, r/homeowners, r/HomeImprovement. Phrases: "exterminator worth it", "quarterly pest control", "termite inspection", "bed bugs came back".
- **HVAC:** r/HVAC (techs), r/hvacadvice (homeowners), r/homeowners. Phrases: "quote for new ac", "hvac company upsell", "maintenance plan worth it", "heat pump vs furnace".
- **HOA management:** r/HOA, r/condo, r/homeowners. Board perspective is scarce; filter for posts from board members ("I'm on the board", "our management company").
- **Med spa:** r/SkincareAddiction, r/30PlusSkinCare, r/PlasticSurgery, r/Botox-adjacent threads, r/Semaglutide for weight loss. Phrases: "botox price per unit", "lip filler regret", "med spa vs dermatologist", "laser hair removal worth it".

## Rules

- Read-only. Never post, comment, vote, or message. Never log in for the user or ask for credentials; logins happen through `agent-reach login <channel>` on the user's own machine.
- Quote verbatim and keep the source URL and date with every quote that goes into a client context file. Don't attribute usernames in client-facing deliverables.
- Reddit and YouTube samples skew toward complaints and enthusiasts. Label them as directional evidence, not market sizing.
- On `NEED_LOGIN`, `RATE_LIMITED`, `PLATFORM_BLOCKED`: keep what you have, report it, stop. Don't loop or switch backends.
- On `UPSTREAM_BROKEN` with a proxy `403` / "no rule allows this host" message in a cloud session, the environment's network policy is blocking the host (see README "Agent Reach"). Fall back to built-in tools and say which channel was unavailable.
