# Context questions (single message, before drafting)

If the user has not provided the items below, ask **once** as a numbered list (not a giant form):

```
Before I draft the submission, I need:

1. **Program link or pasted scope** — What chain(s), contracts, and impacts are in-scope?
2. **Exact target** — Proxy address vs implementation? Any user-facing router?
3. **Solidity / toolchain** — Version and Foundry/Hardhat preference?
4. **Fork height** — If mainnet state matters, which pinned block should reviewers use?
5. **Known issues** — Audits, previous contests, FAQ items to diff against?
6. **Threat model** — Permissionless EOA only, or is a compromised keeper/guardian in scope?
```

## Defaults if the user says “just write it”

State these explicitly at the top of the draft:

| Missing input | Safe default | Risk |
|---------------|--------------|------|
| Scope | User-pasted contracts only | May be out-of-scope |
| Toolchain | Foundry latest stable in README | Version skew |
| Chain | Ethereum mainnet assumptions | Wrong for L2-only code |
| Fork block | “Reviewer must pin block locally; PoC uses latest at time of writing” | Less reproducible |
| Threat model | Permissionless EOA attacker | May overstate impact |
