# Use an official Ubuntu base image
FROM ubuntu:20.04

# Ensure the package list is always up to date
RUN apt-get update && apt-get upgrade -y

# Install required packages (such as curl, wget, etc.)
RUN apt-get install -y \
    curl \
    wget \
    ca-certificates \
    lsb-release \
    gnupg2 \
    software-properties-common

# Install Ollama
RUN curl -fsSL https://ollama.com/install.sh | sh

# Create a directory for your models
RUN mkdir -p /models

# Copy your model to the container (make sure your model is in the correct directory on your host)
COPY ./models /models

# Set the environment variable for Ollama's model path
ENV OLLAMA_MODEL_PATH=/models

# Expose the port to make Ollama accessible via localhost
EXPOSE 8080

# Start Ollama with the specified model
CMD ["ollama", "run", "deepseek-r1:14b"]
