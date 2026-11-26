# Agent Guidelines for shivvrat.github.io

Personal academic Jekyll website.

If parent workspace documentation is available, refer to:
- `../../docs/submodules/personal-site.md`

## Basic Guidelines
- Follow existing patterns and styles across `_pages/` and `_data/`.
- Use the `agents-maintenance` skill before editing `AGENTS.md` or any `AGENTS.override.md`.
- Test builds locally with Docker before committing:
  ```bash
  bash ./docker-jekyll.sh compile
  ```

## HTML Inside Markdown Pages and Includes
`_config.yml` sets `kramdown.parse_block_html: true` and `html_to_native: true`, so Kramdown parses lines indented 4 or more spaces inside `_pages/*.md` or Markdown-included `_includes/*.html` files as indented code blocks (`language-plaintext highlighter-rouge`) and escapes HTML tags as literal text.

- Add `markdown="0"` on the outer wrapper element of any raw HTML block inside `_pages/*.md` or an `_includes/*.html` partial included by a `.md` page.
- Never indent any line by 4 or more spaces (including multi-line attributes, nested tags, or Liquid-rendered output) inside `_pages/*.md` or Markdown-included `_includes/*.html` partials; keep indentation at 0–2 spaces and trim Liquid whitespace with `{%- ... -%}`.
- After editing any `_pages/*.md`, `_includes/*.html`, or bibliography layout, run `bash ./docker-jekyll.sh compile` (or `docker compose run --rm site bundle exec jekyll build`) and inspect the built `_site/` HTML to confirm no unintended `language-plaintext highlighter-rouge` blocks or escaped tags (`&lt;div`, `&lt;input`, `&lt;button`, `&lt;a`) appear.
