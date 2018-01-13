FROM php:7.1.13-fpm

# set environment variables
ENV COMPOSER_HOME   	$HOME/.composer
ENV HOME 		/home/root
ENV PHPUNIT_VERSION 	5.7.19
ENV GITHUB_TOKEN	a67ac410d97af317cc9e1b89eb4997db149b4c56	
ENV PATH            	vendor/bin:$COMPOSER_HOME/vendor/bin:$PATH

# Install build dependencies.
RUN apt-get update && apt-get install -y curl git wget subversion mariadb-client

RUN apt-get -qq update && apt-get -qq install libxml++2.6-dev > /dev/null
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng12-dev \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd mbstring mysql mysqli pdo pdo_mysql soap
    
RUN apt-get install -y libmcrypt-dev
RUN docker-php-ext-install mcrypt

RUN apt-get install -y libicu-dev
RUN pecl install intl
RUN docker-php-ext-install intl



RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar; \
	chmod +x wp-cli.phar;\
	mv wp-cli.phar /usr/local/bin/wp;

# Install Composer.
RUN mkdir -p $COMPOSER_HOME/vendor/bin; \
	curl -sS https://getcomposer.org/installer | php -- --install-dir=$COMPOSER_HOME/vendor/bin --filename=composer; \
    composer --version; \
    composer config -g github-oauth.github.com $GITHUB_TOKEN

# Install PHPUnit.
RUN composer self-update; \
    composer global require "phpunit/phpunit=${PHPUNIT_VERSION}"; \
    composer global update











