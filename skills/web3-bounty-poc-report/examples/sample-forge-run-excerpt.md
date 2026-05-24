# Sample `forge test -vvv` excerpt (illustrative)

Not from a real run—shows what reviewers like to see: call order, reverts, and state deltas.

```
[PASS] test_reproduce_share_inflation() (gas: 482391)
Logs:
  Attacker pre-shares: 0
  Victim pre-assets: 1_000_000e18
  ...
Traces:
  DemoVault::deposit
    ├─ ERC20::transferFrom
    ├─ DemoVault::_mint
    └─ Hook::afterDeposit  →  DemoVault::deposit  (reentrancy)
  ...
Assertion: attacker exit value > victim residual (FAILED in patched branch — expected)
```

Pair traces with the narrative sections “Attack path” and “Proof of concept”.
