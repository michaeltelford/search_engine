FROM ruby:3.0.6 AS builder

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /usr/src/app

RUN apt update && apt install -y nodejs

COPY ./lib/search_engine/version.rb ./lib/search_engine/
COPY search_engine.gemspec Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

ENV PORT="8080"
# ENV WGIT_CONNECTION_STRING="mongodb://rubyapp:abcdef@localhost/crawler"

CMD ["bundle", "exec", "rake", "serve!"]
