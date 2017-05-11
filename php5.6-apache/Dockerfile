FROM ubuntu:14.04
MAINTAINER Stanley <grimmh6919@hotmail.com.tw>

ENV DEBIAN_FRONTEND noninteractive

# install some package
RUN apt-get update && apt-get install -y python-software-properties software-properties-common && \
	add-apt-repository -y ppa:ondrej/php && apt-get update
 
RUN	apt-get install -y --force-yes build-essential  ca-certificates supervisor wget curl git vim apache2 && \
	apt-get install -y --force-yes libapache2-mod-php5.6 php5.6-cli php5.6-curl php5.6-dev php5.6-fpm php5.6-mcrypt \
	php5.6 php5.6-xml php5.6-mbstring php5.6-common php5.6-pgsql php5.6-xsl php5.6-recode php5.6-zip php5.6-soap\
	php-memcached php-xdebug php5.6-gd php5.6-json php-mongo php5.6-mysql php5.6-intl php5.6-imap php5.6-snmp && \
	curl -sS https://getcomposer.org/installer | php && \
	mv composer.phar /usr/local/bin/composer 




RUN apt-get autoclean && apt-get -y autoremove && rm -rf /var/lib/apt/lists/* && \
	phpenmod mcrypt && \
	/usr/sbin/a2ensite default-ssl && /usr/sbin/a2enmod ssl && \
	echo "<?php echo phpinfo();" > /var/www/html/index.php

VOLUME ~/.composer/cache
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
EXPOSE 80 8080 443
