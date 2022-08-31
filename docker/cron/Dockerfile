FROM alpine:3.16

RUN apk update && \
    apk add --no-cache openssl docker-cli docker-cli-compose

COPY renew_certs.sh /etc/periodic/daily/renew_certs

RUN chmod +x /etc/periodic/daily/renew_certs

WORKDIR /etc/periodic/daily

RUN crontab -l | { cat; echo "*/30 *  *  *  *  *  /etc/periodic/daily"; } | crontab -

CMD ["crond", "-l 2", "-f"]