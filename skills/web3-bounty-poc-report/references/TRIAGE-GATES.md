# Five gates (run in order; each answer must be YES to proceed)

This is the **submit-ready** pass: use after you have a draft PoC and narrative. For **early triage** (stop vs continue before investing in a long write-up), use [WEB3-KILL-SIGNALS.md](WEB3-KILL-SIGNALS.md) first—different purpose, complementary.

**Gate 1 — Scope:** Is every touched contract/chain explicitly in the program’s active scope?

**Gate 2 — Factuality:** Are addresses, proxy pattern, and compiler version verified against explorer or repo tag?

**Gate 3 — Permission model:** Does the PoC’s attacker match the story (no hidden `prank` privileges)?

**Gate 4 — Economic story (if funds):** Is net attacker PnL positive under stated assumptions, or is non-economic impact clearly in-scope?

**Gate 5 — Duplicate sweep:** Did you compare against audits, prior contests, and obvious GitHub issues/README caveats?

If any gate is **NO**, fix or downgrade before submission.
