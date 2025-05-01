# Use the official NGINX image
FROM nginx:alpine

# Copy custom nginx config
COPY nginx/default.conf /etc/nginx/conf.d/default.conf

# Copy static site files to nginx public directory
COPY src/ /usr/share/nginx/html/

# Expose port 5000 for the web server
EXPOSE 5000

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]