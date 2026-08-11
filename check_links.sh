#!/usr/bin/env bash
#
# Builds the site and checks it for broken links (internal and external)
# using lychee (https://lychee.cli.rs/) via Docker. Internal (file://) errors
# are real bugs and should always be fixed. External errors are frequently
# false positives from sites that block non-browser requests - use judgment,
# and add confirmed-flaky domains to lychee.toml's `exclude` list.

set -euo pipefail

repo_dir="$(cd "$(dirname "$0")" && pwd)"
cd "$repo_dir"

echo "Building site (production)..."
docker run --rm --platform linux/amd64 \
    -v "$repo_dir:/srv/jekyll" \
    -e BUNDLE_FROZEN=1 \
    -e JEKYLL_ENV=production \
    shivvrat-jekyll bundle exec jekyll build

echo "Checking links..."
docker run --rm \
    -v "$repo_dir:/data" \
    -w /data \
    lycheeverse/lychee \
    --no-progress \
    --config lychee.toml \
    "$@" \
    '_site/**/*.html'
