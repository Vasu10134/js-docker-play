# Use the official Nginx image as the base
FROM nginx:alpine

# Set environment variables for optimization
ENV NGINX_HOST=localhost
ENV NGINX_PORT=80

# Install any additional dependencies (for example, to optimize the image)
RUN apk update && apk add --no-cache \
    bash \
    curl \
    && rm -rf /var/cache/apk/*

# Copy the custom Nginx configuration file into the container
# This could include things like setting cache headers, custom routing, etc.
COPY nginx.conf /etc/nginx/nginx.conf

# Copy all project files to the default Nginx HTML directory
COPY . /usr/share/nginx/html

# Ensure the files have correct permissions
RUN chmod -R 755 /usr/share/nginx/html

# Expose port 80 (default Nginx port)
EXPOSE 80

# Add a health check to ensure the Nginx service is running properly
HEALTHCHECK --interval=5m --timeout=3s \
    CMD curl --fail http://localhost:$NGINX_PORT/ || exit 1

# Command to run Nginx in the foreground (it’s the default for the Nginx image)
CMD ["nginx", "-g", "daemon off;"]
