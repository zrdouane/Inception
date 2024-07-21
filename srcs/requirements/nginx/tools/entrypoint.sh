#!/bin/sh

file="/etc/nginx/sites-enabled/default"

# Replace /etc/nginx/ssl/ with the value of CERTS_ environment variable
sed -i "s|/etc/nginx/ssl/|${CERTIFICATES}|g" "$file"

# Replace localhost with the value of DOMAIN_NAME environment variable
sed -i "s|localhost|${DOMAIN_NAME}|g" "$file"

# Start Nginx
nginx -g 'daemon off;'

