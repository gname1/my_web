FROM php:7.1.3-apache
RUN docker-php-ext-install mysqli
CMD echo "ServerName localhost:80" >> /etc/apache2/apache2.conf
CMD echo "$cfg['Servers'][$i]['host'] = '127.0.0.1';" >> /etc/phpmyadmin/config.inc.php
COPY . /var/www/html
COPY ./httpd/httpd.conf /usr/local/apache2/conf/httpd.conf
COPY ./php/php.ini /usr/local/etc/php/php.ini
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
