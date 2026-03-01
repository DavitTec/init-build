#!/usr/bin/env bash

if [[ ! -f "$PROJECT_ROOT/.env" ]]; then
  echo "❌ .env missing!"
  exit 1
fi

source "$PROJECT_ROOT/.env"
