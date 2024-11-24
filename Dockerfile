# Stage 1: Build the app
FROM node:20-alpine AS build

WORKDIR /app/sample-app

# Copy package files and install dependencies
COPY sample-app/package*.json ./
RUN npm ci

# Copy the rest of the app and build it
COPY sample-app/ .
RUN npm run build

# Stage 2: Create the production image
FROM nginx:alpine

# Copy the dist directory from the build stage to the nginx server
COPY --from=build /app/sample-app/dist /usr/share/nginx/html

# Expose port 80 for the app to be served
EXPOSE 80

# Start nginx to serve the static files
CMD ["nginx", "-g", "daemon off;"]
