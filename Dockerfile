ARG RUBY_VERSION=ruby:3.2.5

FROM $RUBY_VERSION
ARG RAILS_ENV
ARG RAILS_MASTER_KEY
ARG DATABASE_URL
ENV RAILS_ENV $RAILS_ENV
ENV RAILS_MASTER_KEY $RAILS_MASTER_KEY
ENV DATABASE_URL $DATABASE_URL
ENV LANG C.UTF-8
ENV TZ Asia/Tokyo
RUN env

RUN apt-get update -qq \
    && apt-get install -y ca-certificates curl gnupg apt-utils \
    && mkdir -p /etc/apt/keyrings \
    && curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg \
    && NODE_MAJOR=20 \
    && echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list \
    && wget --quiet -O - /tmp/pubkey.gpg https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client yarn
RUN mkdir /app
WORKDIR /app
RUN gem install bundler
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
COPY yarn.lock /app/yarn.lock
RUN bundle install
RUN yarn install
COPY . /app

RUN bundle exec rails assets:precompile
RUN bundle exec rails db:prepare

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
