# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

This is the source for `dennyrgood.github.io`, a static site served via GitHub Pages under the custom domain `ldmathes.cc` (see `CNAME`). There is no build system, package manager, framework, or test suite — every page is a hand-written, self-contained HTML file (inline `<style>`/`<script>`, ES5-style JS, no bundler). `.nojekyll` disables Jekyll processing, so GitHub Pages serves files as-is.

## Common commands

There are none. There is no `package.json`, Makefile, linter, or test runner in this repo. To "run" the site, either:
- Open an `.html` file directly in a browser, or
- Serve the directory with any static file server (e.g. `python3 -m http.server`) and browse to it.

Deployment is simply: commit and push to the default branch; GitHub Pages serves the current state of the repo directly.

## High-level structure

- `index.html` — the site's landing page ("Mathes Online Utilities"). It renders a grid of project cards entirely client-side: a `CONFIG.projects` JS array (each entry has `icon`, `title`, `description`, and a list of `buttons` with `url`/`style`) is walked by `renderProjectCard()`/`renderAllProjectCards()` to build the DOM. To add/remove/edit a project link on the homepage, edit the `CONFIG.projects` array in `index.html` — do not hand-edit the grid markup.
  - Many of the linked "projects" (weather-dashboard, movies-shows-editor, excel-web-interface, usdz-avp, llm, google-photos, place-objects, scripts) live in **separate sibling GitHub repos/Pages sites** (`https://dennyrgood.github.io/<repo>/...`), not in this repo. Some of those `Doc` links are marked with comments noting "this repo doesn't have Doc in it" — i.e. known-broken/placeholder links for repos without a `Doc` folder.
  - Some buttons point to internal-network hosts (e.g. `fleet.ldmathes.cc`, `chat.ldmathes.cc`, `http://workbenchunix:2283`) that are only reachable from the user's own network/fleet, not public internet.
- `ck.html` and `raw.html` — standalone utility pages: `ck.html` is a "GitHub File Renderer" (renders a raw GitHub file as HTML, using Tailwind via CDN), `raw.html` is a "GitHack URL Generator" (builds statically.io/GitHack raw-content URLs). Both are independent tools, not part of the main site nav flow beyond being linked from `index.html`'s "Utilities" card.
- `fleet_models.html`, `relationships_dashboard.html` — standalone single-file dashboards (each embeds its own data/logic; no shared JS/CSS between pages in this repo).
- `photos/index.html` — a meta-refresh redirect stub that forwards to an external Google Sites photo album; not a real page.
- `travel/` — a self-contained sub-site for travel destination planning/analysis. Contains several HTML dashboards (`index.html`, `analysis.html`, `quick.html`, plus `*_bkp`, `copy`, `OLD`, `pre_AI`/`pre_cols` variants that are manual backups/history, not active code) and `prompt.txt`, which defines the exact system prompt/data schema (CSV column meanings, status taxonomy like `decided`/`waiting-me`/`waiting-other`/`opportunistic`/`aspirational`/`someday`, companion-compatibility semantics, cluster-trip semantics) used when feeding the travel data to an AI assistant for analysis. Read `travel/prompt.txt` before interpreting or modifying any travel-data logic.
- `Doc/` — a personal document dump (PDFs, docx, txt, screenshots) covering unrelated homelab/fleet topics (Tailscale, Plex, Cloudflare, hardware migrations, etc.). It is reference material, not site source; not linked to consistently from `index.html` (several `Doc` links in the config point at other repos' `Doc` folders that don't exist).
- `usdz-avp/` (referenced by `index.html` as `usdz-avp/index_usdz.html`) is expected as a relative path but is not present in this repo's file listing — treat as an external or not-yet-added directory.

## Notes on conventions

- Pages are written in plain HTML/CSS/vanilla JS with inline `<style>` blocks; no shared stylesheet or JS module exists across pages, so styling changes must be made per-file.
- `index.html`'s script comments explicitly call out "ES5 Compliant" — it intentionally avoids modern JS syntax (uses `var`, function declarations) for broad compatibility.
- Several files in `travel/` are explicitly named as backups/copies (`analysis_bkp.html`, `analysis copy.html`, `analysis copy 2.html`, `quick_bkp.html`, `quick copy.html`, `quick copy 2.html`, `index.htmlOLD`, `index_pre_AI.html`, `index_pre_cols.html`) — when asked to edit "the" travel analysis or quick page, confirm which of `analysis.html`/`quick.html` (the non-suffixed ones) is the live version before touching backups.
