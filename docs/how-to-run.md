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
workflow builds the site with Docker, checks internal links with lychee (a
broken internal link stops the deploy), and publishes the generated `_site`
folder to the `master` branch using GitHub Actions' built-in token.

Both workflows build through `.github/actions/build-site`, which builds only the
Dockerfile's `deps` stage (OS packages and gems) with a GitHub Actions layer
cache and then runs `SKIP_IMAGE_BUILD=1 ./docker-jekyll.sh compile`. The cache
is rebuilt only when `Dockerfile`, `Gemfile`, or `Gemfile.lock` changes.

No deploy key is needed for the automated workflow. If GitHub rejects the push,
check the repository settings under **Actions > General > Workflow permissions**
and make sure workflows have read and write permissions.

`.github/workflows/links.yml` builds the site and runs lychee (`lychee.toml`).
It checks internal links on every PR (failing the job) and does not run on push,
since `publish.yml` already checks them; external links run weekly (Mondays) and
on manual dispatch and only report.
Run the same check locally with `./check_links.sh` (add `--offline` for internal
links only).

`_config.yml` sets the production `url` (needed for absolute canonical, sitemap,
and robots links) and excludes repository internals (agent, Docker, and tooling
files, `docs/`, `tools/`) from `_site`. Add any new tooling file to `exclude:`.

## Page headings

The grid, text, research, home, about, and gallery layouts render one H1 from
page frontmatter through `_includes/page-title.html`. Do not repeat that title
in the page body. Home and About pass `hidden=true` to keep their H1 accessible
without displaying the page name. The page, post, and course layouts already render their own
H1; direct uses of the default layout must supply one in their content.

Use H2 for main sections, H3 for subsections, and H4 only within an H3 section.
Choose levels for document structure rather than font size. Shared heading
styles live in `assets/css/heading_style.css`.

After building, check the rendered headings with:

```bash
python3 tools/check_headings.py
```
