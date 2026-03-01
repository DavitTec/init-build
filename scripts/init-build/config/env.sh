#!/usr/bin/env bash

if [[ ! -f "$ROOT_DIR/.env" ]]; then
  echo "❌ .env missing!"
  exit 1
fi

source "$ROOT_DIR/.env"