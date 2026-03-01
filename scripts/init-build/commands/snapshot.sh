#!/usr/bin/env bash
set -euo pipefail

#VERSION=$(node -p "require('./package.json').version")
#TARGET="archives/presentation-engine-v${VERSION}-$(date +%Y%m%d-%H%M).tar.gz"

source "$LIB_DIR/config/env.sh"
VERSION=$(node -p "require('./package.json').version")
#TODO: snapdhot: fix the option for compress or not :default is not  
TARGET="archives/${PROJECT_NAME}-v${VERSION}-$(date +%Y%m%d-%H%M).tar.gz"


mkdir -p archives

find . -type f \
  ! -path "./node_modules/*" \
  ! -path "./archives/*" \
  | tar -czf "$TARGET" -T -

log_snapshot "$VERSION" "$TARGET"

echo "✅ Snapshot created → $TARGET"