FROM dperson/samba:amd64

RUN apk add --no-cache --update \
    cifs-utils 

RUN mkdir /share

COPY ./docker-healthcheck.sh /docker-healthcheck.sh
RUN chmod +x /docker-healthcheck.sh
HEALTHCHECK --interval=30s --timeout=15s --start-period=5s --retries=3 \
    CMD ["/docker-healthcheck.sh"]

COPY ./docker-cmd.sh /docker-cmd.sh
RUN chmod +x /docker-cmd.sh
ENTRYPOINT ["/docker-cmd.sh"]