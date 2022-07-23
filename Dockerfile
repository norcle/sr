FROM ruby:3.0.2

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN set -eux && \
  echo 'gem: --no-rdoc --no-ri' >> ~/.gemrc && \
  gem install bundler:2.2.22 && \
  bundle config no-cache true && \
  bundle config jobs 10 && \
  bundle config retry 5

RUN bundle install --jobs 20 --retry 5 && bundle clean --force

RUN \
  curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
  apt-get update -qq && DEBIAN_FRONTEND=noninteractive apt-get -yq dist-upgrade && \
  DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
    nodejs \
    build-essential \
    gnupg2 \
    curl \
    less \
    git \
    locales \
    tzdata \
    time \
  && update-locale LANG=C.UTF-8 LC_ALL=C.UTF-8 \
  && apt-get autoremove -y \
  && apt-get clean \
  && rm -rf /var/cache/apt/archives/* \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && truncate -s 0 /var/log/*log \
  && npm install -g yarn

COPY package.json yarn.lock ./

RUN set -eux && \
  yarn install && yarn cache clean

COPY . .
#RUN bin/rake webpacker:compile

ENTRYPOINT ["bundle", "exec"]
