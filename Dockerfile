FROM debian:latest AS build-env

# Install flutter dependencies
RUN apt-get update
RUN apt-get install -y curl git wget unzip libstdc++6 libglu1-mesa fonts-noto-core python3
RUN apt-get clean

# Stage 2 - Create the run-time image
FROM nginx:1.21.1-alpine
COPY build/web /usr/share/nginx/html

COPY nginx.conf /etc/nginx/
EXPOSE 9080
CMD ["nginx", "-g", "daemon off;"]