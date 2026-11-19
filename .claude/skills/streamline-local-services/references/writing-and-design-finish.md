# Writing and Design Finish

Six third-party skills handle the last pass on copy and UI. They overlap, so use them in this order rather than letting all of them fire on the same draft.

## Writing

| Situation | Skill | Why this one |
|---|---|---|
| Drafting new copy from scratch (ads, pages, emails, GBP posts, social) | `anti-ai-slop-writing` as constraints while drafting, alongside the upstream skill doing the job (`copywriting`, `ad-creative`, `emails`, `social`) | A blacklist applied up front: banned words, phrases, openers, structural patterns. It also flags invented statistics and fabricated quotes. |
| A draft the agent or another AI wrote that still reads generic | `humanizer` | Full rewrite against a numbered pattern list, with a check that no fact, number, or claim was dropped. Give it a client writing sample when one exists; the sample overrides its rules. |
| A draft the client or a team member wrote | `no-ai-slop` | Minimum effective edit that keeps the writer's voice. Use its detect mode for "does this read as AI?" audits: it names patterns and quotes lines instead of scoring. |
| Ordinary tightening, proofreading, content refresh | upstream `copy-editing` | Not an AI-pattern problem. |

Rules for all of them:

- One pass, one skill. Don't chain `humanizer` after `no-ai-slop` on the same text; repeated rewrites drift from the brief and from the client's voice.
- Voice comes from the client context (`Brand Voice`, `Customer Language`). Where a skill's style rule conflicts with a documented client voice, the client voice wins.
- These edit for human readers. None of them makes text pass AI detectors, and that is not a goal to promise a client.
- **Run the vertical compliance pass after the rewrite, not before.** Rewriting can strip or soften required language: financing disclosures, "results vary", license numbers, pesticide label framing, trademark marks. Check they survived, and restore them verbatim if not.
- Never let a rewrite add a claim, number, review quote, or guarantee that isn't in the client context.

## Design

| Situation | Skill | Notes |
|---|---|---|
| Polishing a built page or component (Lovable, WordPress theme, landing page code) | `make-interfaces-feel-better` | Instruction-only. Radius, alignment, shadows, type, motion, hit areas, icon states. Express fixes in the project's existing styling system. |
| Choosing and placing icons | `better-icons` | Needs the `better-icons` CLI (npm) and network access to `api.iconify.design`. Pull real SVGs instead of hand-drawing them; keep to one icon set per site and check the set's license before client use. |
| Exploring page, deck, or graphic directions on a canvas | `superdesign` | Third-party hosted service. See the gate below. |

### Superdesign gate

`superdesign` is not a local skill: it runs `npx @superdesign/cli@latest`, requires the user to log in to a Superdesign account, uploads selected source files, logos, and reference images to superdesign.dev, opens a browser canvas, and spends account credits per generation. Its description triggers on almost any design request. In this repo:

- Do not start it on your own. Use it only when the user asks for Superdesign by name, or approves it after you offer it.
- Before the first run for a client, tell the user which files and brand assets would be uploaded and get a yes. Client context files (`clients/<slug>/product-marketing.md`) are never passed as context.
- For everything else, design with the local route: `copywriting`/`cro` for structure, the build tool (Lovable, WPvibe), then `make-interfaces-feel-better`.
