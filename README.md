# Docker workflow

This site can be built and served inside Docker so you do not need a local
Ruby/Jekyll setup.

## Run locally

Use the same command on Windows, macOS, and Linux:

```bash
docker compose up --build
```

The terminal will print `Local URL: http://localhost:4000`. Wait until the logs
say `Server running`, then open <http://localhost:4000>.

To run on a custom port, set `PERSONAL_SITE_PORT` (or `PORT`):

```bash
PERSONAL_SITE_PORT=4005 docker compose up --build
```

You can also customize the livereload port with `PERSONAL_SITE_LIVERELOAD_PORT` (or `LIVERELOAD_PORT`, default: `35729`).

## Other commands

```bash
docker compose run --rm site bundle exec jekyll build
docker compose run --rm site /bin/bash
```

## Optional wrappers

The shell and PowerShell wrappers still work if you prefer them:

```bash
bash ./docker-jekyll.sh serve
bash ./docker-jekyll.sh compile
bash ./docker-jekyll.sh publish
```

```powershell
.\docker-jekyll.ps1 serve
.\docker-jekyll.ps1 compile
.\docker-jekyll.ps1 publish
```

`publish` runs the existing `rake publish` task inside the container. It expects
your SSH key directory to be available at `~/.ssh`, or at the path pointed to by
`SSH_KEY_DIR`.
