#!/bin/bash

# Install pgq schemas and stored procedures.
qadmin -h localhost -p 5432 -U postgres -d postgres -c "install pgq"

# You'll need to have a ticker instance running on the database where events get produced,
# which means you need to provide a ticker.ini configuration file and run a ticker daemon.
pgqd -d ticker.ini
