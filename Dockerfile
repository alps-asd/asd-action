FROM php:latest

COPY --from=composer /usr/bin/composer /usr/bin/composer

RUN apt-get update \
 && apt-get -y --no-install-recommends install zip unzip graphviz \
 && COMPOSER_ALLOW_SUPERUSER=1 composer global require koriym/app-state-diagram

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
