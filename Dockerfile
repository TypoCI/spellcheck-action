FROM ruby:2.7.1-alpine AS builder

LABEL com.github.actions.name="Typo CI - Spellcheck Action" \
      com.github.actions.description="Check for typos & spelling mistakes, then displays suggestions." \
      com.github.actions.icon="code" \
      com.github.actions.color="green" \
      maintainer="Mike Rogers <me@mikerogers.io>"

RUN apk --no-cache add build-base git hunspell tzdata libffi-dev yarn

FROM builder AS development

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ENV PATH /usr/src/app/bin:$PATH

# Install latest bundler
RUN bundle config --global silence_root_warning 1

FROM development AS production

ENV APP_ENV production

# Install Ruby Gems
COPY .ruby-version /usr/src/app
COPY Gemfile /usr/src/app
COPY Gemfile.lock /usr/src/app
RUN bundle check || bundle install --jobs=$(nproc)

# Install Yarn Libraries
COPY package.json /usr/src/app
COPY yarn.lock /usr/src/app
RUN yarn install --check-files

# Copy the reset of the app
COPY . /usr/src/app

# Setup any remaining dependencies
RUN bin/setup

ENTRYPOINT ["/usr/src/app/entrypoint.sh"]
