# Base image
FROM php:8.1-fpm

# Arguments defined in docker-compose.yml
ARG user
ARG uid

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip


# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Create system user to run Composer and Artisan Commands
RUN useradd -G www-data,root -u $uid -d /home/$user $user
RUN mkdir -p /home/$user/.composer && \
   chown -R $user:$user /home/$user

RUN chown -R www-data:www-data /var/www

ADD . /var/www

WORKDIR /var/www

USER $user

RUN chown -R www-data:www-data /var/www

RUN chown -R $USER:$USER .

RUN chmod -R 755 /var/www/storage

RUN chown -R www-data:www-data storage

RUN php --version
RUN echo 'butt sahib here'
RUN composer install
RUN composer --version
RUN echo 'printing $testEnvVar nice yaar'
RUN cp .env.example .env
RUN php artisan key:generate
