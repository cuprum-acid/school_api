#!/bin/bash
set -e

until PGPASSWORD=$POSTGRES_PASSWORD psql -h "db" -U "postgres" -c '\q'; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done

>&2 echo "Postgres is up - executing command"

if rails db:exists; then
  rails db:migrate
else
  rails db:create db:migrate
fi

rm -f tmp/pids/server.pid

exec "$@" 
