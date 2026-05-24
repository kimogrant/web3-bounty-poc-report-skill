# [CRITICAL] Unauthorized share-price inflation in DemoVault deposit path

> **Fictional example** for formatting practice. Addresses and numbers are placeholders.

## Executive summary

- **Impact**: Any EOA can mint excess vault shares on deposit when the vault’s `totalAssets()` briefly mis-accounts pending withdrawals, leading to slow-draining user TVL.
- **Prerequisites**: Permissionless caller; no governance; requires a specific ordering of `enter/leave` in the same block (shown in PoC).
- **Severity claim**: Matches program matrix “Theft of user funds” via share inflation (pending triager confirmation).

## Scope and duplicate submission

- **In-scope basis**: `DemoVault` on chain ID `999999` (testnet fork only in PoC README).
- **Delta vs known issues**: Audit appendix C mentions rounding but not the reentrancy window; see diff vs commit `abc1234`.

## Affected components

| Field | Value |
|-------|--------|
| Chain ID | 999999 (PoC only) |
| Contract (entry point) | `0x000000000000000000000000000000000000dEaD` |
| Implementation (if proxy) | n/a (immutable in example) |
| Version / commit / tag | `demo-vault@1.0.0` |

## Technical description

### Root cause

`deposit()` updates shares before `totalAssets()` observes finalized withdrawal queue state, combined with an external call that allows a nested `deposit`.

### Attack path (stepwise)

1. Attacker opens a minimal deposit to obtain shares.
2. Attacker triggers a nested `deposit` through the ERC4626-compatible hook path while `pendingWithdraw` is nonzero.
3. Attacker redeems shares at an inflated rate, draining residual liquidity.

### Code references

`DemoVault.sol:deposit` — nested call at line ~120 (replace with real permalink in actual submissions).

## Economic analysis

- **Attacker PnL sketch**: +3200 USD equivalent under PoC assumptions (fees 0.3%, gas 2M @ 30 gwei).
- **Sensitivity**: Attack collapses if `pendingWithdraw` forced to zero before external calls.

## Proof of concept (PoC)

- **Repository location**: `poc/demo-vault/` (fictional path)
- **Reproduction command**:

```bash
export MAINNET_RPC_URL=... # or testnet RPC in this example
forge test --match-test test_reproduce_share_inflation -vvv
```

- **Expected outcome**: Assertion `attackerValue > victimValue` after single-block sequence.

## Remediation

1. Reorder accounting so `totalAssets()` reflects queue finalization before share mint.
2. Add non-reentrant guard on `deposit`/`mint` if external hooks remain.
