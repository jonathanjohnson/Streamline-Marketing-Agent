# Streamline-Marketing-Agent
Super skills for marketing

## Plugins

This repo is a Claude Code plugin marketplace (`streamline-marketing`).

| Plugin | What it does | Origin | License |
| --- | --- | --- | --- |
| [webapp-capture](plugins/webapp-capture/README.md) | Demo videos, screenshot sets, component library with design tokens, shadcn/ui map, and visual / code inconsistency audits of any live web app | Vendored unmodified from [legioncodeinc/app-auditor-plugin-claude](https://github.com/legioncodeinc/app-auditor-plugin-claude) v2.0.0 at `eeaf5a6` | AGPL-3.0-or-later ([LICENSE](plugins/webapp-capture/LICENSE.md), [NOTICE](plugins/webapp-capture/NOTICE.md)) |

### Install

Run on your own computer (plugins with local browser capture do not run in cloud sessions):

```
claude plugin marketplace add jonathanjohnson/Streamline-Marketing-Agent
claude plugin install webapp-capture@streamline-marketing
```

Start a new session, then run `/webapp-capture doctor demo` to check Node.js 20.9+, ffmpeg and Python 3.11+.

Guides: [step-by-step docs](plugins/webapp-capture/docs/README.md) or the [branded PDF](plugins/webapp-capture/docs/webapp-capture-usage-guide.pdf).

### Third-party licensing

Everything under `plugins/webapp-capture/` is copyright Legion Code Inc. and stays under AGPL-3.0-or-later. Changes made to those files must be published under the same license. The rest of this repository is not covered by it.
