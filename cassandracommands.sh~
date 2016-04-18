#!/bin/bash
docker exec -it cassandra bash

cassandra-cli

create keyspace RSS;
use RSS;
create column family Subscriptions
  with column_type = 'Standard'
  and comparator = 'UTF8Type'
  and default_validation_class = 'UTF8Type'
  and key_validation_class = 'UTF8Type';

#docker-compose scale middletier=2 edge=2
