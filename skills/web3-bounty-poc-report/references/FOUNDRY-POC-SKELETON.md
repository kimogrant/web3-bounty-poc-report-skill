# Foundry PoC skeleton (adapt names)

## `foundry.toml` (minimal)

```toml
[profile.default]
src = "src"
out = "out"
libs = ["lib"]
solc_version = "0.8.20"
```

## `README.md` (must include)

- Solidity + Foundry versions
- `MAINNET_RPC_URL` (user-provided) and **pinned block number**
- Exact command: `forge test --match-test test_reproduce_<Name> -vvv`

## `test/Reproduce.t.sol` (pattern)

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";

contract ReproduceTest is Test {
    function setUp() public {
        vm.createSelectFork(vm.envString("MAINNET_RPC_URL"), <PINNED_BLOCK>);
        // deploy wrappers or `vm.etch` only if justified and documented
    }

    function test_reproduce_<Name>() public {
        // arrange attacker + victim balances as needed
        // act: single callable sequence mirroring the report
        // assert: balances / ownership / revert reason
    }
}
```

## Notes

- Prefer **real mainnet contracts** via fork over reimplemented mocks unless scope requires mocks.
- If using `vm.prank`, state **why** that address is callable on-chain for a normal user.
- Keep tests **one scenario per test**; add more tests instead of giant logs.
