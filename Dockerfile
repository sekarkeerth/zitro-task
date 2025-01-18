# Build stage
FROM node:lts-alpine AS build-stage
WORKDIR /app

# Copy package.json and package-lock.json separately to leverage caching
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy application files
COPY . .

# Build the Vue.js application
RUN npm run build

# Production stage
FROM nginx:stable-alpine AS production-stage

# Copy built files to Nginx HTML directory
COPY --from=build-stage /app/dist /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Run Nginx
CMD ["nginx", "-g", "daemon off;"]
