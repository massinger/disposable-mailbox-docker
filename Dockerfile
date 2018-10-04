FROM php:7.2.10-fpm-alpine3.8

LABEL authors="Konstantin Goretzki, Felix Alexa"
LABEL version="v1.1"
LABEL description="This image contains the php-part of our disposable-mailbox-docker-container."

# uses https://github.com/synox/disposable-mailbox
# set version and hash of disposable-mailbox download
ARG DISPMAIL_VERSION=v0.2.1
ARG DISPMAIL_DOWNLOAD_SHA512=c252c8eb1c161ee90dfcd5201d68bed840ad3eb5203aa1d0db56f625e1ff8d60300dd2f14d9bcc11de39e17f6b1297dc8445b4ba6fd6dabc62a38d783a7f74d0

RUN apk update \
    && apk add --no-cache curl-dev imap-dev \
    && docker-php-ext-configure imap --with-imap --with-imap-ssl \
    && docker-php-ext-install -j$(nproc) imap \
    && cd /tmp/ \
    && curl -fSL -o dispmail.tar.gz "https://github.com/synox/disposable-mailbox/archive/$DISPMAIL_VERSION.tar.gz" \
    && echo "$DISPMAIL_DOWNLOAD_SHA512  dispmail.tar.gz" | sha512sum -c \
    && tar -xf /tmp/dispmail.tar.gz --strip-components=1 \
    && mv src/* /var/www/html \
    && rm -rf /tmp/*

VOLUME ["/var/www/html"]
