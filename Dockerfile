FROM ruby:2.4.0-alpine

RUN apk update && apk add nodejs build-base libxml2-dev libxslt-dev postgresql postgresql-dev curl
RUN mkdir /app
WORKDIR /app

RUN curl -L https://codeclimate.com/downloads/test-reporter/test-reporter-latest-linux-amd64 > "/usr/local/bin/cc-test-reporter"
RUN chmod +x "/usr/local/bin/cc-test-reporter"

COPY Gemfile ./Gemfile
COPY Gemfile.lock ./Gemfile.lock

RUN bundle install -j 20
COPY . .
