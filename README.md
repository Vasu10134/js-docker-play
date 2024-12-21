# js-docker-play
This project demonstrates how to Dockerize a simple JavaScript application and serve it using Nginx.

## How It Works
The project involves creating a Docker container for a JavaScript application using the following steps:

### Steps:
  
1. **Create a Project Directory:**
   - First, create a directory for the project files.
   - Inside the directory, add your JavaScript application (e.g., `index.html`, `app.js`).

2. **Create a Dockerfile:**
   - The `Dockerfile` contains instructions to build the Docker image:
   - Start with an `nginx:alpine` base image.
   - Copy the application files into the appropriate directory inside the container (`/usr/share/nginx/html`).

   Example `Dockerfile`:
   ```Dockerfile
   # Use the official Nginx image as base
   FROM nginx:alpine

   # Copy application files into the Nginx HTML directory
   COPY . /usr/share/nginx/html
   
3. **Build the Docker Image:**
- Once the Dockerfile is ready, build the Docker image using the following command:  
`docker build -t js-docker-app .`

4. **Run the Docker Container:**
- Run the container in detached mode, mapping the host port to the container's port 80:
`docker run -d -p 8080:80 --name js-docker-container js-docker-app`

5. **Access the Application:**
Open the browser and visit `http://localhost:8080` to view the JavaScript app served by Nginx.

## Requirements
- Docker installed on your machine
- Basic knowledge of Docker and JavaScript
