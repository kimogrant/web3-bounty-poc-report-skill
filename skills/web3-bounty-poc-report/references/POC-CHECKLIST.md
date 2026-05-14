# Pre-submission PoC checklist

Agents and human authors should verify every item before marking the submission ready. Pair with [TRIAGE-GATES.md](TRIAGE-GATES.md) and [WEB3-KILL-SIGNALS.md](WEB3-KILL-SIGNALS.md).

## Environment and reproducibility

- [ ] README or notes next to `SKILL.md` state **Solidity version**, **Foundry version** (or Hardhat + **Node version**)
- [ ] Mainnet forks document **user-supplied RPC** and a **pinned `block.number`**
- [ ] No hard-coded private keys; test EOAs use Foundry defaults such as `vm.addr` or `makeAddr`

## Test quality

- [ ] Test names reflect intent (`test_reproduce_*`, snake_case after `test_`)
- [ ] Assertions encode the faulty behavior, not only `console.log` output
- [ ] `forge build` and `forge test` succeed on a clean clone (or document why extra steps are required)

## Narrative alignment

- [ ] Contract addresses, function names, and call ordering in the report **match** the PoC
- [ ] If the report claims “any user can execute,” the PoC attacker EOA has **no** privileged `prank` unless that mirrors a real on-chain prerequisite

## Scope and honesty

- [ ] Checked the program’s **out of scope** list (governance decisions, centralized ops, etc.)
- [ ] Separated **on-chain provable** facts from **speculation**; speculation is labeled as assumptions

## Disclosure hygiene

- [ ] No other users’ data, internal URLs, or sensitive names from non-public branches
