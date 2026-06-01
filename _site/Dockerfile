FROM ruby:3.2.3-slim-bookworm

ENV BUNDLE_PATH=/usr/local/bundle \
    BUNDLE_BIN=/usr/local/bundle/bin \
    GEM_HOME=/usr/local/bundle \
    PATH=/usr/local/bundle/bin:$PATH \
    JEKYLL_ENV=development

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential \
        imagemagick \
        git \
        libffi-dev \
        libmagickwand-dev \
        libxml2-dev \
        libxslt1-dev \
        libyaml-dev \
        nodejs \
        openssh-client \
        pkg-config \
        zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /srv/jekyll

COPY Gemfile ./
COPY Gemfile.lock ./

RUN bundle install

COPY . .

EXPOSE 4000 35729

CMD ["sh", "-c", "echo \"Local URL: http://localhost:4000\" && bundle exec jekyll serve --config _config.yml,_config_docker.yml --livereload --trace --force_polling"]
