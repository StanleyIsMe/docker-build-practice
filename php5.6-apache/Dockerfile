FROM ubuntu:14.04
MAINTAINER Stanley <grimmh6919@hotmail.com.tw>

ENV DEBIAN_FRONTEND noninteractive

# install some package
RUN apt-get update && apt-get install -y python-software-properties software-properties-common && \
	add-apt-repository -y ppa:ondrej/php 
 
RUN	apt-get install -y build-essential  ca-certificates supervisor wget curl git vim apache2 && \
	apt-get install -y --force-yes libapache2-mod-php5 php5-cli php5-curl php5-dev php5-fpm php5-mcrypt \
	php5-memcached php5-mysqlnd php5-xdebug php5-gd php5-json php5-mongo && \
	curl -sS https://getcomposer.org/installer | php && \
	mv composer.phar /usr/local/bin/composer 
	
RUN apt-get autoclean && apt-get -y autoremove && rm -rf /var/lib/apt/lists/* && \
	php5enmod mcrypt && \
	/usr/sbin/a2ensite default-ssl && /usr/sbin/a2enmod ssl && \
	echo "<?php echo phpinfo();" > /var/www/html/index.php

VOLUME ~/.composer/cache
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
EXPOSE 80 8080 443


