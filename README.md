# fossil-caddy

Deploy [fossil](https://fossil-scm.org/) together with [caddy](https://cadyserver.com)
for automatic https and hosting.

Everything lives in a volume at /fossil-data.

Required ENVs:

VIRTUAL_HOST - hostname
LETSENCRYPT_EMAIL

**DEFAULTS TO LETSENCRYPT STAGING**

Set CA_URI to something else for prod certificates.

For Let's Encrypt:

https://acme-v01.api.letsencrypt.org/directory