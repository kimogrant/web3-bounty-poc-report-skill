# Evidence bar (what “proven” means here)

## Strong (prefer)

- `forge test` (or Hardhat test) demonstrating end state with assertions.
- Fork pinned to a block; state diffs explained (balances, allowances, ownership).
- Call trace references (Tenderly, `cast run`, Foundry traces) tied to exact external calls.

## Medium (supporting only)

- Static analysis hits (Slither, Aderyn) **plus** a path to reachable code under program scope.
- Hand-written call sequence **with** bytecode/source permalink and storage reasoning.

## Weak (do not ship as standalone proof)

- “It feels wrong” without executable state transition.
- Slither-only with no reachable exploit path.
- Narrative relying on undeclared off-chain events.

## Disclosure hygiene

- No third-party PII, internal URLs, or keys—even in “redacted” screenshots (prefer hashes or synthetic values).
