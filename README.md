# Web3 bounty PoC + report skill hub

**Repository:** https://github.com/kimogrant/web3-bounty-poc-report-skill  
**Version:** 1.1.0 · [Changelog](skills/web3-bounty-poc-report/references/changelog.md)

Cursor **Agent Skill** (EVM-focused) for Web3 bug bounty workflows: triage, kill-weak-findings tables, Foundry/Hardhat PoC discipline, evidence gates, and report scaffolding. See `skills/web3-bounty-poc-report/SKILL.md`.

## Repository layout

```text
.
├── .github/
│   └── llms.txt              # Pointers for LLM crawlers / docs tools
├── assets/                   # Optional logos (see assets/README.md)
├── research/                 # Short methodology links (not agent canon)
├── skills/
│   └── web3-bounty-poc-report/
│       ├── SKILL.md          # Agent instructions (YAML frontmatter required)
│       ├── references/       # Templates, gates, rubrics, changelog
│       └── examples/         # Redacted samples + log style references
├── tests/                    # Layout smoke tests (stdlib unittest)
├── VERSION
├── CONTRIBUTING.md
├── README.zh.md
├── LICENSE
├── README.md                 # This file
└── skill.sh                  # Helper: list / install into a target project
```

## Install name (for CLI tables)

| Install name | Folder | Cursor `name` field |
|--------------|--------|---------------------|
| `web3-bounty-poc-report` | `skills/web3-bounty-poc-report` | `web3-bounty-poc-report` |

## Clone

```bash
git clone https://github.com/kimogrant/web3-bounty-poc-report-skill.git
```

## Quick install (script, recommended)

From this repo root (requires Bash: Git for Windows, WSL, macOS, or Linux):

```bash
chmod +x skill.sh
./skill.sh list
./skill.sh install /path/to/your/app
```

The script copies the full skill bundle into `TARGET/.cursor/skills/web3-bounty-poc-report/` — including `references/`, `examples/`, and `VERSION`.

## Quick install (manual)

Copy the entire `skills/web3-bounty-poc-report/` folder into your application repository:

```text
your-app/.cursor/skills/web3-bounty-poc-report/SKILL.md
your-app/.cursor/skills/web3-bounty-poc-report/references/...
your-app/.cursor/skills/web3-bounty-poc-report/examples/...
```

Reload Cursor. Invoke with `/` → search `web3-bounty-poc-report`.

## Optional: `npx` skill installers

Ecosystem CLIs differ by vendor. If you use a tool such as `npx skills add owner/repo`, confirm whether it expects the skill at repo root or under `skills/<name>/` and adjust paths accordingly.

## Examples (inside the skill folder)

- `skills/web3-bounty-poc-report/examples/sample-report-redacted.md` — fictional but complete narrative.
- `skills/web3-bounty-poc-report/examples/sample-lead-note.md` — downgraded LEAD format.
- `skills/web3-bounty-poc-report/examples/sample-forge-run-excerpt.md` — evidence presentation style.

## Audit → bounty pipeline

For a full review workflow, pair with [evm-audit-skill](https://github.com/kimogrant/evm-audit-skill):

1. **evm-audit-recon** — structured scope pack and hypotheses.
2. **evm-audit-triage** — CONFIRMED FINDING or LEAD via four gates.
3. **web3-bounty-poc-report** (this skill) — fork-pinned PoC and submission-ready report.

Details are in the SKILL orchestrator under **Recommended pairing**.

## For maintainers

- Keep `SKILL.md` as a thin orchestrator; put long templates and rubrics under `references/`.
- Tune the YAML `description` deliberately: longer lists improve auto-invocation but cost context tokens.
- Bump `VERSION` and `references/changelog.md` on every release.
- Run layout smoke tests: `python -m unittest discover -s tests -v`

## Research folder

Small `research/` is **recommended** for methodology links only (`research/SOURCES.md`). It is **not** required for the agent: Cursor loads `skills/**/SKILL.md`, not `research/` by default.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

MIT — see `LICENSE`.
