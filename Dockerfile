FROM ghcr.io/cirruslabs/flutter:3.29.0 AS build-env

WORKDIR /app
COPY pubspec.* ./
RUN flutter pub get
COPY . .
RUN flutter build web --no-tree-shake-icons

# Stage 2 - Create the run-time image
FROM nginx:1.21.1-alpine
ARG GIT_SHA=unknown
COPY --from=build-env /app/build/web /usr/share/nginx/html
RUN echo "${GIT_SHA}" > /usr/share/nginx/html/.last_build_id

COPY nginx.conf /etc/nginx/
EXPOSE 9080
CMD ["nginx", "-g", "daemon off;"]