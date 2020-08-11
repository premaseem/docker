FROM ubuntu:bionic-20190612
LABEL maintainer="identity@rackspace.com"

ENV SQUID_VERSION=3.5.27 \
    SQUID_CACHE_DIR=/var/spool/squid \
    SQUID_LOG_DIR=/var/log/squid \
    SQUID_USER=proxy

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y squid=${SQUID_VERSION}* curl \
 && rm -rf /var/lib/apt/lists/*

COPY squid.conf /etc/squid/squid.conf
RUN chmod 755 /etc/squid/squid.conf

COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod 755 /sbin/entrypoint.sh

HEALTHCHECK --interval=30s --timeout=3s CMD curl -f --max-time 10 http://localhost:3128; if [ $? -ne 22 ]; then kill 1 && exit 1; fi

EXPOSE 3128/tcp
ENTRYPOINT ["/sbin/entrypoint.sh"]
