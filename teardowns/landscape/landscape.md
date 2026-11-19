# Soursop Landscape for Nutrively

Pulled 2026-11-19. US. Free sources only. Labels: **Observed** (the data shows it), **Inferred** (reasoned from it), **Not found**.

## What ran and what did not

| Source | Result |
|---|---|
| Skill script (`teardown.mjs compare`, site, stack, history, dns, subdomains, Wayback) | **Failed for all four domains.** This environment's network policy blocks the competitor sites, nutrively.com, web.archive.org and crt.sh. Two requests to add them were rejected by the environments service. |
| Meta Ad Library (connector) | Ran. Counts, headlines, dates, words in copy. No creatives, body copy, landing pages or spend. |
| Site probe (Ultimate Scraper, free tier) | Ran for three of four; jordanwellnessco.com refused the probe. |
| Ahrefs free Domain Rating | Ran for all four. |
| Web search | Ran. Marketplace and review listings; unverified. |
| Nutrively Meta ad account | Ran. Monthly history since Aug 2025 (`teardowns/nutrively-own/`). |
| Search Console, GA4 | Not run. No connector for either was reachable in this session. |
| Traffic estimates (Semrush, Ahrefs, Similarweb) | Not run. Paid; see "Paid calls" below. |

## The field

| | Serene Herbs | Lukaree | Jordan Wellness Co | Nutrively |
|---|---|---|---|---|
| Platform | Shopify, 50 products | Shopify, 47 products | Not read | Shopify, 2 products |
| Domain Rating (Ahrefs) | 31 | 6 | 11 | 0 |
| Active US Meta ads | 1,617 across 4 pages | 32 | None found under the brand name | 13, on two persona pages |
| Offer in the headline | "Save up to 63%" | "Buy 2 get 1 free" | Not found | None |
| Black Friday ads | Live since Nov 6 | Early access live | Not found | None |
| Reviews seen | Loox 4,963; Trustpilot; Amazon; Walmart; TikTok Shop | Amazon and Walmart listings | Not found | Trustpilot, with subscription complaints |
| Price seen | $32.99 for 16 oz | $15.99 for 1 fl oz | Not found | First order about CAD 53 |

All Observed except prices and reviews, which come from search-result summaries.

## Table stakes Nutrively lacks

1. **An offer in the headline.** Both advertisers put the discount or bundle in the headline. Nutrively's headlines carry none.
2. **Black Friday ads.** Both are live. Nutrively has none.
3. **Brand-page advertising.** Both run from pages carrying the brand name. Nutrively runs from two personal-name pages.

## Bets only one company holds

- **Serene Herbs: scale through volume.** 1,617 ads against 32. Four batches of new ads on Nov 18 alone, the same ad duplicated across four pages in the same second. (Observed)
- **Serene Herbs: non-brand pages.** KT Hustles (413 ads) and Mama Ola (73 ads) run identical Serene Herbs ads. Whether these are creators, staff or owned pages is Not found.
- **Serene Herbs: entering drops.** "Soursop Daily Gut Drops" ads appear from Nov 9. That is Nutrively's format. (Observed)
- **Lukaree: absorption claim.** "98% Absorption Liquid Gut Reset" is its lead headline. (Observed) Whether the figure is substantiated is Not found.
- **Lukaree: disease-style claims.** "Flush Gut Parasites & Bloat Instantly!" (Observed). Not a play to copy.

## Open lanes

- **Reviews in ads.** Only 5% of Serene Herbs' ads mention reviews despite 4,963 of them. Usable by Nutrively only if its own review base supports it. Nutrively review count: MISSING.
- **Four-in-one formula.** Neither competitor's headlines lead on a multi-ingredient drop. Nutrively's product (soursop, moringa, sea moss, ashwagandha) does.
- Search demand and Wayback checks for these were not run (blocked).

## Where each is weak

- **Serene Herbs:** format. Sixteen ounces, two tablespoons a dose, shipped as liquid; one Trustpilot reviewer reported a bottle ruined by heat in a mailbox. Drops are smaller and easier. One data point, so a lead, not a theme.
- **Lukaree:** 47 products and 32 ads spread across glutathione, oregano oil, urolithin and soursop. No focus on soursop.
- **Jordan Wellness Co:** no Meta presence found.

## Recommendation

**Tear down Serene Herbs first.** It is the only competitor operating at scale on the one channel Nutrively can run, it sells to the same bloating-and-energy buyer, and it has just launched a drops product.

**The one gap to close this month:** first-order value. See `teardowns/sereneherbs/playbook.md`.

## Paid calls: not run, awaiting approval

| Call | What it adds | Cost |
|---|---|---|
| Serene Herbs full Shopify catalogue | Every product, price, variant and bundle | 10 Ultimate Scraper credits |
| Lukaree full catalogue | Same | 10 credits |
| Nutrively catalogue | Same, for like-for-like comparison | 6 credits |
| Jordan Wellness Co sitemap | Whether the site can be read at all | 25 credits, charged only if URLs are found |
| Traffic curve, 24 months, all four domains (Ahrefs) | The growth curve the Teardown stages need | API units; exact figure not yet read from the tool |
| Same from Semrush | Alternative vendor | Unknown: the permission system blocked even the price lookup |
| Competitor ad creatives and copy (ScrapeCreators) | The actual ads | Needs a ScrapeCreators API key; none is set |
| Similarweb | Traffic and channel mix | Connector failed to connect this session |
