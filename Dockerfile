FROM dperson/samba:amd64

RUN apk add --no-cache --update --upgrade \
    cifs-utils \
    coreutils \
    python3 \
    supervisor

RUN mkdir /share /remote
COPY ./supervisord.conf /etc/supervisord.conf

COPY ./watcher.py /watcher.py

# Docker Healthcheck
COPY ./docker-healthcheck.sh /docker-healthcheck.sh
RUN chmod +x /docker-healthcheck.sh
HEALTHCHECK --interval=30s --timeout=15s --start-period=5s --retries=3 \
    CMD ["/docker-healthcheck.sh"]

# Docker Entrypoint
COPY ./docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]