FROM php:8-alpine

LABEL maintainer="nucreativa@gmail.com"

RUN set -ex \
    # install bash
    && apk add --no-cache --update --virtual .phpize-deps $PHPIZE_DEPS \
    curl\
    bash \
    libssh2-dev \
    autoconf \
    build-base \
    gpgme \ 
    gpgme-dev \ 
    gnupg \
    && pecl install ssh2-1.3.1 gnupg \
    && docker-php-ext-enable ssh2 gnupg \
    && apk del .phpize-deps \
    && rm -rf /usr/src/php*

CMD ["crond", "-f"]
