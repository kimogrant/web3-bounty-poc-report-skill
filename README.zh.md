# Web3 赏金 PoC + 报告 Skill

**仓库：** https://github.com/kimogrant/web3-bounty-poc-report-skill  
**版本：** 1.1.0 · [更新日志](skills/web3-bounty-poc-report/references/changelog.md)

面向 **EVM 链上漏洞赏金 / 竞赛提交** 的 Cursor Agent Skill：早筛弱 finding、Foundry/Hardhat PoC 纪律、证据门槛、五道提交闸门、Immunefi / Code4rena 风格报告模板。

---

## 安装（推荐脚本）

```bash
git clone https://github.com/kimogrant/web3-bounty-poc-report-skill.git
cd web3-bounty-poc-report-skill
chmod +x skill.sh
./skill.sh install /path/to/your/project
```

安装到：`your-project/.cursor/skills/web3-bounty-poc-report/`（含 `SKILL.md`、`references/`、`examples/`、`VERSION`）

## 手动安装

将整个 `skills/web3-bounty-poc-report/` 复制到项目的 `.cursor/skills/web3-bounty-poc-report/`。

重载 Cursor 后，用 `/web3-bounty-poc-report` 或描述赏金报告 / PoC 需求即可触发。

---

## 工作流概要

| 阶段 | 参考文件 |
|------|----------|
| 弱 finding 止损 | `references/WEB3-KILL-SIGNALS.md` |
| 提交前上下文 | `references/CONTEXT-BEFORE-DRAFT.md` |
| PoC（默认 Foundry） | `references/FOUNDRY-POC-SKELETON.md` |
| 证据分级 | `references/EVIDENCE-BAR.md` |
| 五道闸门 | `references/TRIAGE-GATES.md` |
| 报告正文 | `references/REPORT-TEMPLATE.md` |

**North-star 问题：** 在程序认可的公平前提下，攻击者能否用链上步骤搬价值/夺权/冻结他人资金，且 PoC 可证？

---

## 与审计 skill 的配合

完整链路建议搭配 [evm-audit-skill](https://github.com/kimogrant/evm-audit-skill)：

1. **evm-audit-recon** — 范围包与假设清单  
2. **evm-audit-triage** — 四门确认 FINDING 或降级 LEAD  
3. **web3-bounty-poc-report** — fork 固定 PoC + 可提交报告  

详见 `SKILL.md` 中的 **Recommended pairing** 一节。

---

## 样例

- `skills/web3-bounty-poc-report/examples/sample-report-redacted.md` — 完整虚构报告  
- `skills/web3-bounty-poc-report/examples/sample-lead-note.md` — LEAD 降级笔记  
- `skills/web3-bounty-poc-report/examples/sample-forge-run-excerpt.md` — 链上证据呈现风格  

---

## 维护者

- 保持 `SKILL.md` 精简；长模板放在 `references/`  
- 发版时更新 `VERSION` 与 `references/changelog.md`  
- 贡献指南：[CONTRIBUTING.md](CONTRIBUTING.md)  

## 许可

MIT — 见 `LICENSE`。
