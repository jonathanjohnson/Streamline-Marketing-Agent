# CMO Brief: Serene Herbs against Nutrively

2026-11-19. Applies the Marketing Agent Framework to the one competitor that has a playbook.

## Inputs, and what is missing

| Input | Status |
|---|---|
| 1. `playbook.md` | Exists for Serene Herbs only, and it is a partial, free-source pass with no growth curve. Lukaree and Jordan Wellness Co have no playbook. |
| 2. Agent Reach pull (posts, comments, Reddit, YouTube transcripts) | **Empty.** Reddit, YouTube and web channels all failed again today; this environment blocks those hosts. |
| Substitute for input 2 | Web-search summaries of Trustpilot, Loox, Walmart and BBB reviews, saved in `audience.csv`. These are summaries, not the reviews themselves, mostly undated, and no Reddit thread or video was found. |

So "what real customers said" below rests on review summaries. Treat every audience line as weaker than it would be from a read thread.

## 1. Merged timeline: Serene Herbs

| Date | Move or voice | Type | Link |
|---|---|---|---|
| 2026-01-18 | Customer order never arrives; refunded later | Voice | https://www.trustpilot.com/review/sereneherbs.com?page=10 |
| 2026-01 to 2026-04 | Third-party "review" blog posts appear | Move (who wrote them: not found) | https://nerdfitnesshub.blogspot.com/2026/01/serene-herbs-soursop-bitters-review.html |
| 2026-02-08 | Disputed order refunded, $132.80 | Voice | https://www.trustpilot.com/review/sereneherbs.com?page=3 |
| 2026-02-15 | $59.99 order not received after 10+ days | Voice | https://www.trustpilot.com/review/sereneherbs.com?page=5 |
| 2026-10-02 | Oldest active Soursop Bitters ad, still running | Move | https://www.facebook.com/ads/library/?id=1747329500728132 |
| 2026-11-06 | Black Friday ads start | Move | https://www.facebook.com/ads/library/?id=30174222302167200 |
| 2026-11-09 | Soursop Daily Gut Drops ads first seen | Move | https://www.facebook.com/ads/library/?id=1465638939026819 |
| 2026-11-18 to 19 | Four bulk ad batches across four pages | Move | https://www.facebook.com/ads/library/?id=1845705606569667 |
| Undated | "Only thing working for my bloating", after 8+ weeks | Voice | https://www.loox.io/s/bd7Eo8cZZx |
| Undated | Bitter taste; bottle ruined by heat in a mailbox | Voice | https://www.trustpilot.com/review/sereneherbs.com?page=4 |
| Undated | One reviewer felt a subscription signup was hidden | Voice | https://www.trustpilot.com/review/sereneherbs.com?page=3 |
| Undated | BBB: 31 complaints in 3 years | Voice | BBB profile, in `audience.csv` |

The voices cluster in early 2026 and the visible ad moves in late 2026, so they do not overlap in time. No customer reaction to the current ads was found.

## 2 and 3. Each play checked against the audience

| Play from the playbook | Moves say | Audience says | Verdict |
|---|---|---|---|
| Bundle ladder to raise first-order value | **Proof:** "Save up to 63%" in the headline of most ads | **Proof, thin:** real orders of $59.99 and $132.80; relief described as gradual over 8+ weeks, which a single bottle does not cover | **Keep** |
| Guarantee in every ad | **Proof:** in 86% of ads | **Mixed:** refunds do get paid, but after delays and disputes. Nutrively's own reviewers report ignored emails | **Keep only with working support.** A guarantee customers cannot claim makes things worse |
| Fix checkout and support | **Proof (own data):** click-to-order rate fell from 2.76% to about 2% | **Proof:** Nutrively reviewers report subscription charges, no way to cancel, no replies | **Keep, and move up** |
| Brand page instead of persona pages | **Proof:** competitors advertise under the brand name | **Proof, thin:** Nutrively reviewers call it a scam and name a different company as the seller | **Keep** |
| Rebuild creative volume | **Proof:** 1,617 active ads; own click-through fell from 5.95% to 3.47% | **Silent.** No comments or threads on any ad were read | **Keep on own-account proof.** The audience half is a guess |
| Drops as the easier format | **Guess:** competitor only just launched drops | **Proof, thin:** bitter taste, two tablespoons, heat-damaged bottle | **Keep as an ad angle**, not a play of its own |
| Black Friday now | **Proof:** competitor live since Nov 6 | **Silent** | **Keep, low rank.** Depends on the offer |
| Reviews in ads | **Proof:** only 5% of competitor ads use reviews | **Against:** a third-party tool flags the competitor's Amazon reviews as possibly inflated, and the search summary says several favourable Nutrively reviews read alike | **Drop** until there is a base of genuine reviews |

