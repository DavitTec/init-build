#!/usr/bin/env bash
# git.sh
# Version: 1.1
# Part of init-build library
# TODO: fix the issue incorrest formating, USE gitignore.sh with OPTIONS
#  
gitignore(){
  if [[ ! -f .gitignore ]]; then
    log_info "No .gitignore found, created new one"
    cp .bootstrap/.gitignore .
    log_success "'.gitignore' installed"
  fi
  log_info "Settings in '.gitignore' may need updating"


cat >> .gitignore << 'EOF'
node_modules/
dist/
archives/
.env   # must add this
.env.local
.init-build/
.bootstrap/
EOF

# Remove duplicates and blank lines
tmp=".gitignore.tmp"
echo "# revised gitignignore $(date '+%Y-%m-%d %H:%M')" > $tmp
awk '!seen[$0]++' .gitignore | sed '/^$/N;/^\n$/D' >> $tmp
mv .gitignore.tmp .gitignore
log_info "Merged template and removed duplicates"

}

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