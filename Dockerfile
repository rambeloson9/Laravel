FROM php:7.4-apache

RUN docker-php-ext-install pdo_mysql
RUN a2enmod rewrite
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY . /var/www/html/

WORKDIR /var/www/html

RUN composer install
RUN composer create-project laravel/laravel tu-proyecto - -prefer-dist

EXPOSE 80

CMD ["apache2-foreground"]