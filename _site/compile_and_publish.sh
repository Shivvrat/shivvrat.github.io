#!/usr/bin/env bash

set -euo pipefail

bash "$(dirname "$0")/docker-jekyll.sh" publish
