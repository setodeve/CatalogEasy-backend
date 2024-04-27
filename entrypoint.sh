#!/bin/bash
set -e

rm -f /app/tmp/pids/server.pid

if [ "$RAILS_ENV" = "production" ]; then
  sudo service nginx start
  cd /app
  bin/setup
  bundle exec pumactl start
else
  exec "$@"
fi