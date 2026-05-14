# Web3 bounty PoC + report skill hub

Cursor **Agent Skill** for Web3 bug bounty workflows: triage, kill-weak-findings tables, Foundry PoC discipline, evidence gates, and report scaffolding. See `skills/web3-bounty-poc-report/SKILL.md`.

## Repository layout

```text
.
├── .github/
│   └── llms.txt              # Pointers for LLM crawlers / docs tools
├── assets/                   # Optional logos (see assets/README.md)
├── examples/                 # Redacted samples + log style references
├── research/                 # Short methodology links (not agent canon)
├── skills/
│   └── web3-bounty-poc-report/
│       ├── SKILL.md          # Agent instructions (YAML frontmatter required)
│       └── references/       # Templates, gates, rubrics
├── LICENSE
├── README.md                 # This file
└── skill.sh                  # Helper: list / install into a target project
```

## Install name (for CLI tables)

| Install name | Folder | Cursor `name` field |
|--------------|--------|---------------------|
| `web3-bounty-poc-report` | `skills/web3-bounty-poc-report` | `web3-bounty-poc-report` |

## Quick install (manual)

Copy `skills/web3-bounty-poc-report/` into your application repository:

```text
your-app/.cursor/skills/web3-bounty-poc-report/SKILL.md
your-app/.cursor/skills/web3-bounty-poc-report/references/...
```

Reload Cursor. Invoke with `/` → search `web3-bounty-poc-report`.

## Quick install (script)

From this repo root (requires Bash: Git for Windows, WSL, macOS, or Linux):

```bash
chmod +x skill.sh
./skill.sh list
./skill.sh install /path/to/your/app
```

The script copies the skill into `TARGET/.cursor/skills/web3-bounty-poc-report`.

## Optional: `npx` skill installers

Ecosystem CLIs differ by vendor. If you use a tool such as `npx skills add owner/repo`, confirm whether it expects the skill at repo root or under `skills/<name>/` and adjust paths accordingly.

## Examples

- `examples/sample-report-redacted.md` — fictional but complete narrative.
- `examples/sample-lead-note.md` — downgraded LEAD format.
- `examples/sample-forge-run-excerpt.md` — evidence presentation style.

## Research folder?

Small `research/` is **recommended** for methodology links only (`research/SOURCES.md`). It is **not** required for the agent: Cursor loads `skills/**/SKILL.md`, not `research/` by default.

## Contributing

Add new examples under `examples/`; keep secrets and real program identifiers out of the repo.

## License

MIT — see `LICENSE`.
