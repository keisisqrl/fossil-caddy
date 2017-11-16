FROM alpine:3.6

ENV FOSSILVER 2.4
ENV CADDYPATH /fossil-data
ENV CA_URI https://acme-staging.api.letsencrypt.org/directory

ADD runserver.sh /runserver.sh
ADD fossil.cgi /fossil.cgi

RUN apk add --no-cache curl tini ca-certificates \
    && curl https://www.fossil-scm.org/index.html/uv/fossil-linux-x64-${FOSSILVER}.tar.gz \
    | tar xzf - \
    && curl -L 'https://caddyserver.com/download/linux/amd64?plugins=http.cgi&license=personal' \
    | tar xzf - caddy \
    && chmod +x fossil caddy runserver.sh fossil.cgi \
    && mv fossil caddy /usr/bin \
    && apk del curl

VOLUME /fossil-data

EXPOSE 80 443

ENTRYPOINT ["tini", "--"]

CMD /runserver.sh
