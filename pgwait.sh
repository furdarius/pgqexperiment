#!/bin/bash

set -e

timer="2"

until runuser -l postgres -c 'pg_isready -h localhost -p 5432 -d postgres -U postgres' 2>/dev/null; do
  >&2 echo "Postgres is unavailable - sleeping for $timer seconds"
  sleep $timer
done

>&2 echo "Postgres is up"
