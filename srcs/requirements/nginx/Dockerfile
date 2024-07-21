# dockerfile
# debian:11 or debian:bullseye is the same :11 just an alias
FROM debian:bullseye
# Install dependencies
RUN apt-get update -y && apt-get install -y --no-install-recommends \
    nginx=1.18.0-6.1+deb11u3 openssl=1.1.1w-0+deb11u1 \
    curl=7.74.0-1.3+deb11u11 && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Create directories and generate SSL certificate
RUN mkdir -p /etc/nginx/ssl /var/run/nginx && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/nginx.key \
    -out /etc/nginx/ssl/nginx.crt \
    -subj "/C=Dz/ST=Oujda/L=oujda/O=ZONE_01/CN=inception"

# Copy configuration and shell script
COPY ./conf/default /etc/nginx/sites-enabled/
COPY tools/entrypoint.sh /entrypoint.sh

# Set permissions
RUN chmod 755 /var/www/html && chown -R www-data:www-data /var/www/html
RUN chmod +x /entrypoint.sh

# Expose HTTPS port
EXPOSE 443

# Set entrypoint to shell script
ENTRYPOINT ["/entrypoint.sh"]
