#!/usr/bin/env bash

# Usage: ./init_local_server.sh [port] [livereload_port]
# Defaults: port=4000 (PERSONAL_SITE_PORT/PORT), livereload_port=35729 (PERSONAL_SITE_LIVERELOAD_PORT/LIVERELOAD_PORT).

set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

validate_port() {
  local value="$1"
  local label="$2"
  if [[ ! "$value" =~ ^[0-9]+$ ]] || ((value < 1 || value > 65535)); then
    echo "Error: $label must be an integer between 1 and 65535." >&2
    exit 1
  fi
}

if [[ -n "${1:-}" ]]; then
  validate_port "$1" "port"
  export PERSONAL_SITE_PORT="$1"
fi

if [[ -n "${2:-}" ]]; then
  validate_port "$2" "livereload_port"
  export PERSONAL_SITE_LIVERELOAD_PORT="$2"
fi

bash "$script_dir/docker-jekyll.sh" serve
