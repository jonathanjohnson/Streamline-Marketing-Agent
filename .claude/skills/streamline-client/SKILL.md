---
name: streamline-client
description: "When the user names a client, says 'onboard', 'new client', 'switch to', 'work on [client]', or asks which client is active: creates or activates a client workspace under clients/<slug>/ so every marketing skill reads that client's context, and auto-drafts the context from the client's website, Google Business Profile, reviews, and SEO data. Run before any client-specific marketing work."
metadata:
  version: 1.0.0
  owner: Streamline
---

# Streamline Client Workspace

Every upstream marketing skill reads `.agents/product-marketing.md` (and `brand.md`, `design.md`, `listening-sources.md`, `media-list.md`). In this repo those paths are symlinks to the **active client's** files in `clients/<slug>/`. Getting the active client right is the first step of any client task.

## Step 1: Resolve the client

1. Run `scripts/use-client.sh --show`.
2. If the user named a client, match it to a folder in `clients/` (slugs are lowercase-hyphenated business names). If it exists, run `scripts/use-client.sh <slug>` and continue to the user's actual task.
3. If no folder matches, confirm the business name, website, and vertical with the user (one question, not a questionnaire), then run:
   `scripts/new-client.sh <slug> <vertical> "<Business Name>"`
   Verticals: `pool-service`, `pest-control`, `hvac`, `hoa-management`, `med-spa`, `other`.
4. Never write client facts into another client's folder. If the active client and the requested client differ, switch first and say so in one line.

## Step 2: Auto-draft the context (new or v0 clients)

A scaffold has `Document version: v0`. Fill it from evidence before asking the user anything. Use what is connected; skip a source quietly if its connector isn't available and list it under gaps at the end.

| Source | What to pull | Tool |
|---|---|---|
| Client website | Services, service area, offers, guarantees, licenses, voice, proof, pricing | WebFetch (or Ultimate_Scraper `scrape_pages` for many pages) |
| Google Business Profile | Categories, hours, service area, review count/rating, photos, posts | GMB Crush: `list_gbp_businesses`, `get_gbp_location_profile` |
| Reviews | Verbatim customer language for Problems, Customer Language, Proof Points, Objections | GMB Crush `get_gbp_reviews` |
| Local rankings | Geo-grid visibility for the money keywords | GMB Crush geo-grid projects/reports |
| SEO footprint | Organic keywords, top pages, competitors, DR | Ahrefs (`site-explorer-*`) or Semrush (`domain_overview`, `organic_research`, `competitors_research`) |
| CRM / pipeline | Lead sources, volume, booked rate, revenue by source | GoHighLevel (`search_operations` then `execute_operation`, read-only) |
| Paid social | Accounts, spend, top campaigns | Meta Ads MCP (`ads_get_ad_accounts`, `ads_get_ad_entities`, read-only) |

Then:
1. Read `verticals/<vertical>.md` and use it to interpret what you found (which service lines matter, which KPIs to ask for, which compliance rules apply).
2. Fill `clients/<slug>/product-marketing.md` section by section. Use verbatim review quotes in Customer Language. Mark anything inferred rather than observed as `(inferred)`; leave genuine unknowns as `TODO`.
3. Fill `clients/<slug>/brand.md` from the website (logo URLs, colors from CSS, photo style).
4. Set `Document version: v1`, `Last updated` to today, and add a Changelog line: `- v1 (YYYY-MM-DD) — Auto-drafted from website, GBP, reviews, [other sources].`
5. Show a short summary: what you filled, the 5-10 most important TODOs (prioritize the Local Business Profile numbers: average ticket, LTV, close rates, capacity, lead sources), and any compliance flags from the vertical playbook.

Do not invent metrics, testimonials, licenses, or guarantees. Unknown is better than wrong; every downstream skill trusts this file.

## Step 3: Keep it current

- When the user corrects a fact, update the file, bump the version, add a Changelog line (follow the upstream `product-marketing` skill's versioning rules).
- When a campaign or test produces a real result, propose a Learnings row and add it on approval.
- Commit client files with a message like `clients/<slug>: v3, added Q1 LSA learnings` when the user asks to save work.

## Rules

- Read-only by default on every connector. Posting to GBP, replying to reviews, changing ads, or writing to the CRM requires explicit user approval for that specific action.
- Client data stays in `clients/<slug>/`. Don't paste one client's data into another client's deliverables or into external services beyond what the task requires.
