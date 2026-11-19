# Pool Service: Route Growth Score Funnel

Agency lead gen funnel for pool service owners, modeled on the Hormozi roadmap mechanic: a short intake returns a personalized diagnosis, the answers qualify the lead, and qualified leads go to a VSL and calendar.

Bracketed items are placeholders to set before launch: `[REVENUE_FLOOR]`, `[ENTRY_PRICE]`, `[CASE_STUDY]`, `[CALENDAR_LINK]`.

---

## 1. The magnet

**Name:** Route Growth Score

**Promise:** A free scored report showing how many pool service searches happen in your service area each month, how many of them your company shows up for, and which three fixes add recurring stops fastest.

**Why this angle:** pool owners think in routes, stops per day and drive time, not "leads". Recurring weekly service is the asset; one-time green pool cleanups and tire-kickers are the pain. The report speaks to density and recurring revenue, not traffic.

---

## 2. Landing page

**Headline:** How many weekly pool customers is your market handing to competitors?

**Subhead:** Answer 5 questions. Get a scored report on your Google visibility, reviews, ads and website against the three companies taking the most pool service calls in your area. Free, delivered within one business day.

**Bullets:**
- The exact searches in your service area you are not showing up for
- A map of where you rank across your routes, block by block
- How your review count and pace compare to the top three
- The three fixes most likely to add recurring stops in the next 90 days

**CTA button:** Get My Route Growth Score

**Under the button:** No call required to get the report.

**Proof strip:** `[CASE_STUDY]` one line, one number, one named market.

---

## 3. Intake questions

One question per screen, contact details last.

| # | Question | Options |
|---|---|---|
| 1 | What makes up most of your revenue? | Weekly maintenance / Repairs and equipment / Renovation and builds / Even mix |
| 2 | What did the business do in revenue last year? | Under $250k / $250k-$500k / $500k-$1M / $1M-$3M / $3M+ |
| 3 | Where do most new customers come from today? | Referrals / Google Maps and search / Paid ads / Lead sites (Angi, Thumbtack) / Door hangers and yard signs / Bought routes |
| 4 | What matters most in the next 12 months? | Tighten existing routes / Add techs and routes / More repair and equipment jobs / Get ready to sell |
| 5 | What do you spend on marketing per month? | Nothing / Under $1k / $1k-$3k / $3k-$7k / $7k+ |

**Contact screen:** first name, company name, website, main city or zip served, email, mobile.

### Routing

| Tier | Rule | Path |
|---|---|---|
| A | Revenue at or above `[REVENUE_FLOOR]` and goal is not blank | Results page with VSL and calendar, report by email, rep SMS within 5 minutes |
| B | One band below the floor, or spend is "Nothing" with a growth goal | Report by email, nurture sequence, calendar offered in email 4 |
| C | Under $250k | Report by email, DIY checklist, long-term list |

"Get ready to sell" at $1M+ is tagged separately: the pitch there is documented lead flow raising the multiple.

---

## 4. Scoring model

100 points, five pillars of 20. Each pillar is scored against the top three local competitors, not an abstract standard.

| Pillar | What is measured | Source |
|---|---|---|
| Map visibility | Geo-grid rank for "pool service", "pool cleaning", "pool repair" across the service area | GMB Crush geo grid |
| Organic search | Ranking keywords and traffic for service plus city terms; missing service and city pages | Ahrefs |
| Reputation | Review count, rating, reviews in last 90 days, owner replies | GBP data |
| Paid presence | Active Local Services Ads, search ads, Meta ads versus competitors | Ad libraries, SERP check |
| Conversion | Click-to-call, quote form, service area pages, mobile speed, response time to a test inquiry | Site check, test submission |

**Bands:** 0-39 Invisible, 40-59 Leaking, 60-79 Competitive, 80-100 Dominant.

---

## 5. Report template

1. **Your score:** total, band, and one sentence on what it means in stops.
2. **Market demand:** monthly searches in the service area by category (weekly service, green pool cleanup, repair, equipment).
3. **Where you show up:** geo-grid map with the routes that are dark.
4. **You versus the top three:** one table, five pillars, four columns.
5. **Money left on the table:** searches missed x conservative close rate x their average monthly ticket x 12. Show the math, use their numbers where given.
6. **Three fixes, in order:** each with effort, expected time to impact, and whether it can be done in-house.
7. **Next step:** tier A gets the calendar; tiers B and C get the checklist.

Keep it to two pages. The table in section 4 is the page people screenshot.

---

## 6. Results page and VSL (tier A)

**Headline:** Your report is being built. Watch this while you wait.

**VSL outline, 5 to 7 minutes:**
1. The pattern: most pool companies grow on referrals until routes get scattered and drive time eats margin.
2. Why lead sites and one-off ads make it worse: one-time cleanups, price shoppers, no density.
3. The alternative: own the map in the zips you already drive, so new stops land next to existing ones.
4. Proof: `[CASE_STUDY]` with before and after stops or calls.
5. How working together runs: the 90-day plan, what happens in each month.
6. Objections: burned by an agency before, contracts, off-season, "I get enough referrals".
7. Ask: book the 20-minute report walkthrough.

