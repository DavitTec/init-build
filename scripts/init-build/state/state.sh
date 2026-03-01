#!/usr/bin/env bash
 
STATE_DIR="$PROJECT_ROOT/.init-build"
STATE_FILE="$STATE_DIR/state.json"
LOCK_FILE="$STATE_FILE.lock"

# #Add state locking:
# exec 200>"$STATE_FILE.lock"
# flock -n 200 || { echo "Another build running"; exit 1; }


init_state() {
  # Always ensure directory exists first
  mkdir -p "$STATE_DIR"

  # Create empty state file if missing
  if [[ ! -f "$STATE_FILE" ]]; then
    echo '{}' > "$STATE_FILE"
  fi
}

state_lock() {
  mkdir -p "$STATE_DIR"
  exec 200>"$LOCK_FILE"
  flock -n 200 || {
    echo "❌ Another build process is running."
    exit 1
  }
}


state_get() {
  jq -r "$1" "$STATE_FILE"
}

state_set() {
  local jq_expr="$1"
  jq "$jq_expr" "$STATE_FILE" > "$STATE_FILE.tmp" \
    && mv "$STATE_FILE.tmp" "$STATE_FILE"
}

mark_phase_complete() {
  local phase="$1"
  local now
  now=$(date -Iseconds)

  state_set ".phases.\"$phase\" = {\"status\":\"complete\",\"timestamp\":\"$now\"}"
}

mark_phase_failed() {
  local phase="$1"
  local now
  now=$(date -Iseconds)

  state_set ".phases.\"$phase\" = {\"status\":\"failed\",\"timestamp\":\"$now\"}"
}

log_snapshot() {
  local version="$1"
  local file="$2"
  local now
  now=$(date -Iseconds)

  state_set ".snapshots += [{\"version\":\"$version\",\"file\":\"$file\",\"timestamp\":\"$now\"}]"
}
