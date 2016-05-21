#!/bin/bash

# If mongod is already running, the command will just exit, no love lost
/usr/bin/mongod --config /etc/mongodb.conf
mongoimport --db test --collection test_collection --drop --file homework2.2.json --jsonArray
