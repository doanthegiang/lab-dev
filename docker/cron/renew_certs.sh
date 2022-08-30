#!/bin/sh

set -e

echo "Generating dummy ceritificate for bon.com"
# mkdir -p "/etc/nginx/sites/ssl/dummy/bon.com"
printf "[dn]\nCN=bon.com\n[req]\ndistinguished_name = dn\n[EXT]\nsubjectAltName=DNS:bon.com, DNS:www.bon.com\nkeyUsage=digitalSignature\nextendedKeyUsage=serverAuth" > openssl.cnf
openssl req -x509 -out "/var/nginx/docker/nginx/nginx-selfsigned.crt" -keyout "/var/nginx/docker/nginx/nginx-selfsigned.key" \
    -newkey rsa:2048 -nodes -sha256 \
    -subj "/CN=bon.com" -extensions EXT -config openssl.cnf
rm -f openssl.cnf
  