FROM ruby:3.4.1

WORKDIR /app

RUN apt-get update && apt-get install -y postgresql-client

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
CMD ["rails", "server", "-b", "0.0.0.0"]
