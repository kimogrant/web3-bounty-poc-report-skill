#!/usr/bin/env bash
# skill.sh — list skills in this repo and install into a target project's .cursor/skills/
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_DIR="${ROOT}/skills"

usage() {
  cat <<'EOF'
Usage:
  ./skill.sh list
  ./skill.sh install /absolute/or/relative/path/to/target/project

Copies skills/web3-bounty-poc-report -> <target>/.cursor/skills/web3-bounty-poc-report
EOF
}

cmd="${1:-}"
case "$cmd" in
  list)
    echo "Skills under ${SKILLS_DIR}:"
    find "${SKILLS_DIR}" -maxdepth 2 -mindepth 2 -name SKILL.md -print | sed "s#${SKILLS_DIR}/##;s#/SKILL.md##"
    ;;
  install)
    target="${2:-}"
    if [[ -z "$target" ]]; then
      usage
      exit 1
    fi
    abs_target="$(cd "$target" && pwd)"
    dest="${abs_target}/.cursor/skills/web3-bounty-poc-report"
    mkdir -p "${abs_target}/.cursor/skills"
    rm -rf "${dest}"
    cp -R "${SKILLS_DIR}/web3-bounty-poc-report" "${dest}"
    echo "Installed to ${dest}"
    ;;
  *)
    usage
    exit 1
    ;;
esac
