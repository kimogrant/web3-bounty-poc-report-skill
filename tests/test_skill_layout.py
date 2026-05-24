"""Layout smoke tests for web3-bounty-poc-report skill (stdlib only)."""
import re
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SKILL_DIR = ROOT / "skills" / "web3-bounty-poc-report"
SKILL_MD = SKILL_DIR / "SKILL.md"
REFS = SKILL_DIR / "references"
EXAMPLES = SKILL_DIR / "examples"


class TestSkillLayout(unittest.TestCase):
    def test_version_file_exists(self):
        self.assertTrue((ROOT / "VERSION").is_file())
        self.assertRegex((ROOT / "VERSION").read_text(encoding="utf-8").strip(), r"^\d+\.\d+\.\d+$")

    def test_skill_frontmatter(self):
        text = SKILL_MD.read_text(encoding="utf-8")
        self.assertTrue(text.startswith("---\n"))
        self.assertIn("name: web3-bounty-poc-report", text)
        self.assertIn("description:", text)

    def test_required_references_exist(self):
        required = [
            "WEB3-KILL-SIGNALS.md",
            "TRIAGE-GATES.md",
            "EVIDENCE-BAR.md",
            "REPORT-TEMPLATE.md",
            "POC-CHECKLIST.md",
            "FOUNDRY-POC-SKELETON.md",
            "CONTEXT-BEFORE-DRAFT.md",
            "SEVERITY-RUBRIC.md",
            "changelog.md",
        ]
        for name in required:
            with self.subTest(ref=name):
                self.assertTrue((REFS / name).is_file(), f"missing references/{name}")

    def test_skill_links_resolve(self):
        text = SKILL_MD.read_text(encoding="utf-8")
        links = re.findall(r"\[references/([^\]]+\.md)\]", text)
        links += re.findall(r"\(references/([^)]+\.md)\)", text)
        for name in set(links):
            with self.subTest(link=name):
                self.assertTrue((REFS / name).is_file(), f"broken link: references/{name}")

    def test_examples_exist(self):
        for name in (
            "sample-report-redacted.md",
            "sample-lead-note.md",
            "sample-forge-run-excerpt.md",
        ):
            with self.subTest(example=name):
                self.assertTrue((EXAMPLES / name).is_file())

    def test_examples_referenced_in_skill(self):
        text = SKILL_MD.read_text(encoding="utf-8")
        for name in (
            "sample-report-redacted.md",
            "sample-lead-note.md",
            "sample-forge-run-excerpt.md",
        ):
            with self.subTest(example=name):
                self.assertIn(f"examples/{name}", text)


if __name__ == "__main__":
    unittest.main()
