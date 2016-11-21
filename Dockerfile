FROM nginx

ADD entrypoint.sh /entrypoint.sh
ADD https://github.com/coreos/etcd/releases/download/v3.0.15/etcd-v3.0.15-linux-amd64.tar.gz /etcd.tar.gz
RUN tar xvzf /etcd.tar.gz -C /tmp && mv /tmp/etcd-v3.0.15-linux-amd64/etcd* /bin/ && rm -rf /tmp/etcd* /etcd.tar.gz
CMD ["/entrypoint.sh"]
