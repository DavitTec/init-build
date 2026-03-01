PROJECT_VERSION=$(node -p "require('$PROJECT_ROOT/package.json').version" 2>/dev/null || echo "0.1.0")
LOG_FILE="$PROJECT_ROOT/logs/setup.log"
