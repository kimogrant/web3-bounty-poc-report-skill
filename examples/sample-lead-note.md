# LEAD — DemoVault “weird share price” (downgraded)

**Status:** LEAD / not submission-ready  
**Why stopped:** Kill signal — economic loop not closed (attacker PnL ≤ 0 after fees in mainnet fork at pinned block 19,000,000).  
**What would change verdict:** Show positive net with liquidity depth from DEX pool X and include pinned fork + assertions.

**Facts frozen**

- Chain ID: 1 (example)
- Target: `DemoRouter` placeholder
- Block: 19,000,000

**Next experiments**

- [ ] Model liquidity with Uniswap v3 pool state at same block
- [ ] Remove privileged `prank` or justify on-chain role
