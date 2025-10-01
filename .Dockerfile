# Use official PHP image with Apache
FROM php:8.2-apache

# Set working directory inside container
WORKDIR /var/www/html

# Copy all project files to container
COPY . .

# If you use Composer, install it
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Install PHP extensions if needed (example: mysqli, pdo, gd)
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Expose port 80
EXPOSE 80
