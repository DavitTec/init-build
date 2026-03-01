git_init() {
  if [[ ! -d .git ]]; then
    git init
    log_success "Git initialised"
    log_info "Git main branch is ${GIT_MAIN}"
    git branch -M "${GIT_MAIN}"
    log_success "Setting Git USER:${GIT_USER} with ${GIT_USEREMAIL}"
    git config --local user.name "${GIT_USER}"
    git config --local user.email "${GIT_USEREMAIL}"
    log_success "Git initialised"
  fi
}

git_first_commit() {
  if [[ -z $(git log --oneline -1 2>/dev/null) ]]; then
    git add .
    git commit -m "feat: initial structure v${VERSION}"
    git tag "v${VERSION}"
    log_success "Initial commit + tag created"
  fi
}