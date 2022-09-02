FROM alpine:3.16

RUN apk update && \
    apk add --no-cache openssl docker-cli docker-cli-compose

COPY renew_certs /bin/renew_certs
COPY root /var/spool/cron/crontabs/root

RUN chmod +x /bin/renew_certs

CMD crond -l 2 -f
# WORKDIR /usr

# RUN crontab -l | { cat; echo "*  *  *  *  *  * /usr/renew_certs.sh"; } | crontab -

# CMD ["crond", "-f", "-d", "8"]