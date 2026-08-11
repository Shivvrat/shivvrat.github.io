---
name: run-personal-site
description: Build, serve, browse, screenshot, and verify Shivvrat Arya's personal Jekyll website through Docker and the bundled Playwright driver. Use to preview personal-site changes, diagnose Jekyll or container failures, inspect a rendered page, capture screenshots, or decide whether content is site-owned or generated from the parent academic hub.
---

# Run Personal Site

Run commands from the `shivvrat.github.io` repository root. Use Docker for the Jekyll environment and the bundled Playwright driver for deterministic browser checks.

## Respect content ownership

Files with an academic-sync generated header must be changed through `../arya-academic-data/` and the parent hub's `$run-academic-sync` workflow. Keep personal biography, page copy, navigation, layouts, styles, and personal-site-only publication data such as `cv/ref.bib` in this repository. The `_config.yml` `author` block is manually maintained because Jekyll cannot populate it from `_data/pi.yml`.

## Build and serve

On Apple Silicon, force the locked Linux platform; the setting is harmless on x86_64:

```bash
DOCKER_DEFAULT_PLATFORM=linux/amd64 docker compose build site
DOCKER_DEFAULT_PLATFORM=linux/amd64 docker compose up -d site
for attempt in $(seq 1 60); do
  curl -fsS http://127.0.0.1:4000/ >/dev/null && break
  sleep 1
done
curl -fsS http://127.0.0.1:4000/ >/dev/null
```

For a non-serving build check:

```bash
DOCKER_DEFAULT_PLATFORM=linux/amd64 docker compose run --rm site bundle exec jekyll build --config _config.yml,_config_docker.yml --trace
```

If startup fails, inspect `docker compose logs --tail=100 site`. A successful image build does not prove the Jekyll process started.

## Browse and screenshot

Install the driver dependency when needed:

```bash
npm ci --prefix .agents/skills/run-personal-site
npx --prefix .agents/skills/run-personal-site playwright-core install chromium
```

Navigate to any local path and save the screenshot outside the repository:

```bash
node .agents/skills/run-personal-site/driver.mjs \
  http://127.0.0.1:4000/publications/ \
  /tmp/personal-site-publications.png
```

The driver reports the page title and browser console/page errors. Inspect the screenshot when layout matters. Stop the site after verification:

```bash
docker compose down
```

Do not run the Rake `publish` task unless the user explicitly authorizes deployment; it force-pushes generated content to the remote `master` branch.

Report the URL checked, build result, console errors, screenshot path if created, and whether any source-of-truth update remains in the parent hub.
