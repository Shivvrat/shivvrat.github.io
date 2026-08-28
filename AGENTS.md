# Agent Guidelines for shivvrat.github.io

**This file is the entry point for agents working in this repo.** Personal academic Jekyll website. It's checked out as a submodule of `arya-academic-hub-website-cv`, which generates several of its `_data/*.yml` files and `_pages/grants.md` — read the routing rule below before editing anything factual.

## Route your change

| Your change | Goes in |
| --- | --- |
| A fact behind a generated file: `_data/pi.yml`, `_data/recruiting.yml`, `_data/academic_teaching.yml`, `_data/academic_service.yml`, `_data/organizational_responsibilities.yml`, `_data/certifications.yml`, `_data/academic_talks.yml`, `_data/advising.yml`, `cv/talks.bib`, `_pages/grants.md` | **Not here.** Edit `arya-academic-data` in the hub, then `docker compose run --rm sync sync --write` from the hub root. See [`arya-academic-data/AGENTS.md`](../arya-academic-data/AGENTS.md). |
| Hand-written narrative pages (`_pages/home.md`, `_pages/research.md`, `_pages/team.md`, `_pages/software.md`), `_data/news.yml`, other non-generated `_data/*.yml` | Right here — edit the file directly. |
| `_config.yml`'s `author.name`/`author.email` | Right here, but **keep them manually in sync** with `arya-academic-data/10-profile/profile` — Jekyll parses `_config.yml` before Liquid runs, so it can never read generated `_data/*.yml`. |
| `cv/ref.bib` (this site's own publication bibliography) | Right here — website-owned, sync never rewrites it. |
| Jekyll/Docker build issues | `Dockerfile`, `docker-compose.yml`, `docker-jekyll.sh`/`.ps1` |

**Never hand-edit a file marked generated above** — it's overwritten on the next `sync --write`.

## What's generated vs. hand-written

The full, exact list of what this site does *not* get from `arya-academic-data` — including which `_data/*.yml` files are fully commented-out template placeholders with no real content — lives in `arya-academic-data/docs/manual-updates-personal-site.md`. Read that before assuming a page or data file is either generated or safe to hand-edit.

## Build

```bash
docker compose up --build   # serve at http://localhost:4000
docker compose run --rm site bundle exec jekyll build   # build without serving
```

See [`docs/how-to-run.md`](docs/how-to-run.md) for the full command reference, optional wrapper scripts, and the GitHub Actions publish workflow.

## Finish safely

Run `git status --short` here and in the hub. Do not commit, push, or update the hub's submodule pointer unless asked.
