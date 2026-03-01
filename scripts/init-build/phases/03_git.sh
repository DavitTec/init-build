#!/usr/bin/env bash
# Part of init-build library
# TODO: fix the issue incorrest formating, USE gitignore.sh with OPTIONS
#  
git_init

cat > .gitignore << 'EOF'
node_modules/
dist/
archives/
.env   # must add this
.env.local
.init-build/
.bootstrap/
EOF

git_first_commit