**Calendar:** `[CALENDAR_LINK]` directly under the video.

---

## 7. Email sequence

Plain text, from a named person, one idea each.

**Email 1, immediately. Subject: Your Route Growth Score**

> {first_name}, your report for {company} is attached.
>
> You scored {score} out of 100, which puts you in the {band} band. The short version: there are about {monthly_searches} pool service searches a month in {city}, and you appear for roughly {visible_pct} percent of them.
>
> Page 2 has the three fixes I would make first, in order.
>
> If you want me to walk through it with you, grab 20 minutes here: [CALENDAR_LINK]
>
> {sender}

**Email 2, day 1. Subject: the map on page 1**

> {first_name}, look at the grid map in your report. Green dots are where you show up in the top three on Google Maps. Red is where you do not exist.
>
> Most owners expect it to be green around the shop. What matters is whether it is green where your trucks already are. A new weekly customer two streets from an existing stop is worth far more than one 25 minutes away.
>
> The fix is usually three things: the right primary category, service area set to the zips you want, and reviews that mention those neighborhoods. All three are free.
>
> {sender}

**Email 3, day 3. Subject: {top_competitor} has {review_gap} more reviews than you**

> {first_name}, in your report {top_competitor} has {competitor_reviews} reviews to your {own_reviews}, and added {competitor_90d} in the last 90 days.
>
> Pace matters more than the total. Google rewards recent reviews, and so do homeowners choosing who gets a gate code.
>
> The simplest system: the tech texts a review link from the driveway after the first month of service, when the pool looks its best. Companies that do only this usually double their pace.
>
> {sender}

**Email 4, day 5. Subject: what happened at [CASE_STUDY company]**

> {first_name}, [CASE_STUDY]: where they started, what we changed in the first 90 days, and the result in new weekly stops.
>
> Their starting score was close to yours.
>
> If you want the same plan built for {company}, the walkthrough is 20 minutes: [CALENDAR_LINK]
>
> {sender}

**Email 5, day 8. Subject: the problem with green pool leads**

> {first_name}, most paid pool leads are one-time cleanups. They pay once, argue about the price, and never convert to weekly.
>
> The companies that win treat the cleanup as the front door: quote it with the first month of weekly service included, and let the customer opt out, not in. Ads and pages built around that offer bring in a different customer.
>
> Your report shows whether you are even visible for those searches. Page 1, second table.
>
> {sender}

**Email 6, day 12. Subject: should I close your file?**

> {first_name}, I have not heard back, so I will assume the timing is off.
>
> The report is yours to keep and the three fixes on page 2 can all be started in-house.
>
> If you want help before the season turns, this link stays open: [CALENDAR_LINK]
>
> {sender}

**SMS, tier A only:**
- Minute 5: "{first_name}, it's {sender} at Streamline Results. Building your Route Growth Score for {company} now. Which zips matter most to you?"
- Day 2: "Your report is in your inbox. Page 1 map is the one to look at. Want me to walk you through it?"
- Day 6: "Still happy to go through your score. 20 min: [CALENDAR_LINK]"

After day 12, move everyone to a monthly email: one teardown of a real pool company's local presence per issue.

---

## 8. Entry offer

**Route Density Plan, `[ENTRY_PRICE]`, fixed scope, credited toward the retainer if they continue.**

- Full version of the report across every zip served
- GBP rebuild and review system installed
- Service and city page plan with the first three pages written
- 90-day ad plan built around the cleanup-to-weekly offer

This is the workshop equivalent: a paid, low-risk first step that proves competence before the retainer conversation.

---

## 9. Traffic

**Short-form hooks (teardown format, real local companies, anonymized or with permission):**
- "This pool company has 400 customers and does not show up on Google two miles from its own shop."
- "Three pool companies in {city}. One gets most of the calls. Here is the only difference."
- "Why your green pool leads never turn into weekly customers."
- "Your routes are scattered because of where your reviews come from."

Every video ends with the same line: "Get your Route Growth Score, link in bio."

**Paid:** Meta lead-to-landing-page campaigns targeting pool service owners by job title and interest, using the best-performing teardown as creative. Retarget landing page visitors and report openers with the case study.

**Outbound:** build the list from Google Maps by metro, run the score for each company before contact, and open with their number: "{company} scored 46 on local visibility against {competitor}'s 81. Want the report?"

**Timing:** push hardest in the eight weeks before season opens in each market; Sun Belt markets run year-round.

---

## 10. Numbers to watch

| Metric | What it tells you |
|---|---|
| Landing page to completed intake | Whether the promise and question count are right |
| Share of intakes in tier A | Whether targeting reaches companies above the floor |
| Tier A to booked call | Whether the report and VSL do the selling |
| Show rate | Whether the SMS and reminders work |
| Call to entry offer | Whether the offer is priced and scoped correctly |
| Entry offer to retainer | Whether the first 90 days deliver |

Judge the funnel over a full quarter. A value-led magnet pays back slower than a direct "book a call" ad and converts at a higher rate once it does.
