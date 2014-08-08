#! /bin/bash

sed -i /etc/fluent/fluent.conf -e s/LIBRATO_EMAIL/$LIBRATO_EMAIL/g -e s/LIBRATO_API_KEY/$LIBRATO_API_KEY/g

fluentd -c /etc/fluent/fluent.conf -vv
