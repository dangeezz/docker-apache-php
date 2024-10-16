# Dockerfile in app1/docker/Dockerfile and app2/docker/Dockerfile
FROM php:8.2-fpm

# Install dependencies
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    zip \
    unzip


# Install PHP extensions
RUN docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install gd pdo pdo_mysql

# Copy the application files
COPY ./app_1 /var/www/html

# Set the working directory
WORKDIR /var/www/html/public

# Set file permissions
# RUN chown -R www-data:www-data /var/www/html/app_2

# Expose port 9000
EXPOSE 9000
