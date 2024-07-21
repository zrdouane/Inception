# Use the latest stable version of Debian Bullseye
FROM debian:bullseye

# Install dependencies
RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
    nginx \
    openssl \
    curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

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
RUN chmod +x /entrypoint.sh

# Expose HTTPS port
EXPOSE 443

# Set entrypoint to shell script
ENTRYPOINT ["/entrypoint.sh"]

