---
name: web3-bounty-poc-report
description: >
  End-to-end Web3 bug bounty protocol for triage, Foundry/Hardhat PoCs, fork discipline,
  severity framing, and reviewer-grade written reports (Immunefi, Cantina, Code4rena,
  Sherlock-style submissions). Use when the user drafts or reviews a vulnerability report,
  proof-of-concept, impact story, economic exploitability, contest submission, warden write-up,
  duplicate risk, scope/out-of-scope questions, mainnet or testnet fork reproduction,
  proxy/storage layout claims, governance or oracle assumptions, remediation suggestions,
  disclosure-safe wording, or asks to "stop wasting time on a weak finding".
---

# Web3 Bounty: PoC and Report Protocol

This skill packages a **submission pipeline**: kill weak ideas early, lock facts, ship a minimal PoC, then expand the narrative. It does **not** replace a program’s official rules—on conflict, follow the **project’s official scope and severity matrix**.

Maintainer notes on how similar public skills are structured: root [README.md](../../README.md#peer-patterns-for-maintainers).

---

## The north-star question (Web3)

> **After state setup that the program considers fair game, can an attacker with the claimed role move value, seize authorization, or permanently freeze third-party funds on-chain—and did you demonstrate it in code or trace-backed steps?**

- If the honest answer is **no** or “only with extra off-chain collusion you did not model,” **stop** before writing a long report. Capture a short LEAD note instead (see below).

Full discard patterns: [references/WEB3-KILL-SIGNALS.md](references/WEB3-KILL-SIGNALS.md).

### LEAD note (downgrade / not submission-ready)

Use this shape so the thread stays actionable. Longer example: `examples/sample-lead-note.md`.

- **Status:** LEAD or stopped
- **Hypothesis:** one sentence on what you thought was wrong
- **Why stopped:** which kill signal or missing gate (cite `WEB3-KILL-SIGNALS.md` / `TRIAGE-GATES.md`)
- **Missing evidence:** what would need to be true or demonstrated to upgrade
- **Facts frozen (if any):** chainId, entry contract, pinned block
- **Next experiments:** bullet checklist

---

## Context gate (ask once if missing)

If the user jumps straight to “write my Immunefi report” without facts, ask the questions in [references/CONTEXT-BEFORE-DRAFT.md](references/CONTEXT-BEFORE-DRAFT.md) **in one message** (numbered list). If they refuse, apply the documented defaults and **state them explicitly** at the top of the draft.

---

## Pipeline (mermaid)

```mermaid
flowchart LR
  S[Read scope + known issues] --> K[Kill signals]
  K -->|survives| F[Freeze facts: chain, addr, proxy, block]
  F --> P[Minimal PoC: forge test]
  P --> V[Evidence bar + gates]
  V --> R[Report from template]
  R --> C[POC checklist + self-diff]
```

---

## Kill signals vs five gates

- **[WEB3-KILL-SIGNALS.md](references/WEB3-KILL-SIGNALS.md)** — fast triage: **before** a long report, decide stop / downgrade / continue. Patterns that usually fail review.
- **[TRIAGE-GATES.md](references/TRIAGE-GATES.md)** — submit-ready checklist: run **after** you have a draft PoC and narrative; each gate must be YES. Printable final pass.

---

## Hard rules (agent must follow)

1. **Never** commit mnemonics, private keys, session cookies, or production API secrets—environment placeholders only (`MAINNET_RPC_URL`, etc.).
2. **Identity bundle** before conclusions: `chainId`, contract addresses, proxy pattern (if any), implementation vs proxy user entry, and **pinned fork block** when relevant.
3. **Scope & duplicates**: cite in-scope category vs program text; explain why not a known issue/design doc. **If something is uncertain**, do not assert it—use explicit wording such as: *“The following requires confirmation from the program: …”* and list concrete questions, not guesses dressed as facts.
4. **Reproducibility**: `git clone` + install + documented command(s); pin tool versions in README.
5. **Honest severity**: separate *speculative* / *privileged* / *permissionless on-chain* / *economic net positive*; align language with [references/SEVERITY-RUBRIC.md](references/SEVERITY-RUBRIC.md) and the program’s own matrix.

---

## Phase A — Triage and scope

- Read **scope, out-of-scope, known issues, rewards, severity definitions** from the program page the user provides.
- Map the finding to the program’s **impact categories** (do not invent labels).
- For governance, multisig, oracle, or off-chain keeper assumptions, label **attacker model** and **trust boundaries**.
- When scope, deployment status, or duplicate status is unclear, add a short **“Requires program confirmation”** block (bulleted questions only—no implied answers).

## Phase B — PoC (Foundry default)

**Stack choice:** If the user’s repo already uses Foundry or Hardhat, **reuse that stack** and match existing layout, scripts, and versions. Use the Foundry path below only when building a **standalone minimal repro** (new folder or fresh repo) or when the user has no test harness yet.

1. Minimal `foundry.toml`; pin Solidity + `forge-std` (document in README).
2. Fork: user-supplied RPC + **pinned `block.number`** in README.
3. Tests named `test_reproduce_*` (snake_case after `test_`, e.g. `test_reproduce_drain_pool`); assertions encode the bug (not `console.log` alone).
4. Skeleton: [references/FOUNDRY-POC-SKELETON.md](references/FOUNDRY-POC-SKELETON.md).
5. If reproduction is partial, add **Limitations** with the closest automated path.

**Hardhat:** match existing scripts; document Node version + fork `blockNumber`.

## Phase C — Evidence and gates

- Evidence expectations: [references/EVIDENCE-BAR.md](references/EVIDENCE-BAR.md).
- Run the **five gates** in [references/TRIAGE-GATES.md](references/TRIAGE-GATES.md) before treating the write-up as submit-ready.

## Phase D — Written report

- Sections: [references/REPORT-TEMPLATE.md](references/REPORT-TEMPLATE.md).
- PoC hygiene: [references/POC-CHECKLIST.md](references/POC-CHECKLIST.md).

## Report tone

- **Executive summary**: 4–8 sentences; impact, prerequisites, why it matters on-chain.
- **Technical body**: permalinks or `path:line` references; optional mermaid for fund/control flow.
- **Remediation**: name the call path and state transitions, not generic buzzwords.

---

## Master checklist (copy into the thread)

```
Bounty workflow progress:
- [ ] Scope: program rules + known issues ingested
- [ ] Kill signals: passed WEB3-KILL-SIGNALS.md
- [ ] Facts: chainId, addresses, proxy, pinned block
- [ ] Evidence bar met (see EVIDENCE-BAR.md)
- [ ] Gates: TRIAGE-GATES.md (all five)
- [ ] PoC: minimal forge test + README pins
- [ ] Report: REPORT-TEMPLATE.md filled
- [ ] Self-check: POC-CHECKLIST.md
```

---

## For humans: installing this skill

**From the published GitHub repository**

1. Copy `skills/web3-bounty-poc-report/` to your app repo as `.cursor/skills/web3-bounty-poc-report/` (create `.cursor/skills` if needed).
2. Or from this monorepo root run: `./skill.sh install /path/to/target/project` (Bash: Git for Windows, WSL, macOS, or Linux).
3. Reload the Cursor window so skills are discovered.

**In Cursor**

- Manual invoke: `/` → search `web3-bounty-poc-report`.
- Optional: Settings → Rules → Remote Rule, if you publish a standalone skills repo and your Cursor version supports it.

**Examples in this repository**

- Redacted report walkthrough: `examples/sample-report-redacted.md`
- Short LEAD (downgraded) note: `examples/sample-lead-note.md`
- Forge log excerpt style: `examples/sample-forge-run-excerpt.md`

See root `README.md` for layout and `research/SOURCES.md` for external methodology links.

---

## Conventions (summary)

| Practice | Why |
|----------|-----|
| One folder per skill | `name` matches folder |
| Orchestrator + `references/` | Tokens stay small; depth loads on demand |
| Kill tables then gates | Kill = early exit; gates = final submit pass |
| Pinned fork + addresses | Reviewers reproduce without guesswork |
