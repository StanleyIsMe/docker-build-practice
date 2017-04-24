FROM ubuntu:14.04
MAINTAINER Stanley <grimmh6919@hotmail.com.tw>

ENV TIMEOUT 3000
ENV MEMORY 128M
ENV TIMEZONE Asia/Taipei
ENV DEBIAN_FRONTEND noninteractive



# update server
RUN apt-get update && apt-get install -y python-software-properties

# Add PHP 5.6 PPA
RUN apt-get install -y software-properties-common python-software-properties
RUN add-apt-repository -y ppa:ondrej/php5-5.6

# Install tool/pakage
RUN apt-get install --y build-essential  ca-certificates supervisor wget curl git

# Install apache
RUN apt-get install -y apache2

# Install php
RUN apt-get install --y --force-yes libapache2-mod-php5 php5-cli php5-curl php5-dev php5-fpm php5-mcrypt \
	php5-memcached php5-mysqlnd php5-xdebug php5-gd php5-json php5-mongo

# clean apt cache
apt-get autoclean && apt-get -y autoremove && rm -rf /var/lib/apt/lists/*

# forward request and error logs to docker log collector
#RUN ln -sf /dev/stdout /var/log/nginx/access.log
#RUN ln -sf /dev/stderr /var/log/nginx/error.log

# modified php.ini
#RUN sed -i 's/^;date.timezone =.*/date.timezone = ${TIMEZONE}/g' /etc/php5/fpm/php.ini

# install composer
RUN  curl -sS https://getcomposer.org/installer | php
RUN  mv composer.phar /usr/local/bin/composer

# enable PHP module
RUN php5enmod mcrypt

# modified php.ini
#RUN sed -i "s/^memory_limit =.*/memory_limit = ${MEMORY}/g" /etc/php5/fpm/php.ini && \
#    sed -i "s/^max_execution_time =.*/max_execution_time = ${TIMEOUT}/g" /etc/php5/fpm/php.ini && \
#    sed -i "s/^error_reporting =.*/error_reporting = E_ALL \| E_STRICT/g" /etc/php5/fpm/php.ini && \
#    sed -i "s/^display_errors =.*/display_errors = On/g" /etc/php5/fpm/php.ini && \
#    sed -i "s/^display_startup_errors =.*/display_startup_errors = On/g" /etc/php5/fpm/php.ini


# nginx setting
#VOLUME ["/var/cache/nginx"]
#RUN mv /etc/nginx/sites-available/default /etc/nginx/sites-available/default.original
#COPY ./default /etc/nginx/sites-enabled/default
#RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# copy code
#COPY ./app ./usr/share/nginx/html/myApp/app
#COPY ./bootstrap ./usr/share/nginx/html/myApp/bootstrap
#COPY ./database ./usr/share/nginx/html/myApp/database
#COPY ./public ./usr/share/nginx/html/myApp/public
#COPY ./resources ./usr/share/nginx/html/myApp/resources
#COPY ./tests ./usr/share/nginx/html/myApp/tests
#COPY ./codeception.yml ./usr/share/nginx/html/myApp/codeception.yml

# Install composer packages
#COPY ./composer.json ./usr/share/nginx/html/myApp
#COPY ./composer.lock ./usr/share/nginx/html/myApp
#COPY ./.env.example ./usr/share/nginx/html/myApp
#COPY ./.env.example ./usr/share/nginx/html/myApp/.env

#RUN cd /usr/share/nginx/html/myApp && composer install --optimize-autoloader

CMD service php5-fpm start

EXPOSE 80 8080 443
