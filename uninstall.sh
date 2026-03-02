#!/usr/bin/env bash
set -euo pipefail

GREEN='\033[0;32m' BOLD='\033[1m' RESET='\033[0m'
ok() { printf "${GREEN}[OK]${RESET} %s\n" "$*"; }

SKILL_DIR="$HOME/.claude/skills/time-estimate"

echo ""
printf '%s=== ai-time-saved — Uninstall ===%s\n' "$BOLD" "$RESET"
echo ""

if [ -d "$SKILL_DIR" ]; then
    rm -rf "$SKILL_DIR"
    ok "Removed $SKILL_DIR"
else
    ok "Already uninstalled"
fi

echo ""
