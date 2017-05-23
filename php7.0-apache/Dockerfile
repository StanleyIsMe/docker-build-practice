FROM ubuntu:14.04
MAINTAINER Stanley <grimmh6919@hotmail.com.tw>

ENV DEBIAN_FRONTEND noninteractive

# install some package
RUN apt-get update && apt-get install -y python-software-properties software-properties-common && \
	add-apt-repository -y ppa:ondrej/php && apt-get update && \
	apt-get install -y --force-yes build-essential  ca-certificates supervisor wget curl git vim apache2 && \
	apt-get install -y --force-yes php-pear php-dev libcurl4-openssl-dev php7.1 php7.1-mysql php7.1-fpm php7.1-cli \
	php7.1-common php7.1-curl php7.1-gd php7.1-intl php7.1-json php7.1-mbstring php7.1-mcrypt php7.1-opcache \ 
	php7.1-pgsql php7.1-dba php7.1-phpdbg php7.1-soap php7.1-sqlite3 php7.1-xml php7.1-xmlrpc \ 
	php7.1-xsl php7.1-zip php-mongodb php-memcache php-memcached php-redis php-xdebug libapache2-mod-php7.1 && \
	curl -sS https://getcomposer.org/installer | php && \
	mv composer.phar /usr/local/bin/composer
	
RUN apt-get autoclean && apt-get -y autoremove && rm -rf /var/lib/apt/lists/* && \
	phpenmod mcrypt && \
	/usr/sbin/a2ensite default-ssl && /usr/sbin/a2enmod ssl && \
	echo "<?php echo phpinfo();" > /var/www/html/index.php
	
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
EXPOSE 80 8080 443
