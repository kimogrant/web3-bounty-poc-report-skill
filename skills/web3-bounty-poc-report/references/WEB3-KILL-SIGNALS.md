# Web3 kill signals (discard or downgrade early)

Use this table **before** investing in a long report. If a row matches, default to **STOP** or **downgrade to LEAD** (short internal note) unless you have new on-chain evidence.

| Pattern | Why it usually dies in triage |
|---------|-------------------------------|
| “Could theoretically reenter…” but no state mutation / no value | Theoretical reentrancy without impact |
| Bug only in `test/` or unused `legacy/` contracts | Not deployed / not reachable |
| Needs deployer EOA key, multisig, or social engineering | Centralized threat model—check program rules |
| Requires arbitrary governance vote with no economic story | Often out-of-scope or informational |
| Oracle “wrong price” without concrete manipulation path + numbers | Speculative market risk |
| “Wrong ERC20 returns false” on a trusted admin-only list | Impact may be none if no untrusted tokens |
| Storage collision claim without layout diff + slot math | Unproven |
| Proxy confusion: citing implementation-only behavior users cannot hit | Wrong entry point |
| Flash loan “attack” where attacker net PnL ≤ 0 after fees/slippage | Economic non-viability |
| Same root cause as a disclosed audit finding | Duplicate |
| PoC uses privileged `prank` while report says “any user” | Narrative/PoC mismatch |

**Rule:** If you cannot point to a **permissionless call sequence** (or explicitly scoped privileged role the program cares about) that moves value or auth, you do not yet have a bounty-grade story.

If the row still looks plausible, freeze facts and build a PoC—then run the **five gates** in [TRIAGE-GATES.md](TRIAGE-GATES.md) before submission.
