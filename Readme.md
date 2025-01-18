# Vue Dashboard Project

## Overview
This project is a Vue.js application featuring a sidebar navigation system with two main pages: **Employees** and **Holidays**. Easy-to-navigate UI, and Docker support for seamless deployment.

---

## Features
- **Sidebar Navigation**: Navigate between Employees and Holidays pages.
- **Toggleable Sidebar**: Sidebar can be opened or collapsed.
- **Vue Router Integration**: Easy routing between pages.
- **Dockerized Deployment**: Effortlessly deploy the application using Docker.

---

## Prerequisites
Before setting up the project, ensure the following are installed on your system:
- [Node.js](https://nodejs.org/) (v16.x or higher)
- [npm](https://www.npmjs.com/) or [yarn](https://yarnpkg.com/)
- [Docker](https://www.docker.com/)

---

## Getting Started

### Clone the Repository
```bash
git clone https://github.com/sekarkeerth/zitro-task.git
cd <repository-folder>
```

### Install Dependencies
```bash
npm install
```

### Run the Development Server
```bash
npm run dev
```

Visit the app at `http://localhost:5173`.

---

## Project Structure
```
├── src
│   ├── assets
│   │   ├── main.css
│   │   ├── responsive.css
│   ├── components
│   │   ├── Header.vue
│   │   ├── Sidebar.vue
│   ├── views
│   │   ├── Employees.vue
│   │   ├── Holidays.vue
│   ├── App.vue
│   └── main.js
├── public
├── Dockerfile
├── .dockerignore
├── package.json
└── README.md
```

---

## Docker Deployment

### Step 1: Build Docker Image

1. Create a `Dockerfile` in the root directory with the following content:

```Dockerfile
# Build Stage
FROM node:lts-alpine as build-stage
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Production Stage
FROM nginx:stable-alpine as production-stage
COPY --from=build-stage /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
```

2. Build the Docker Image
```bash
docker build -t vue-dashboard .
```

### Step 2: Run the Docker Container
```bash
docker run -d -p 8080:80 vue-dashboard
```
### Step 3: Access the Application
Access the app at `http://localhost:8080`.

### Additional Docker Commands
- **Stop Running Container**: `docker stop <container-id>`
- **View Running Containers**: `docker ps`
- **Remove Docker Container**: `docker rm <container-id>`
- **Remove Docker Image**: `docker rmi vue-dashboard`

---

## Production Build
To create a production build manually:
```bash
npm run build
```
The output will be located in the `dist` folder.

---

## Technologies Used
- **Vue 3**: Frontend framework.
- **Vue Router**: For navigation between pages.
- **Vite**: Build tool for faster development and production builds.
- **FontAwesome**: For icons.
