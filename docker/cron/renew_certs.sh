#!/bin/sh

cd /var/www

echo "Generating dummy ceritificate for bon.com"
# mkdir -p "/etc/nginx/sites/ssl/dummy/bon.com"

openssl req -x509 -out "/var/www/docker/nginx/nginx-selfsigned.crt" -keyout "/var/www/docker/nginx/nginx-selfsigned.key" \
  -newkey rsa:2048 -nodes -sha256 \
  -subj '/CN=bon.com' -extensions EXT -config <( \
   printf "[dn]\nCN=bon.com\n[req]\ndistinguished_name = dn\n[EXT]\nsubjectAltName=DNS:bon.com\nkeyUsage=digitalSignature\nextendedKeyUsage=serverAuth")

# docker compose exec --no-TTY nginx nginx -s reload