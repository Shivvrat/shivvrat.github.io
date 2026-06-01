#!/usr/bin/env bash

set -euo pipefail

image_name="shivvrat-jekyll"

build_image() {
    docker build -t "$image_name" .
}

get_git_identity() {
    local default_name="Shivvrat Arya"
    local default_email="shivvrat.arya@users.noreply.github.com"
    local git_name
    local git_email

    git_name="$(git config --get user.name 2>/dev/null || true)"
    git_email="$(git config --get user.email 2>/dev/null || true)"

    if [ -z "${git_name:-}" ]; then
        git_name="$default_name"
    fi

    if [ -z "${git_email:-}" ]; then
        git_email="$default_email"
    fi

    export GIT_AUTHOR_NAME="$git_name"
    export GIT_AUTHOR_EMAIL="$git_email"
    export GIT_COMMITTER_NAME="$git_name"
    export GIT_COMMITTER_EMAIL="$git_email"
}

serve_site() {
    docker run --rm -it \
        -p 4000:4000 \
        -p 35729:35729 \
        -v "$PWD:/srv/jekyll" \
        -e BUNDLE_FROZEN=1 \
        "$image_name" \
        sh -c 'echo "Local URL: http://localhost:4000" && bundle exec jekyll serve --config _config.yml,_config_docker.yml --livereload --trace --force_polling'
}

compile_site() {
    docker run --rm \
        -v "$PWD:/srv/jekyll" \
        -e BUNDLE_FROZEN=1 \
        "$image_name" \
        bundle exec jekyll build
}

publish_site() {
    local ssh_dir="${SSH_KEY_DIR:-$HOME/.ssh}"
    local ssh_mount=()

    if [ ! -d "$ssh_dir" ]; then
        echo "Set SSH_KEY_DIR to your SSH key directory before publishing." >&2
        exit 1
    fi

    ssh_mount=(-v "$ssh_dir:/root/.ssh")

    get_git_identity
    docker run --rm \
        -v "$PWD:/srv/jekyll" \
        "${ssh_mount[@]}" \
        -e BUNDLE_FROZEN=1 \
        -e GIT_AUTHOR_NAME \
        -e GIT_AUTHOR_EMAIL \
        -e GIT_COMMITTER_NAME \
        -e GIT_COMMITTER_EMAIL \
        -e GIT_SSH_COMMAND="ssh -o StrictHostKeyChecking=accept-new" \
        "$image_name" \
        bundle exec rake publish --trace
}

open_shell() {
    docker run --rm -it \
        -v "$PWD:/srv/jekyll" \
        -e BUNDLE_FROZEN=1 \
        "$image_name" \
        /bin/bash
}

usage() {
    cat <<'EOF'
Usage: ./docker-jekyll.sh <image|build|compile|serve|dev|run|publish|shell>

Commands:
  image    Build the Docker image.
  build    Alias for compile.
  compile  Build the Jekyll site inside Docker.
  serve    Start the local Jekyll server on http://localhost:4000.
  publish  Compile and publish the site from inside Docker.
  shell    Open a shell inside the container.
EOF
}

command_name="${1:-serve}"

case "$command_name" in
    image)
        build_image
        ;;
    build|compile)
        build_image
        compile_site
        ;;
    serve|dev|run)
        build_image
        serve_site
        ;;
    publish)
        build_image
        publish_site
        ;;
    shell)
        build_image
        open_shell
        ;;
    -h|--help|help)
        usage
        ;;
    *)
        usage >&2
        exit 1
        ;;
esac
