#!/bin/bash

# This script installs Docker, Docker Compose, and sets up the environment for running Ollama with DeepSeek models via OpenWebUI

echo "Checking if Docker is installed..."

# Check if Docker is already installed
if ! command -v docker &> /dev/null
then
    echo "Docker not found. Installing Docker..."

    # Install Docker (for Ubuntu/Debian systems)
    sudo apt-get update
    sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    sudo apt-get update
    sudo apt-get install -y docker-ce

    # Make sure Docker is running and set to start on boot
    sudo systemctl start docker
    sudo systemctl enable docker
    echo "Docker has been installed!"
else
    echo "Docker is already installed!"
fi

# Check if Docker Compose is installed
if ! command -v docker-compose &> /dev/null
then
    echo "Docker Compose not found. Installing Docker Compose..."

    # Install Docker Compose
    sudo curl -L "https://github.com/docker/compose/releases/download/$(curl -s https://api.github.com/repos/docker/compose/releases/latest | jq -r .tag_name)/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose

    echo "Docker Compose has been installed!"
else
    echo "Docker Compose is already installed!"
fi

# Create project directory for Docker and model files if it doesn't exist
PROJECT_DIR=~/docker/ollama-deepseek
if [ ! -d "$PROJECT_DIR" ]; then
    echo "Creating project directory at $PROJECT_DIR..."
    mkdir -p $PROJECT_DIR
fi
cd $PROJECT_DIR

# Pull the repository contents (optional, in case you want to pull the latest from your repo)
git pull origin main

# Start Docker containers with Docker Compose
echo "Starting Docker Compose containers..."
docker-compose up -d

# Check if the containers started successfully
if [ $? -eq 0 ]; then
    echo "The containers were successfully started!"
else
    echo "There was an error starting the containers."
    exit 1
fi

echo "You can now access OpenWebUI at http://<IP>:3000"
