FROM php:8.2-fpm

# Zaruriy kutubxonalarni o‘rnatish
RUN apt-get update && apt-get install -y \
    zip unzip curl libpng-dev libjpeg-dev libfreetype6-dev libonig-dev libxml2-dev \
    && docker-php-ext-install pdo_mysql mbstring gd \
    && pecl install redis \
    && docker-php-ext-enable redis \
    && apt-get clean && rm -rf /var/lib/apt/lists/*
# Composer o‘rnatish
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Ishchi katalogni sozlash
WORKDIR /var/www
COPY . .

# Laravel uchun kutubxonalarni o‘rnatish
RUN composer install

# Laravel uchun huquqlarni sozlash
RUN chmod -R 755 storage bootstrap/cache

CMD ["php-fpm"]
