#!/bin/sh

cat > /Caddyfile <<EOF
${VIRTUAL_HOST}

tls ${LETSENCRYPT_EMAIL} {
    ca $CA_URI
}
cgi / /usr/bin/fossil cgi /fossil.cgi
EOF

exec /usr/bin/caddy -conf /Caddyfile
