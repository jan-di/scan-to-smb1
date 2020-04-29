FROM dperson/samba:amd64

RUN apk add --no-cache --update --upgrade \
    cifs-utils \
    coreutils \
    python3 \
    supervisor

COPY ./supervisord.conf /etc/supervisord.conf
COPY ./watcher.py /watcher.py

# Docker Healthcheck
COPY ./docker-healthcheck.sh /docker-healthcheck.sh
RUN chmod +x /docker-healthcheck.sh
HEALTHCHECK --interval=30s --timeout=15s --start-period=5s --retries=3 \
    CMD ["/docker-healthcheck.sh"]

# Docker Entrypoint
COPY ./docker-entrypoint.py /docker-entrypoint.py
RUN chmod +x /docker-entrypoint.py
ENTRYPOINT ["/docker-entrypoint.py"]