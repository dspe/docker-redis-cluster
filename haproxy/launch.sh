#!/bin/bash

# Remove haproxy PID file, in case we're restarting
[[ -f /var/run/haproxy.pid ]] && rm /var/run/haproxy.pid

[[ -f /etc/haproxy/haproxy.cfg ]] && rm /etc/haproxy/haproxy.cfg


/usr/bin/consul-template -config=/tmp/haproxy.json \
                               -wait=2s:10s \
                               -log-level=debug \
                               -consul-addr=consul:8500

/usr/sbin/haproxy -c -V -f /etc/haproxy/haproxy.cfg
