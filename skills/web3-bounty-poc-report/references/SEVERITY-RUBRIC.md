# Severity rubric (generic — always defer to the program)

Programs disagree. Use this only to **organize your argument**; the final label must match the program’s matrix.

## Ladder (conceptual)

1. **Informational / QA** — Best practices, gas, code clarity, no materialized risk under program model.
2. **Low** — Limited impact, hard prerequisites, or requires privileged roles the program excludes.
3. **Medium** — Material impact to users or protocol state with realistic permissionless path, or contained fund loss.
4. **High** — Direct theft of user funds, protocol insolvency path, or permanent freezing of substantial value.
5. **Critical** — Network-wide or protocol-draining scenarios the program explicitly calls maximum impact.

## What triagers reward

- **Permissionless exploitability** with pinned fork evidence.
- **Closed economic loop**: attacker input → profit after gas/slippage/fees (show math assumptions).
- **Clear root cause** mapped to specific lines and state transitions.
- **Minimal PoC** that fails if the bug is fixed—no hand-wavy scripts.

## Common mismatches

- Confusing **severity** with **novelty**—old bug class can still be Critical if impact is real.
- Confusing **complexity** with **severity**—one-line missing check can be Critical.
