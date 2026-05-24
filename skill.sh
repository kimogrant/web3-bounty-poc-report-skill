#!/usr/bin/env bash
# skill.sh — list skills in this repo and install into a target project's .cursor/skills/
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_DIR="${ROOT}/skills"
SKILL_NAME="web3-bounty-poc-report"
SKILL_SRC="${SKILLS_DIR}/${SKILL_NAME}"

usage() {
  cat <<EOF
Usage:
  ./skill.sh list
  ./skill.sh install /absolute/or/relative/path/to/target/project

Installs: SKILL.md, references/, examples/, VERSION
  -> <target>/.cursor/skills/${SKILL_NAME}/
EOF
}

copy_skill() {
  local dest="$1"
  mkdir -p "$(dirname "${dest}")"
  rm -rf "${dest}"
  cp -R "${SKILL_SRC}" "${dest}"
  cp "${ROOT}/VERSION" "${dest}/VERSION"
}

cmd="${1:-}"
case "$cmd" in
  list)
    ver="$(tr -d '\r\n' < "${ROOT}/VERSION")"
    echo "${SKILL_NAME} (v${ver})"
    echo "  ${SKILL_SRC}/SKILL.md"
    echo "  references/: $(find "${SKILL_SRC}/references" -name '*.md' | wc -l | tr -d ' ') files"
    echo "  examples/: $(find "${SKILL_SRC}/examples" -maxdepth 1 -name '*.md' | wc -l | tr -d ' ') samples"
    ;;
  install)
    target="${2:-}"
    if [[ -z "$target" ]]; then
      usage
      exit 1
    fi
    abs_target="$(cd "$target" && pwd)"
    dest="${abs_target}/.cursor/skills/${SKILL_NAME}"
    copy_skill "${dest}"
    echo "Installed to ${dest}"
    echo "Reload Cursor, then invoke: /${SKILL_NAME}"
    ;;
  *)
    usage
    exit 1
    ;;
esac
