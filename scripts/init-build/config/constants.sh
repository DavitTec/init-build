PROJECT_VERSION=$(node -p "require('$ROOT_DIR/package.json').version" 2>/dev/null || echo "0.1.0")
LOG_FILE="$ROOT_DIR/logs/setup.log"