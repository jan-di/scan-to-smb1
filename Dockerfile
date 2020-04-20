FROM dperson/samba:amd64

RUN apk add --no-cache --update \
    cifs-utils 

RUN mkdir /share

COPY ./docker-cmd.sh /docker-cmd.sh
RUN chmod +x /docker-cmd.sh
ENTRYPOINT ["/docker-cmd.sh"]