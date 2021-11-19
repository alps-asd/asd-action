FROM php:alpine

COPY --from=composer /usr/bin/composer /usr/bin/composer

RUN apk upgrade --no-cache \
 && apk add --no-cache graphviz

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
