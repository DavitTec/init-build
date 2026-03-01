#!/usr/bin/env bash
set -euo pipefail

LIB_DIR="$ROOT_DIR/scripts/init-build"

source "$LIB_DIR/state/state.sh"
source "$LIB_DIR/utils/logger.sh"

init_state

echo ""
echo "===== INIT-BUILD STATUS ====="
echo ""

jq '.' "$STATE_FILE"

echo ""