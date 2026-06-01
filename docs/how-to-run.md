# How To Run

Use Docker Compose from the repository root. The same command works on Windows,
macOS, and Linux:

```bash
docker compose up --build
```

The terminal will print `Local URL: http://localhost:4000`. Wait until the logs
say `Server running`, then open <http://localhost:4000>. To stop the local
server, press `Ctrl+C` in the terminal.

## Other Commands

Build the site without serving it:

```bash
docker compose run --rm site bundle exec jekyll build
```

Open a shell inside the container:

```bash
docker compose run --rm site /bin/bash
```

## Optional Wrappers

These wrappers still work if you prefer them:

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

The publish command expects your SSH key directory at `~/.ssh`, or set
`SSH_KEY_DIR` to a different path.

## GitHub Actions Publishing

Commits pushed to the `source` branch run `.github/workflows/publish.yml`. The
workflow builds the site with Docker and publishes the generated `_site` folder
to the `master` branch using GitHub Actions' built-in token.

No deploy key is needed for the automated workflow. If GitHub rejects the push,
check the repository settings under **Actions > General > Workflow permissions**
and make sure workflows have read and write permissions.
