FROM php:8.2-apache

# Render routes traffic to port 10000 for Docker services.
RUN sed -i 's/Listen 80/Listen 10000/' /etc/apache2/ports.conf \
 && sed -i 's/<VirtualHost \*:80>/<VirtualHost *:10000>/' /etc/apache2/sites-available/000-default.conf \
 && a2enmod rewrite

ENV PORT=10000
WORKDIR /var/www/html
COPY --chown=www-data:www-data . /var/www/html/

# Runtime writable folders/files used by this legacy PHP app.
RUN mkdir -p /var/www/html/bots \
 && chown -R www-data:www-data /var/www/html \
 && chmod -R u+rwX,g+rwX /var/www/html/bots \
 && chmod 664 /var/www/html/users.json /var/www/html/bot_sources.json

EXPOSE 10000
