# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Personal portfolio/blog site for Stuart Page, built with Phoenix 1.8 + LiveView 1.1 + Tailwind CSS 4 + daisyUI. Deployed to Fly.io at https://stuart-page.fly.dev.

## Common Commands

```bash
mix setup              # Install deps and build assets
mix phx.server         # Run dev server with hot reload (localhost:4000)
mix test               # Run all tests
mix test test/path.exs # Run a single test file
mix test --failed      # Re-run previously failed tests
mix format             # Format Elixir code
mix precommit          # Lint (compile --warnings-as-errors) + test — run before pushing
mix assets.build       # Build JS & CSS for dev
mix assets.deploy      # Minify + digest assets for prod
```

## Architecture

**No database** — all content is defined as in-memory structs in `lib/stuart_page_live/content.ex` (projects, open-source libs, blog posts).

### Routes (3 pages)

| Path | LiveView | Description |
|------|----------|-------------|
| `/` | `HomeLive` | Featured projects, posts, open source |
| `/projects` | `ProjectsLive` | All projects and OSS contributions |
| `/writing` | `WritingLive` | All blog posts |

### Key Directories

- `lib/stuart_page_live/` — Core app logic (content data module)
- `lib/stuart_page_live_web/live/` — LiveView pages
- `lib/stuart_page_live_web/components/` — Reusable components: `layouts.ex` (navbar, theme toggle), `cards.ex` (project/post/oss cards), `core_components.ex` (flash, icons)
- `assets/css/app.css` — Tailwind config, daisyUI theme (oklch colors), custom animations (scroll fade-in, gradient text, animated ring, card glow)
- `assets/js/app.js` — LiveView socket setup, `ScrollFade` hook for intersection observer animations
- `assets/vendor/` — Heroicons, daisyUI, topbar

### Theme System

Light/dark themes defined in `app.css` using daisyUI theme variables (oklch color space). Toggled via `phx:set-theme` event in the navbar component, persisted to localStorage.

## Guidelines from AGENTS.md

- Run `mix precommit` when done with changes
- Use `:req` (Req) for HTTP requests — never HTTPoison, Tesla, or httpc
- LiveView templates must begin with `<Layouts.app flash={@flash} ...>`
- Use `<.icon name="hero-x-mark" />` for icons (from core_components), never Heroicons modules
- Use `<.input>` from core_components for form inputs
- Tailwind v4: no `tailwind.config.js`, uses `@import "tailwindcss"` syntax in app.css — never use `@apply`
- No inline `<script>` tags — import vendor deps into app.js/app.css
- No external script `src` or link `href` in layouts — only app.js and app.css bundles
- See AGENTS.md for full Phoenix 1.8, LiveView, HEEx, Elixir, and testing guidelines
