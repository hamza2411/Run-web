#!/bin/bash
cd /home/network/hamza/TEST/BestBites/
# Variables
CONTAINER_NAME="zigron_1"
IMAGE_NAME="fedora:latest"
PORT="1001:80"   # Host:Container

# Step 1: Stop the previous container if it is running
if [ "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
    echo "Stopping the running container: $CONTAINER_NAME..."
    docker stop $CONTAINER_NAME
fi

# Step 2: Remove the container if it exists
if [ "$(docker ps -aq -f name=$CONTAINER_NAME)" ]; then
    echo "Removing the container: $CONTAINER_NAME..."
    docker rm $CONTAINER_NAME
fi

# Step 3: Build the new image
echo "Building the Docker image: $IMAGE_NAME..."
docker build -t $IMAGE_NAME .

# Step 4: Run the new container
echo "Running the container: $CONTAINER_NAME on port $PORT..."
docker run -d -p $PORT --name $CONTAINER_NAME $IMAGE_NAME

echo "Deployment complete. Your app is running on port $PORT."

