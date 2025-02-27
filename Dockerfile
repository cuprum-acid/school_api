FROM ruby:3.4.1

WORKDIR /app

RUN apt-get update && apt-get install -y postgresql-client

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY entrypoint.sh /app/
RUN chmod +x /app/entrypoint.sh

COPY . .

ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["rails", "server", "-b", "0.0.0.0"]
