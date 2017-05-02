FROM ubuntu:14.04
MAINTAINER Stanley <grimmh6919@hotmail.com.tw>

ENV DEBIAN_FRONTEND noninteractive

# update server
RUN apt-get update && apt-get install -y python-software-properties && \
	apt-get install -y software-properties-common python-software-properties && \
	add-apt-repository -y ppa:ondrej/php 

RUN	apt-get install -y build-essential  ca-certificates supervisor wget curl git vim apache2 && \
	apt-get install -y --force-yes libapache2-mod-php5 php5-cli php5-curl php5-dev php5-fpm php5-mcrypt \
	php5-memcached php5-mysqlnd php5-xdebug php5-gd php5-json php5-mongo && \
	apt-get autoclean && apt-get -y autoremove && rm -rf /var/lib/apt/lists/* && \
	curl -sS https://getcomposer.org/installer | php && \
	mv composer.phar /usr/local/bin/composer && \
	php5enmod mcrypt && \
	/usr/sbin/a2ensite default-ssl && /usr/sbin/a2enmod ssl && \
	echo "<?php echo phpinfo();" > /var/www/html/index.php

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
EXPOSE 80 8080 443
