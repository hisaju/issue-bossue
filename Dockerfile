ARG RUBY_VERSION=ruby:3.2.5
FROM $RUBY_VERSION

ENV LANG C.UTF-8
ENV TZ Asia/Tokyo
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client yarn
RUN mkdir /app
WORKDIR /app
RUN gem install bundler
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
#COPY yarn.lock /app/yarn.lock
RUN bundle install
#RUN yarn install
COPY . /app

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
