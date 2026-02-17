# Snap-to-Ship (Codex Skill)

**Goal:** Turn a screenshot (or rough sketch) into a working web app with Codex.

This repo contains a Codex Agent Skill you can drop into any project. It standardizes a workflow that:

- scaffolds a Next.js + TypeScript + Tailwind app
- adds shadcn/ui components
- converts a screenshot into a component map
- implements pages, states, and a stub data layer
- runs a quick QA pass (lint/build)

## Requirements

- Node.js 18+ (20+ recommended)
- npm, pnpm, or yarn (scripts assume npm by default)
- Codex CLI installed (`@openai/codex`)

## Install Codex CLI

```bash
npm i -g @openai/codex
```

## Add the skill to a repo

Copy the skill folder into the repo you want Codex to work in:

```bash
cp -R .agents/skills/snap-to-ship /path/to/your/repo/.agents/skills/
```

Codex discovers repository skills by scanning `.agents/skills` folders up to the repo root.

## Use it

From your target repo:

1) Start Codex:

```bash
codex
```

2) Invoke the skill explicitly (recommended):

- In the Codex CLI, type `$snap-to-ship` (or use `/skills` then select it)
- Attach your screenshot when prompted (or provide a local path)

3) Codex will:

- run the scaffolding scripts (or do it manually if you prefer)
- produce a `snap-to-ship/` app directory (by default)
- implement routes and components per the screenshot
- run `npm run lint` and `npm run build`

## Output formats

The skill is designed to produce a runnable repo folder (Next.js app). Optionally, you can have Codex export:

- a `.zip` of the app folder
- a component-only bundle (`components/` + `lib/`)

## Security / IP notes

The skill includes an “inspired-by” guardrail: if a screenshot resembles a well-known product, Codex should build a functionally similar layout but swap typography, spacing system, and colors to avoid pixel-copying.

## License

MIT
