#!/usr/bin/env bash
# install.sh — Install ai-time-saved skill for Claude Code
set -euo pipefail

RED='\033[0;31m' GREEN='\033[0;32m' CYAN='\033[0;36m' BOLD='\033[1m' RESET='\033[0m'
ok()   { printf "${GREEN}[OK]${RESET} %s\n" "$*"; }
info() { printf "${CYAN}[INFO]${RESET} %s\n" "$*"; }
err()  { printf "${RED}[ERROR]${RESET} %s\n" "$*" >&2; }

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SKILL_DIR="$HOME/.claude/skills/time-estimate"

echo ""
printf '%s=== ai-time-saved — Install ===%s\n' "$BOLD" "$RESET"
echo ""

# Check Claude Code directory
if [ ! -d "$HOME/.claude" ]; then
    info "Creating ~/.claude directory"
    mkdir -p "$HOME/.claude"
fi

# Install skill
mkdir -p "$SKILL_DIR"
cp "$SCRIPT_DIR/skills/time-estimate/SKILL.md" "$SKILL_DIR/SKILL.md"
ok "Skill installed: $SKILL_DIR/SKILL.md"

echo ""
printf '%s=== Done ===%s\n' "$BOLD" "$RESET"
echo ""
info "Claude will now auto-estimate time after completing coding tasks."
info "You can also invoke it manually: /time-estimate"
echo ""
