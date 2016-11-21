#!/bin/bash
export ETCDCTL_ENDPOINT='http://etcd:2379'
export ETCDCTL_API='2'

# Set frontend
/bin/etcdctl set /traefik/frontends/web/backend "web"
/bin/etcdctl set /traefik/frontends/web/entrypoints "http"
/bin/etcdctl set /traefik/frontends/web/routes/frontpage/rule "Host:localhost"

# Set backend server
/bin/etcdctl set /traefik/backends/web/servers/`hostname`/url "http://test:80"
/bin/etcdctl set /traefik/backends/web/servers/`hostname`/weight "1"

nginx -g 'daemon off;'
