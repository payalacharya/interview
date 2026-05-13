# Use the official Ubuntu as a parent image
FROM ubuntu:20.04

# Update the package list and install Nginx
RUN apt-get update && apt-get install -y nginx

# Remove the default Nginx index.html file
RUN rm -f /var/www/html/index.nginx-debian.html

# Copy custom static files or configuration (optional)
# COPY ./index.html /var/www/html/

# Expose port 80 to allow web traffic
EXPOSE 80

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]


# Build with custom Dockerfile name
docker build -f Dockerfile -t my-nginx-app .
# List all images
docker images

# Check specific image
docker images my-nginx-app
# Run in foreground
docker run -p 80:80 my-nginx-app

# Run in background (detached mode)
docker run -d -p 80:80 my-nginx-app

# Run with a container name
docker run -d -p 80:80 --name mynginx my-nginx-app
