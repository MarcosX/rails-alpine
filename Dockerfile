FROM ruby:2.6.5-alpine3.10
LABEL maintainer="marcosx"

RUN apk add --no-cache --update \
      build-base \
      linux-headers \
      git \
      postgresql-dev \
      nodejs \
      yarn \
      tzdata && \
      gem install "bundler:~>2.0.0" \
      "rails:~>6.0.1"

