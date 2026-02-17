#!/usr/bin/env bash
set -euo pipefail

APP_DIR="${1:-snap-to-ship}"

if [ ! -d "$APP_DIR" ]; then
  echo "ERROR: app directory not found: $APP_DIR" >&2
  exit 1
fi

cd "$APP_DIR"
echo "Running lint..."
npm run lint
echo "Running build..."
npm run build
echo "OK: lint + build passed."
