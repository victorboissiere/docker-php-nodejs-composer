FROM php:7.2-fpm-alpine3.6

# Install main php extensions
RUN apk --update add curl && docker-php-ext-install mbstring pdo_mysql
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install NodeJS and yarn
RUN apk add nodejs
RUN echo -e 'http://dl-cdn.alpinelinux.org/alpine/edge/main\nhttp://dl-cdn.alpinelinux.org/alpine/edge/community\nhttp://dl-cdn.alpinelinux.org/alpine/edge/testing' > /etc/apk/repositories && \
apk add --no-cache yarn


RUN php --version
RUN composer --version
RUN node --version
RUN yarn --version

