FROM ubuntu:16.04
MAINTAINER Stanley <grimmh6919@hotmail.com.tw>

ENV DEBIAN_FRONTEND noninteractive
ENV LANG en_US.UTF-8

# install some package
RUN apt-get update && apt-get install -y apt-utils python-software-properties 
RUN apt-get install -y language-pack-en
RUN locale-gen en_US.UTF-8
RUN apt-get install -y software-properties-common && \
	add-apt-repository -y ppa:ondrej/php && apt-get update

RUN	apt-get install -y --force-yes build-essential  ca-certificates supervisor wget curl git vim unzip pkg-config&& \
	apt-get install -y --force-yes php-pear php-dev libcurl4-openssl-dev php7.1 php7.1-mysql php7.1-fpm php7.1-cli \
	php7.1-common php7.1-curl php7.1-gd php7.1-intl php7.1-json php7.1-mbstring php7.1-mcrypt php7.1-opcache \ 
	php7.1-pgsql php7.1-dba php7.1-phpdbg php7.1-soap php7.1-sqlite3 php7.1-xml php7.1-xmlrpc \ 
	php7.1-xsl php7.1-zip php-mongodb php-memcache php-memcached php-redis php-xml && \	
	curl -sS https://getcomposer.org/installer | php && \
	mv composer.phar /usr/local/bin/composer 

RUN pecl install mongodb

# exclude from something unnecessary bug
RUN apt-get purge -y php7.2-*

# clear apt-get cache
RUN apt-get autoclean && apt-get -y autoremove && rm -rf /var/lib/apt/lists/* && \
	phpenmod mcrypt

# setting php-fpm && php.ini
RUN sed -i 's/^listen =.*/listen = [::]:9000/g' /etc/php/7.1/fpm/pool.d/www.conf  && \
    sed -i 's/^;clear_env =/clear_env =/g' /etc/php/7.1/fpm/pool.d/www.conf && \
    echo "extension=mongodb.so" >> /etc/php/7.1/fpm/php.ini

# setting supervisor 
COPY ./php-fpm.conf /etc/supervisor/conf.d/php-fpm.conf
COPY ./supervisord.conf /etc/supervisor/supervisord.conf
RUN mkdir -p /var/log/supervisor

# php-fpm start
RUN service php7.1-fpm start
RUN /usr/sbin/php-fpm7.1

WORKDIR /var/www/html
RUN echo "<?php echo phpinfo();" > /var/www/html/index.php

EXPOSE 9000
CMD ["/usr/bin/supervisord"]
