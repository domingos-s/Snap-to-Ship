---
name: snap-to-ship
description: >
  Build a runnable Next.js (TypeScript + Tailwind + shadcn/ui) web app from a screenshot or sketch.
  Use this when the user provides a UI image or describes a UI and asks to ship a prototype or MVP.
  Do NOT use for backend-only work, pure bugfixes, or non-UI tasks.
---

# Snap-to-Ship — Skill Instructions (for Codex)

## Mission
Take a screenshot (or sketch) + a short description and produce a **working, runnable Next.js app** that matches the UI and key interactions.

Your job is to:
1) Scaffold the app (Next.js + TS + Tailwind)
2) Add shadcn/ui + basic layout primitives
3) Convert the screenshot into a component map
4) Implement pages + states + interactions
5) Run quick QA (lint + build)
6) Leave behind a clean handoff summary

## Inputs you must collect (ask the user if missing)
- Screenshot(s): local path(s) or attached images
- App name (default: `snap-to-ship`)
- Mode: `prototype` or `mvp` (default: `prototype`)
- Pages to include (default: whatever is in the screenshot + a basic landing)
- Data: mocked vs real (default: mocked)
- Visual fidelity: `close` (match layout) vs `inspired-by` (avoid cloning a known product)

## Outputs you must produce
- A runnable Next.js app folder (default: `./snap-to-ship/`)
- `docs/component-map.md` and `docs/interaction-map.md`
- `docs/ship-checklist.md` completed
- `README.md` in the generated app with run instructions
- A short “handoff” note in `docs/HANDOFF.md`

## Hard rules
- Prefer **clarity + speed** over over-engineering.
- Always implement:
  - loading state
  - empty state
  - error state
  - mobile layout (at least one breakpoint)
  - basic accessibility pass (labels, button text, focus states)
- If the UI looks like a recognizable product, switch to **inspired-by** mode:
  - change color palette, fonts, spacing scale, and iconography
  - keep the *structure and behavior* but avoid pixel-perfect duplication

## Recommended workflow

### Step 0 — Create a plan
Create `docs/plan.md` with:
- user goals
- pages/routes
- component inventory
- data model (mock)
- out-of-scope items

Keep it short.

### Step 1 — Scaffold the app
Use the provided scripts (preferred):

- `bash .agents/skills/snap-to-ship/scripts/init_next_app.sh <app_dir>`
- `bash .agents/skills/snap-to-ship/scripts/install_shadcn.sh <app_dir>`

Default `<app_dir>` is `snap-to-ship`.

If the user already has a repo/app, skip scaffolding and integrate into the existing structure.

### Step 2 — Screenshot → component map
Create these docs under the app:
- `docs/component-map.md` (sections: Layout, Navigation, Cards, Forms, Tables, Charts, Modals)
- `docs/interaction-map.md` (user actions → UI reactions)
- `docs/data-model.md` (entities + example JSON)

Then implement components in `components/` and pages in `app/`.

### Step 3 — Implement in slices
Build in this order:
1) Shell layout (top nav / sidebar / footer)
2) Landing page structure
3) Primary “hero” screen from the screenshot
4) Secondary screens / flows (modals, forms, settings)
5) State + data stubs

Use `lib/mock/` for mock data and `lib/api/` for future real API calls.

### Step 4 — QA + fixes
From the app directory run:
- `npm run lint`
- `npm run build`

Fix failures. Then run `bash .agents/skills/snap-to-ship/scripts/verify.sh <app_dir>` if available.

### Step 5 — Handoff
Write `docs/HANDOFF.md` with:
- what works
- what’s mocked
- what to do next
- known issues

## Quality bar
The app should be good enough that a non-technical user can click around and understand the product.

Use the checklists in:
- `.agents/skills/snap-to-ship/assets/ship-checklist-template.md`
- `.agents/skills/snap-to-ship/assets/ui-qa-checklist.md`

## Templates you can copy
See `.agents/skills/snap-to-ship/templates/` for:
- `landing.md` (recommended sections)
- `routes.md` (common route map)
- `component-map-template.md`
