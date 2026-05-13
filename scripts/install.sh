#!/usr/bin/env sh
set -eu

SCOPE="${1:-user}"
PROJECT_ROOT="${2:-}"
SKILL_NAME="goal-todo"
SCRIPT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
REPO_ROOT="$(CDPATH= cd -- "$SCRIPT_DIR/.." && pwd)"

copy_skill_files() {
  src_root="$1"
  dst_root="$2"
  for entry in SKILL.md README.md LICENSE CONTRIBUTING.md .gitattributes .gitignore agents references examples scripts; do
    if [ -e "$src_root/$entry" ]; then
      cp -R "$src_root/$entry" "$dst_root/"
    fi
  done
}

if [ "$SCOPE" = "user" ]; then
  BASE_DIR="${CODEX_HOME:-$HOME/.codex}/skills"
elif [ "$SCOPE" = "project" ]; then
  if [ -z "$PROJECT_ROOT" ]; then
    echo "project scope requires a project root path as the second argument" >&2
    exit 1
  fi
  BASE_DIR="$PROJECT_ROOT/.agents/skills"
else
  echo "usage: sh scripts/install.sh [user|project] [project-root]" >&2
  exit 1
fi

TARGET_DIR="$BASE_DIR/$SKILL_NAME"
mkdir -p "$BASE_DIR"
rm -rf "$TARGET_DIR"
mkdir -p "$TARGET_DIR"
copy_skill_files "$REPO_ROOT" "$TARGET_DIR"

echo "Installed $SKILL_NAME to: $TARGET_DIR"
echo "Restart Codex, then try: \$goal-todo help me turn this vague task into a /goal prompt"
