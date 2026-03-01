git_init

cat > .gitignore << 'EOF'
node_modules/
dist/
archives/
.env.local
.init-build/
EOF

git_first_commit