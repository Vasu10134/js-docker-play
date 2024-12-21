# Use the official Nginx image as the base
FROM nginx:alpine

# Copy all project files to the default Nginx HTML directory
COPY . /usr/share/nginx/html

# Expose port 80 (default Nginx port)
EXPOSE 80
