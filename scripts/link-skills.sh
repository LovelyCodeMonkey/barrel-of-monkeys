#!/usr/bin/env bash
# Symlink every skill in this repo into Claude Code and Codex, for editing the skills in place.
# Plugin and `npx skills` installs don't need this.
set -euo pipefail

repo="$(cd "$(dirname "$0")/.." && pwd)"
targets=("$HOME/.claude/skills" "${CODEX_HOME:-$HOME/.codex}/skills")

for skill in "$repo"/skills/*/*/; do
  skill="${skill%/}"
  name="$(basename "$skill")"
  for dir in "${targets[@]}"; do
    mkdir -p "$dir"
    link="$dir/$name"
    if [ -e "$link" ] && [ ! -L "$link" ]; then
      echo "skipped $link: a real folder is there, not a symlink" >&2
      continue
    fi
    ln -sfn "$skill" "$link"
    echo "$link -> $skill"
  done
done
