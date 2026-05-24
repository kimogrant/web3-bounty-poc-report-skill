# Contributing to Web3 Bounty PoC + Report

Contributions welcome from security researchers, wardens, and smart-contract engineers.

## Repository layout

```text
web3-bounty-poc-report-skill/
├── skills/web3-bounty-poc-report/
│   ├── SKILL.md              # Frontmatter, hard rules, pipeline index (keep concise)
│   ├── references/           # Gates, templates, rubrics, changelog
│   └── examples/             # Redacted samples (synthetic only)
├── research/                 # External methodology links (not agent canon)
├── tests/                    # Layout smoke tests
├── VERSION
└── skill.sh                  # Install into .cursor/skills/web3-bounty-poc-report/
```

## Workflow

1. Fork and clone `https://github.com/kimogrant/web3-bounty-poc-report-skill.git`
2. Branch: `git checkout -b feat/triage-gate-wording`
3. Edit the relevant `references/*.md` (not a monolithic SKILL body)
4. If kill signals, hard rules, or pipeline order change, update `SKILL.md` only
5. Add or update an `examples/` sample when report shape or LEAD format changes
6. Bump `VERSION` and `references/changelog.md`
7. Run `python -m unittest discover -s tests -v`
8. Open a PR with `[Kill]` / `[Gates]` / `[PoC]` / `[Report]` / `[Examples]` prefix

## Standards

- **No secrets** — no mnemonics, API keys, real program IDs, or production addresses
- **Synthetic examples only** — use placeholders like `DemoVault`, pinned fictional blocks
- **Program rules win** — skill text must defer to official scope/severity when they conflict
- **EVM scope** — Foundry/Hardhat first; note if adding non-EVM content needs a separate skill
- **Kill before gates** — do not merge tables that blur early exit vs submit-ready checks
- **Linked references** — every `references/*.md` link from `SKILL.md` must resolve

## Installing locally for testing

```bash
./skill.sh install /path/to/sandbox/project
```

Confirm `examples/` and `VERSION` land beside `SKILL.md` under `.cursor/skills/web3-bounty-poc-report/`.

## License

By contributing, you agree your contributions are licensed under the repository MIT license.
