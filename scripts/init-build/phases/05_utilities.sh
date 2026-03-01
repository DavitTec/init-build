#!/usr/bin/env bash
# set -euo pipefail

# VERSION=$(node -p "require('./package.json').version")
# TARGET="archives/presentation-engine-v${VERSION}-$(date +%Y%m%d-%H%M).tar.gz"

# mkdir -p archives

# find . -type f \
#   ! -path "./node_modules/*" \
#   ! -path "./archives/*" \
#   | tar -czf "$TARGET" -T -

# echo "✅ Snapshot created → $TARGET"
log_success "Utility commands registered (snapshot, build, status)"