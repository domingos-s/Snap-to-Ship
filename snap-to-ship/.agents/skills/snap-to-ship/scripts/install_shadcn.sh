#!/usr/bin/env bash
set -euo pipefail

APP_DIR="${1:-snap-to-ship}"

if [ ! -d "$APP_DIR" ]; then
  echo "ERROR: app directory not found: $APP_DIR" >&2
  exit 1
fi

cd "$APP_DIR"

echo "Installing shadcn/ui dependencies..."
npm i lucide-react class-variance-authority clsx tailwind-merge

echo "Initializing shadcn/ui with defaults..."
npx --yes shadcn@latest init --defaults --yes

echo "Adding common components..."
npx --yes shadcn@latest add button card input label textarea dropdown-menu dialog badge separator tabs table toast sonner avatar skeleton --yes

echo "Creating docs folder + starter checklists..."
mkdir -p docs lib/mock lib/api components

cat > docs/ship-checklist.md <<'EOT'
# Ship Checklist (Snap-to-Ship)

- [ ] Routes exist and are wired
- [ ] Loading state(s)
- [ ] Empty state(s)
- [ ] Error state(s)
- [ ] Mobile layout (at least 1 breakpoint)
- [ ] Basic accessibility pass (labels, focus, button text)
- [ ] `npm run lint` passes
- [ ] `npm run build` passes
EOT

echo "Done."
