#!/usr/bin/env bash
# scripts/init-build.sh
# Version: 0.2.0
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# If running from .bootstrap mode
if [[ "$(basename "$(dirname "$SCRIPT_DIR")")" == ".bootstrap" ]]; then
    PROJECT_ROOT="$(pwd)"
    FRAMEWORK_ROOT="$SCRIPT_DIR/init-build"
else
    PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
    FRAMEWORK_ROOT="$PROJECT_ROOT/scripts/init-build"
fi

LIB_DIR="$FRAMEWORK_ROOT"

# shellcheck disable=SC1091
source "$LIB_DIR/config/env.sh"
# shellcheck disable=SC1091
source "$LIB_DIR/utils/logger.sh"
# shellcheck disable=SC1091
source "$LIB_DIR/utils/constants.sh"

COMMAND="${1:-build}"

case "$COMMAND" in
  build)
    # shellcheck disable=SC1091
    source "$LIB_DIR/commands/build.sh"
    ;;
  snapshot)
    shift
    # shellcheck disable=SC1091
    source "$LIB_DIR/commands/snapshot.sh" "$@"
    ;;
  readme|license|requirements|hist)
    shift
    # shellcheck disable=SC1091
    # shellcheck source=$LIB_DIR/commands/${COMMAND}.sh
    source "$LIB_DIR/commands/${COMMAND}.sh" "$@"
    ;;
  status)
     # shellcheck disable=SC1091
     source "$LIB_DIR/state/status.sh"
     ;;  
  *)
    log_error "Unknown command: $COMMAND"
    exit 1
    ;;
esac
