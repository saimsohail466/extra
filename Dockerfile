FROM ruby:3.0.2

RUN apt-get update && apt-get install -y nodejs postgresql-client postgresql-dev

WORKDIR /app
COPY Gemfile* .
RUN bundle install

RUN rails db:migrate

COPY . .
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
