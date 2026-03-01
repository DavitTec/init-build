
log_warn  "Helpers:[$ENABLE_HELPERS] #In development: helpers have not PASSED"
 
if [[ "${ENABLE_HELPERS}" == "true" ]]; then
  log_info "OPTIONALLY engage the following commands after HELPER tests passed"
  bash "$PROJECT_ROOT/scripts/init-build/commands/readme.sh"
  bash "$PROJECT_ROOT/scripts/init-build/commands/license.sh"
  bash "$PROJECT_ROOT/scripts/init-build/commands/requirements.sh"
  bash "$PROJECT_ROOT/scripts/init-build/commands/snapshot.sh"
else
  log_info "Helper commands disabled"
fi

log_success "Final utilities executed"