## 4. Ranking for this month

Constraints used: Meta only, USD 60k a month, cost-per-order cap USD 52. Team size and who builds pages and creative: MISSING, so effort is estimated for a small team.

| Rank | Play | Ships in | Cost | Why here |
|---|---|---|---|---|
| 1 | Fix checkout, cancellation and support; move to the brand page | Days | Low | Strongest audience proof, and every other play makes things worse without it |
| 2 | Bundle ladder | A week | Low | The cap cannot work at a CAD 53 first order |
| 3 | Creative batch with the guarantee and the drops angle | A week | Production time | Addresses the click-through fall |
| 4 | Black Friday layer | Days after 2 | Low | Only a date wrapper on the offer |

## 5. Top three

### 1. Make the purchase safe to complete
- **Insight:** customers are not complaining about the product. They are complaining about being charged again, not being able to cancel and not getting an answer.
- **Proof:** Nutrively Trustpilot summaries (https://ie.trustpilot.com/review/nutrively.com, https://it.trustpilot.com/review/nutrively.com), undated. Own account: click-to-order rate 2.76% in Oct 2025, 1.97% in Nov 2026.
- **Guess:** that the checkout is the cause of the falling rate. The page has not been read.
- **Build task (skill: `cro`, then `churn-prevention`):**
  "Use the cro skill on the Nutrively product page and checkout. I will paste screenshots of the product page, cart and checkout. Find every place a subscription is selected by default or not stated in plain words next to the price, and rewrite those elements so one-time purchase is the default and any subscription shows its price, interval and how to cancel. Then use churn-prevention to write a self-serve cancellation flow and three support reply templates: cancel, refund, where is my order."
- **Needs from you:** the screenshots. The site is blocked from this environment.

### 2. Sell a longer supply
- **Insight:** the competitor sells a multi-bottle first order, and its own customers describe results as taking two months. One bottle at CAD 53 is the wrong unit for the customer as well as for the margin.
- **Proof:** headlines in the Meta Ad Library, 2026-11-19; order values of $59.99 (2026-02-15) and $132.80 (2026-02-08) in Trustpilot summaries; own order value CAD 51 to 54 for 16 months.
- **Guess:** that Nutrively buyers will take a three-bottle offer at the same rate. Untested.
- **Build task (skill: `offers`):**
  "Use the offers skill. Design a 1/3/6-bottle ladder for Soursop Green Drops with a first-order target above CAD 110, honest per-bottle savings against the price actually charged today, a free-shipping threshold at the middle tier and a money-back guarantee with a stated number of days. Inputs: unit cost [ ], shipping cost [ ], current price [ ], repeat-order rate [ ]. Output the three tiers, the headline saving, and the margin per tier."
- **Needs from you:** the four inputs.

### 3. Thirty ads built on what customers said
- **Insight:** the audience gives three angles the competitor's format cannot use: no bitter taste to get used to, a dropper instead of two tablespoons, a small bottle that ships easily.
- **Proof:** taste and heat-damage reviews (Walmart listing; https://www.trustpilot.com/review/sereneherbs.com?page=4), undated; own click-through 5.95% to 3.47%.
- **Guess:** that these angles beat bloating and energy. That is what the batch tests.
- **Build task (skill: `ad-creative`, finished with `anti-ai-slop-writing`, then the compliance check):**
  "Use the ad-creative skill. Write 30 Meta ads for Soursop Green Drops: six angles (occasional bloating, daily energy, 10-second dropper routine, four ingredients in one, easier than bitters, money-back guarantee), five hooks each. Structure/function claims only, no disease, parasite, detox or weight claims, no wording that implies the viewer has a condition. Fixed headlines: 'Save Up to [X]% on Soursop Green Drops Today' and 'Try It Risk-Free for [N] Days'. Do not name Serene Herbs. End each with the FDA disclaimer."
- **Can run today** with placeholders for X and N.

## Start this week

**Play 1, the checkout and support fix.** This replaces the bundle ladder I put first in the playbook. The audience evidence is what changed it: a bigger first order and a louder guarantee, sent into a checkout that customers say charges them again and a support inbox that does not answer, produces refunds, disputes and worse reviews faster.

## Skip

- **Reviews in ads**, until the reviews are genuine and verifiable. If any current reviews were incentivised or templated, remove them; FTC rules prohibit fake or undisclosed incentivised reviews.
- **Parasite, detox, weight and "flush" claims.**
- **Matching 1,617 ads.**
- **Raising spend to USD 60k** before cost per order is under the cap.
- **Any conclusion about Lukaree or Jordan Wellness Co.** Neither has a playbook or an audience pull.
