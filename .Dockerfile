# Use official PHP image with Apache
FROM php:8.2-apache

# Set working directory inside container
WORKDIR /var/www/html

# Copy all project files to container
COPY . /var/www/html/

# If you use Composer, install it
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Install PHP extensions if needed (example: mysqli, pdo, gd)
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Enable Apache mod_rewrite (common for PHP apps)
RUN a2enmod rewrite

# Set proper permissions (important for some PHP frameworks)
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Expose port 80
EXPOSE 80

# Start Apache in foreground
CMD ["apache2-foreground"]
