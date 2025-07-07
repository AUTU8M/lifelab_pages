# Stage 1: Build the Flutter web app
FROM ghcr.io/cirruslabs/flutter:3.32.5 as builder

WORKDIR /app

COPY pubspec.* ./
RUN flutter pub get

COPY . .

RUN flutter build web

# Stage 2: Serve the web app using NGINX
FROM nginx:alpine

COPY --from=builder /app/build/web /usr/share/nginx/html