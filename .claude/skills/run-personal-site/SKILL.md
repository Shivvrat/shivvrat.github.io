---
name: run-personal-site
description: Build, serve, and screenshot Shivvrat Arya's personal Jekyll website (shivvrat.github.io). Use when asked to run the personal site, start its dev server, preview a page, verify a change rendered, or take a screenshot of it.
---

This is a Jekyll site served in Docker (`docker-compose.yml` at this repo's root, service `site`, port 4000). `chromium-cli` isn't installed in this environment, so the driver is `.claude/skills/run-personal-site/driver.mjs` — a small Playwright script that navigates, checks console errors, and screenshots. All paths below are relative to this directory (`shivvrat.github.io/`, a submodule of the hub repo).

## Prerequisites

Docker Desktop running. Node.js/npm (for the driver's Playwright dependency).

**On Apple Silicon / arm64 hosts**: `Gemfile.lock` only lists the `x86_64-linux` platform, so a native arm64 build fails at runtime with `Your bundle only supports platforms ["x86_64-linux"]`. Build and run under amd64 emulation instead — set `DOCKER_DEFAULT_PLATFORM=linux/amd64` for every `docker compose` call below. (On an x86_64 host this env var is a no-op; safe to always set it.)

## Build

```bash
DOCKER_DEFAULT_PLATFORM=linux/amd64 docker compose build site
```

## Run (agent path)

1. Start the site in the background:

```bash
DOCKER_DEFAULT_PLATFORM=linux/amd64 docker compose up -d site
timeout 60 bash -c 'until curl -sf http://localhost:4000/ >/dev/null; do sleep 1; done'
```

2. Install the driver's dependency once (installs into `.claude/skills/run-personal-site/node_modules`, gitignored):

```bash
npm install --prefix .claude/skills/run-personal-site
npx --prefix .claude/skills/run-personal-site playwright install chromium   # only needed once per machine
```

3. Drive it — navigate, check for console errors, screenshot:

```bash
node .claude/skills/run-personal-site/driver.mjs "http://localhost:4000/" /tmp/shots/home.png
# → title: Home - Shivvrat Arya
#   console errors: none
```

Pass any local path, e.g. `http://localhost:4000/publications/`. The script exits after one screenshot; call it again for another page.

4. Stop the site:

```bash
docker compose down
```

## Run (human path)

```bash
DOCKER_DEFAULT_PLATFORM=linux/amd64 docker compose up site   # → http://localhost:4000, Ctrl-C to stop
```

`bash init_local_server.sh` / `bash docker-jekyll.sh serve` do the same thing without the platform override baked in — on arm64 you still need `DOCKER_DEFAULT_PLATFORM=linux/amd64` set first.

## Gotchas

- **Platform mismatch is silent until runtime, not build time.** `docker compose build` succeeds on arm64 even though the resulting image can't run `bundle exec jekyll serve` — the failure only shows up in `docker compose logs site` after `up -d`, as a `Bundler::ProductionError`. Don't trust a clean build as proof the site works; always poll `curl` after `up -d`.
- **`docker compose up site` (no `-d`) blocks and streams logs** — fine for the human path, but the agent path needs `-d` plus the `curl` poll loop shown above, not a fixed `sleep`.

## Troubleshooting

- **`Your bundle only supports platforms ["x86_64-linux"] but your local platform is aarch64-linux`**: you forgot `DOCKER_DEFAULT_PLATFORM=linux/amd64`. Set it and rebuild (`docker compose build site`) — the image tag is reused, so the rebuild is fast once the amd64 layers are cached.
- **`chromium-cli not found`**: not installed in this environment; use `driver.mjs` instead (it's the same nav → wait → screenshot loop over Playwright directly).
