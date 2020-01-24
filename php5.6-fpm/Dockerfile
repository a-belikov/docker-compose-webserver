FROM php:5.6-fpm

RUN echo "deb http://ftp.ru.debian.org/debian/ jessie main contrib non-free" >> /etc/apt/sources.list



RUN apt-get update
RUN apt-get install -y \
    libpng-dev \
    libmcrypt-dev \
    git \
    unzip \
    libz-dev


#RUN apt-get update -y && apt-get install -y sendmail libpng-dev
#RUN apt-get install -y zlib1g-dev 


# Install memcached
#RUN apt-get -y install libmemcached-dev
#RUN pecl install memcached-2.2.0
#RUN echo extension=memcached.so >> /usr/local/etc/php/conf.d/memcached.ini
#RUN pecl install memcache-2.2.7
#RUN echo extension=memcache.so >> /usr/local/etc/php/conf.d/memcache.ini


#RUN docker-php-ext-configure opcache --enable-opcache && docker-php-ext-install opcache


# Copy configuration

#ADD opcache.ini /usr/local/etc/php/conf.d/
ADD php.ini /usr/local/etc/php/conf.d/


 

# Install redis
#RUN curl -L -o /tmp/redis.tar.gz https://github.com/phpredis/phpredis/archive/2.2.7.tar.gz \
#    && tar xfz /tmp/redis.tar.gz \
#    && rm -r /tmp/redis.tar.gz \
#    && mkdir -p /usr/src/php/ext \
#    && mv phpredis-2.2.7 /usr/src/php/ext/redis \
#    && docker-php-ext-install redis

# install composer
RUN curl -sS https://getcomposer.org/installer | php -- --filename=composer --install-dir=/bin
ENV PATH /root/.composer/vendor/bin:$PATH

## install phpunit
#RUN composer require --dev phpunit/phpunit ^5

#wget -O phpunit.phar https://phar.phpunit.de/phpunit-5.phar
RUN curl https://phar.phpunit.de/phpunit-5.phar -L > phpunit.phar \
  && chmod +x phpunit.phar \
  && mv phpunit.phar /usr/local/bin/phpunit \
  && phpunit --version
 



# Set timezone
RUN rm /etc/localtime
RUN ln -s /usr/share/zoneinfo/Europe/Moscow /etc/localtime

RUN "date"

RUN apt-get install libjpeg-dev -y
#-- RUN apt-get install libgd2-xpm-dev* -y


RUN apt-get install -y --no-install-recommends \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng12-dev \
    libxpm-dev \
    libvpx-dev \
&& docker-php-ext-configure gd \
    --with-freetype-dir=/usr/lib/x86_64-linux-gnu/ \
    --with-jpeg-dir=/usr/lib/x86_64-linux-gnu/ \
    --with-xpm-dir=/usr/lib/x86_64-linux-gnu/ \
    --with-vpx-dir=/usr/lib/x86_64-linux-gnu/ \
&& docker-php-ext-install gd




# Type docker-php-ext-install to see available extensions
 
RUN docker-php-ext-install mysql mysqli gettext
RUN docker-php-ext-install mbstring 
RUN docker-php-ext-install mcrypt 
RUN docker-php-ext-install iconv
RUN docker-php-ext-install zip




#install xdebug
#RUN pecl channel-update pecl.php.net
# 2.5.5 for php5
# RUN pecl install -o -f xdebug-2.5.5 
# RUN docker-php-ext-enable xdebug
# RUN echo "error_reporting = E_ALL" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
# RUN echo "display_startup_errors = On" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
# RUN echo "display_errors = On" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
# RUN echo "xdebug.remote_enable=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
# RUN echo "xdebug.remote_autostart=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
# RUN echo "xdebug.extended_info = 1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
# RUN echo "xdebug.remote_connect_back=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
# RUN echo "xdebug.remote_host=localhost" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
# RUN echo "xdebug.idekey=\"geben\"" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
# RUN echo "xdebug.remote_port=9001" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini


# RUN echo 'alias sf="php app/console"' >> ~/.bashrc
# RUN echo 'alias sf3="php bin/console"' >> ~/.bashrc

WORKDIR /var/www/vhosts/site

EXPOSE 9001
