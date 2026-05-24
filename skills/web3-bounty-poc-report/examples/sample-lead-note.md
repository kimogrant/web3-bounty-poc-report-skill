# LEAD — DemoVault “weird share price” (downgraded)

**Status:** LEAD / not submission-ready  
**Hypothesis:** Share price rounding lets an attacker dilute LPs at deposit boundaries.  
**Why stopped:** Kill signal — economic loop not closed (attacker PnL ≤ 0 after fees in mainnet fork at pinned block 19,000,000).  
**Missing evidence:** Positive net PnL with liquidity depth from DEX pool X at the same block; remove or justify privileged `prank`.

**Facts frozen**

- Chain ID: 1 (example)
- Target: `DemoRouter` placeholder
- Block: 19,000,000

**Next experiments**

- [ ] Model liquidity with Uniswap v3 pool state at same block
- [ ] Remove privileged `prank` or justify on-chain role
