FROM ruby:2.6.5-alpine3.10
LABEL maintainer="marcosx"

# Address validations for https://dev-sec.io/baselines/linux/
RUN chmod 600 /etc/shadow && \
      touch /etc/login.defs

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

