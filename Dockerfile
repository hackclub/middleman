# Use the official NGINX image as a base
FROM nginx:alpine

# Copy the custom NGINX config file to the container
COPY nginx.conf /etc/nginx/nginx.conf

RUN nginx -t

# Expose port 80 for external access
EXPOSE 80
