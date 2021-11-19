FROM php:latest

COPY --from=composer /usr/bin/composer /usr/bin/composer

RUN apt-get update \
 && apt-get -y --no-install-recommends install zip unzip graphviz

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
