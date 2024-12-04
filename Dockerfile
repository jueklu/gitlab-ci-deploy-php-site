# Start with the lightweight Alpine Linux image with PHP
FROM php:8.2-alpine

# Set the working directory in the container
WORKDIR /var/www/html

# Create a non-root user and group
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Copy the PHP application from the GitLab repository to the container
COPY php-example /var/www/html

# Change ownership of the application files to the non-root user
RUN chown -R appuser:appgroup /var/www/html

# Expose the default PHP development server port
EXPOSE 8000

# Switch to the non-root user
USER appuser

# Start PHP's built-in development server
CMD ["php", "-S", "0.0.0.0:8000"]
