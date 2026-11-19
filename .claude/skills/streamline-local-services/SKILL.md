---
name: streamline-local-services
description: "When the user asks for marketing work for a pool service, pest control, HVAC, HOA management, or med spa client, or any local service business: routes the task to the right upstream marketing skill, layers in the vertical playbook (verticals/*.md), and maps it to the connected data tools (Ahrefs, Semrush, GMB Crush, GoHighLevel, Meta Ads, Agent Reach for Reddit/YouTube/LinkedIn). Use for audits, campaign builds, content plans, GBP work, monthly reporting, and offer design for local clients."
metadata:
  version: 1.1.0
  owner: Streamline
---

# Streamline Local Services Router

The upstream skills are written for software companies first. This skill adapts them to Streamline's book of business: home services and med spas, where the unit of value is a booked job or patient, demand is local and seasonal, and the GBP matters as much as the website.

## Before any task

1. Confirm the active client: `scripts/use-client.sh --show`. If it's wrong or missing, run the **streamline-client** skill first.
2. Read `.agents/product-marketing.md` (the active client's context) and `verticals/<vertical>.md` (named in the context's `Vertical:` line).
3. Translate SaaS framing as you go: "trial/signup" becomes booked call or appointment; "MRR/churn" becomes recurring plans, memberships, routes, contracts; "ICP" becomes service area plus customer profile; "product launch" becomes a new service line, location, or seasonal push.

## Routing table

| Request | Primary skill(s) | Vertical playbook section | Data tools |
|---|---|---|---|
| Voice of customer, objections, customer language | `customer-research`, `product-marketing` | Keyword clusters, Offers | Agent Reach: Reddit search/read, YouTube subtitles; GMB Crush reviews |
| "Audit their SEO" / rankings dropped | `seo-audit` (read its local-seo references), `schema` | Keyword clusters | Ahrefs or Semrush, GMB Crush geo-grid, GSC via GMB Crush |
| GBP optimization, posts, reviews | `seo-audit` local references, `referrals` (review programs), `social` | Channel mix (GBP) | GMB Crush (profile, posts, reviews, geo-grid) |
| Content plan / blog topics | `content-strategy`, then `ai-seo` | Keyword clusters, Seasonality | Ahrefs/Semrush keyword tools, Agent Reach (Reddit questions, YouTube transcripts of ranking videos) |
| City or service-area pages | `programmatic-seo`, `site-architecture` | Keyword clusters | Ahrefs/Semrush, client's real service area |
| Google Ads / LSA / Meta plan or diagnosis | `ads`, `conversion-tracking`, `attribution` | Economics, Channel mix, KPIs | Meta Ads MCP; Google Ads via `tools/integrations/google-ads.md` |
| Ad copy and creative | `ad-creative`, `copy-editing` (compliance pass) | Offers, Compliance | Arcads / Higgsfield for production when asked |
| Landing page or website copy | `copywriting`, `cro` | CRO notes, Offers, Compliance | WPvibe (WordPress) or Lovable to build when asked |
| Offer / promo design | `offers`, `pricing` | Offers that work | CRM data for close rates |
| Email / SMS nurture, reactivation | `emails`, `sms`, `churn-prevention` | Retention | GoHighLevel |
| Lead follow-up, pipeline, speed-to-lead | `revops` | KPIs | GoHighLevel |
| Competitor teardown | `competitor-profiling`, `reverse-engineer-marketing` | Channel mix | Ahrefs/Semrush, Meta Ad Library (`ads_library_search`), GMB Crush competitor lists, Agent Reach (YouTube transcripts, LinkedIn jobs as expansion signals) |
| Commercial / B2B outbound (HOA boards, commercial pest, property managers) | `prospecting`, `cold-email`, `sales-enablement` | Channel mix (outbound) | Ultimate_Scraper `extract_map_places` / `extract_contacts` |
| Full marketing plan or annual strategy | `marketing-plan` | All sections | All of the above |
| Recurring monthly or weekly check | `marketing-loops` | KPIs | All of the above, read-only |
| Second opinions on a big call | `marketing-council` | Economics | none |

Agent Reach plays, vertical subreddits, and its error handling are in [references/agent-reach-playbook.md](references/agent-reach-playbook.md). Read it before any Agent Reach call.

## Local-services defaults the upstream skills don't know

- **Optimize to booked jobs and revenue, not leads.** Push for offline conversion imports from the CRM/FSM into Google Ads and Meta. A cheaper lead that never books is not a win.
- **Calls are the main conversion.** Track calls with a duration threshold; audit answer rate before blaming ads.
- **Capacity gates spend.** If the schedule is full, recommend pulling budget back or shifting to high-margin service lines. Don't scale into a backlog.
- **Proximity and GBP dominate local pack visibility.** Geo-grids beat single-point rank checks. Review velocity and recency matter.
- **Seasonality is the calendar.** Every plan and content calendar starts from the vertical's seasonality section, built a month ahead of each spike.
- **City pages only for real coverage.** No doorway pages for areas the client doesn't serve.
- **Compliance pass on every customer-facing asset**, using the vertical's Compliance section (pesticide safety claims, financing disclosures, medical and trademark rules, state licensing numbers).

## Output standards

- Deliverables, not frameworks: finished copy, built campaign structures, prioritized action lists with owners and dates.
- State data sources and dates for every number. Label anything unavailable as MISSING; never estimate a client metric silently.
- Write client-specific outputs to `clients/<slug>/deliverables/YYYY-MM-DD-<topic>.md` unless the user asks for a Google Doc, Sheet, or ClickUp task instead.
- Connectors are read-only unless the user approves a specific write (publishing, posting, replying, budget or bid changes, CRM updates).
