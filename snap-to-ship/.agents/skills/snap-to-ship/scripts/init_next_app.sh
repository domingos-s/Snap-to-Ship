#!/usr/bin/env bash
set -euo pipefail

APP_DIR="${1:-snap-to-ship}"

if ! command -v node >/dev/null 2>&1; then
  echo "ERROR: node is required (Node 18+ recommended)." >&2
  exit 1
fi

if ! command -v npm >/dev/null 2>&1; then
  echo "ERROR: npm is required." >&2
  exit 1
fi

if [ -e "$APP_DIR" ]; then
  echo "ERROR: $APP_DIR already exists. Choose a new directory or remove it." >&2
  exit 1
fi

echo "Creating Next.js app in $APP_DIR ..."
# Next.js scaffold with Tailwind + TypeScript + ESLint + App Router
npx --yes create-next-app@latest "$APP_DIR" \
  --ts \
  --tailwind \
  --eslint \
  --app \
  --src-dir \
  --import-alias "@/*" \
  --no-turbo

echo "Done."
echo "Next: bash .agents/skills/snap-to-ship/scripts/install_shadcn.sh $APP_DIR"
