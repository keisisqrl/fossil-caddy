FROM alpine:3.18

ENV CADDYPATH /fossil-data
ENV CA_URI https://acme-staging.api.letsencrypt.org/directory

RUN apk add --no-cache fossil curl caddy s6 ca-certificates \
    && apk del curl

ADD service /service

VOLUME /fossil-data

EXPOSE 80 443

ENTRYPOINT ["s6-svscan","/service"]
