#!/usr/bin/env python3
"""Check the heading outline of every rendered Jekyll page."""
import argparse
from html.parser import HTMLParser
from pathlib import Path


class PageHeadings(HTMLParser):
    def __init__(self):
        super().__init__()
        self.main_depth = 0
        self.found_main = False
        self.headings = []

    def handle_starttag(self, tag, attrs):
        if tag == "div":
            if self.main_depth:
                self.main_depth += 1
            elif dict(attrs).get("id") == "main-content":
                self.main_depth = 1
                self.found_main = True
        if self.main_depth and tag in {"h1", "h2", "h3", "h4", "h5", "h6"}:
            self.headings.append(int(tag[1]))

    def handle_endtag(self, tag):
        if tag == "div" and self.main_depth:
            self.main_depth -= 1


def outline_errors(levels):
    errors = []
    if not levels or levels[0] != 1:
        errors.append("page must start with H1")
    if levels.count(1) != 1:
        errors.append(f"expected one H1, found {levels.count(1)}")
    for previous, level in zip(levels, levels[1:]):
        if level > previous + 1:
            errors.append(f"skipped level: H{previous} to H{level}")
    return errors


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("site", nargs="?", type=Path,
                        default=Path(__file__).resolve().parents[1] / "_site")
    args = parser.parse_args()
    checked = 0
    failures = []
    for path in sorted(args.site.rglob("*.html")):
        page = PageHeadings()
        page.feed(path.read_text(encoding="utf-8"))
        if not page.found_main:
            continue
        checked += 1
        for error in outline_errors(page.headings):
            failures.append(f"{path.relative_to(args.site)}: {error}")
    if not checked:
        parser.error("no rendered pages found; build the site first")
    if failures:
        print("\n".join(failures))
        return 1
    print(f"PASS: {checked} pages have one leading H1 and no skipped heading levels.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
