#!/usr/bin/env bash
set -euo pipefail

LIB_DIR="$ROOT_DIR/scripts/init-build"
source "$LIB_DIR/state/state.sh"
source "$LIB_DIR/config/constants.sh"
source "$LIB_DIR/utils/logger.sh"
source "$LIB_DIR/utils/git.sh"
source "$LIB_DIR/utils/files.sh"
source "$LIB_DIR/utils/pnpm.sh"

init_state

for phase in "$LIB_DIR/phases/"*.sh; do
  phase_name=$(basename "$phase" .sh)

 # log_info "Running $phase_name"
   existing=$(state_get ".phases.\"$phase_name\".status" 2>/dev/null || echo "null")

  if [[ "$existing" == "complete" ]]; then
    log_info "Skipping $phase_name (already complete)"
    continue
  fi

  log_info "Running $phase_name"

  if source "$phase"; then
    mark_phase_complete "$phase_name"
  else
    mark_phase_failed "$phase_name"
    state_set ".lastRun = {\"status\":\"failed\",\"timestamp\":\"$(date -Iseconds)\"}"
    exit 1
  fi
done

last_status=$(state_get ".lastRun.status" 2>/dev/null || echo "none")

if [[ "$last_status" == "failed" ]]; then
  log_info "Resuming from failed build..."
fi

log_success "Full initialisation complete"

state_set ".lastRun = {\"status\":\"success\",\"timestamp\":\"$(date -Iseconds)\"}"