FROM php:7.2-fpm
MAINTAINER Stanley <stanley.hsieh@storm.mg>

# install some package
RUN apt-get update

# install extension
RUN	apt-get install -y build-essential wget curl git vim unzip apt-utils zlib1g-dev libmemcached-dev libcurl4-openssl-dev
RUN    pecl install redis-4.0.1 
RUN    pecl install memcached-3.0.4 
RUN    pecl install mongodb-1.5.3 
RUN    docker-php-ext-enable redis mongodb memcached

# install composer 
RUN curl -sS https://getcomposer.org/installer | php && \
	mv composer.phar /usr/local/bin/composer

RUN apt-get install -y libicu-dev libfreetype6-dev libjpeg62-turbo-dev libpng-dev libxml2 \
    && docker-php-ext-install -j$(nproc) iconv \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd

RUN apt-get install -y libxml2-dev libxslt1-dev libmysql++-dev libmcrypt-dev 

RUN docker-php-ext-configure xml --with-libxml-dir=/usr/local/bin/xml2-config 

RUN docker-php-ext-install pdo 
RUN docker-php-ext-install pdo_mysql 
RUN docker-php-ext-install intl 
RUN docker-php-ext-install curl 
RUN docker-php-ext-install json 
RUN docker-php-ext-install opcache
RUN docker-php-ext-install xml 
RUN docker-php-ext-install xmlrpc 
RUN docker-php-ext-install xsl 
RUN docker-php-ext-install zip 
RUN docker-php-ext-install soap 
RUN docker-php-ext-install mbstring

RUN pecl install mcrypt-1.0.1 && docker-php-ext-enable mcrypt
RUN    docker-php-ext-enable mcrypt

RUN apt-get install -y nginx supervisor
COPY nginx.conf /etc/nginx

# clear apt-get cache
RUN apt-get autoclean && apt-get -y autoremove && rm -rf /var/lib/apt/lists/*

COPY opcache.ini /usr/local/etc/php/conf.d/opcache.ini
COPY php.ini /usr/local/etc/php/php.ini	
COPY supervisord.conf /etc/supervisord.conf
COPY supervisor.d /etc/supervisor.d

WORKDIR /var/www/html

EXPOSE 80 433

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]



