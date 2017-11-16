#!/bin/sh

cat > /Caddyfile <<EOF
${VIRTUAL_HOST}

tls ${LETSENCRYPT_EMAIL} {
    ca $CA_URI
}
redir / /fossil
cgi /fossil /fossil.cgi
EOF

exec /usr/bin/caddy -conf /Caddyfile
