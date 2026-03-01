pnpm_init_if_missing

jq '.name="presentation-engine"
  | .version="0.1.0"
  | .main="server.js"' package.json > tmp.json && mv tmp.json package.json

pnpm add express nunjucks marked sass nodemon live-server
pnpm add -D eslint eslint-config-standard

log_success "Dependencies installed"