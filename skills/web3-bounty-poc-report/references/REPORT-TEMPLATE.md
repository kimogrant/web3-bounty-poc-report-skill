# Vulnerability report template (Markdown)

> Rename sections to match the target platform’s form fields; delete sections that do not apply.

## Title

[One line: vulnerability class + affected module or contract]

## Executive summary

- **Impact**: (whose funds/permissions/service; repeatable on-chain or not)
- **Prerequisites**: (anonymous attacker / privileged role / external price deviation, etc.)
- **Severity claim**: (one sentence tied to the program’s impact matrix)

## Scope and duplicate submission

- **In-scope basis**: (chains, contracts, product lines)
- **Delta vs known issues/docs**: (FAQ, audits—compare explicitly)
- **Requires program confirmation** (optional; use when uncertain): bullet list of **questions only**—do not state unverified claims as facts

## Affected components

| Field | Value |
|-------|--------|
| Chain ID | |
| Contract (entry point) | |
| Implementation (if proxy) | |
| Version / commit / tag | |

## Technical description

### Root cause

(Pick one primary: incorrect state, missing access control, trusted external input, oracle misuse, signature replay, cross-chain message validation, etc.; list secondary factors if needed.)

### Attack path (stepwise)

1. …
2. …
3. …

### Code references

(Verified source snippets or permalinks; for proxies, document the `delegatecall` path.)

## Economic analysis (if applicable)

- **Attacker PnL sketch**: (assumptions: TVL, fees, slippage, gas)
- **Sensitivity**: which parameter shifts invalidate the attack

## Proof of concept (PoC)

- **Repository location**: (this PR / subdirectory link)
- **Reproduction command**:

```bash
export MAINNET_RPC_URL=...
forge test --match-test test_reproduce_<scenario> -vvv
```

- **Expected outcome**: how pass/fail or assertions demonstrate the bug

## Remediation

1. …
2. …

## Timeline (optional)

- Discovery date (if disclosable)
- Coordination notes with the project (no confidential content)
