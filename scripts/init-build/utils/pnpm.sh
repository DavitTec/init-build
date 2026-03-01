
# Version: 0.2.0 

pnpm_init_if_missing() {
  if [[ ! -f package.json ]]; then
    pnpm init 
    log_success "pnpm initialised"
  fi
}