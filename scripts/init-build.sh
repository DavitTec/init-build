#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
LIB_DIR="$ROOT_DIR/scripts/init-build"

source "$LIB_DIR/config/env.sh"
source "$LIB_DIR/utils/logger.sh"
source "$LIB_DIR/utils/constants.sh"

COMMAND="${1:-build}"

case "$COMMAND" in
  build)
    source "$LIB_DIR/commands/build.sh"
    ;;
  snapshot)
    shift
    source "$LIB_DIR/commands/snapshot.sh" "$@"
    ;;
  readme|license|requirements|hist)
    shift
    source "$LIB_DIR/commands/${COMMAND}.sh" "$@"
    ;;
  status)
     source "$LIB_DIR/state/status.sh"
     ;;  
  *)
    log_error "Unknown command: $COMMAND"
    exit 1
    ;;
esac