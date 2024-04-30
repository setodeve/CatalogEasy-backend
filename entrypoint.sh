#!/bin/bash
set -e

rm -f /app/tmp/pids/server.pid

if [ "$RAILS_ENV" = "production" ]; then
  # bundle exec rails db:create RAILS_ENV=production
  # bundle exec rails db:migrate RAILS_ENV=production
  # bundle exec rails db:seed RAILS_ENV=production
  bundle exec pumactl start
else
  exec "$@"
fi