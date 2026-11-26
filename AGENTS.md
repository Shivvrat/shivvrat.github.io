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

## Visual & Theme Conventions
This site renders on a light white/navy/royal-blue canvas (`#ffffff`, `#003366`, `#5375e2`, `#f0f4ff`). Preserve a restrained academic look without bright multi-color button borders or mismatched dark surfaces.

- **Keep widgets light-only**: Do not add `@media (prefers-color-scheme: dark)` blocks that turn individual controls dark on top of the white page layout. Because `assets/css/responsive.css` overrides `--background`, `--background-gray`, and `--background-blue` in dark mode on pages that load it (`/`, `/research/`, `/talks/`), use explicit light hex colors (`#ffffff`, `#f8f9fa`, `#f0f4ff`, `#2c3e50`, `#dee2e6`) for component surfaces/text and set `color-scheme: light` on text/search inputs.
- **Share one CSS rule for equivalent components across pages**: Define styles for elements reused across pages (topic tag pills, resource/action buttons, award badges) once in `assets/css/custom.css` using shared selectors instead of duplicating rules in page-specific stylesheets (`bibliography.css`, `research.css`). Set `min-block-size: auto; min-height: auto;` on compact inline `<a>`/`<button>` pills and buttons so `assets/css/responsive.css`'s `44px` `--hit-min` rule never inflates them on pages that load `responsive.css`.
- **Keep four distinct academic pill/button families**:
  - **Venue badges (`.pub-venue-badge`)**: Compact solid academic tags (`4px` radius, white text) — `#003366` (conferences), `#1b4965` (journals), `#52606d` (workshops/preprints/theses).
  - **Action buttons (`.btn-pdf`, `.btn-arxiv`, `.btn-doi`, `.btn-code`, `.btn-library`, `.btn-website`, `.btn-bib`, `.btn-abstract`, `a.project-resource-btn`)**: One uniform soft-blue rectangular button style (`6px` radius, `#f0f4ff` fill, `var(--primary-navy)` text, `1px solid #c7d7f8` border; hover `var(--light-blue)` / `var(--secondary-blue)`).
  - **Topic tag pills (`button.pub-tag-pill`, `a.pillar-tag-pill`)**: Quiet full-rounded cool-gray pills (`9999px` radius, `#f1f5f9` fill, `#475569` text, `1px solid #e2e8f0`; hover `#e6f0ff` / `var(--primary-navy)`).
  - **Awards & distinctions (`.paper-award`, `.award-badge`, `.btn-award`, `.btn-certificate`)**: Reserve warm amber/gold exclusively for honors and distinctions.
