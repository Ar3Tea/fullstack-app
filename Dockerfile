#==================== Building Stage ================================================

# Create the image based on the official Node 8.9.0 image from Dockerhub
FROM node:8.9.0 as react-build

# Create a directory where our app will be placed. This might not be necessary
RUN mkdir -p /fullstack-app

# Change directory so that our commands run inside this new directory
WORKDIR /fullstack-app

# Copy dependency definitions
COPY package.json /fullstack-app

# Install dependencies using npm
RUN npm install

# Get all the code needed to run the app
COPY . /fullstack-app
COPY . /fullstack-app/client
COPY . /fullstack-app/backend

WORKDIR /fullstack-app/client

RUN npm install

WORKDIR /fullstack-app/backend

RUN npm install

WORKDIR /fullstack-app

# Expose the port the app runs in
EXPOSE 3000

# Build the app
CMD npm start
