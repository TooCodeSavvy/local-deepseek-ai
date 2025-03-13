# Gebruik een officiële Ubuntu basisimage
FROM ubuntu:20.04

# Zorg ervoor dat de pakketlijst altijd up-to-date is
RUN apt-get update && apt-get upgrade -y

# Installeer vereiste pakketten (zoals curl, wget, etc.)
RUN apt-get install -y \
    curl \
    wget \
    ca-certificates \
    lsb-release \
    gnupg2 \
    software-properties-common

# Installeer Ollama
RUN curl -fsSL https://ollama.com/install.sh | sh

# Maak een map voor je modellen
RUN mkdir -p /models

# Kopieer je model naar de container (zorg ervoor dat je model in de juiste map staat op je host)
COPY ./models /models

# Zet de omgeving voor Ollama in de container
ENV OLLAMA_MODEL_PATH=/models

# Zorg ervoor dat Ollama bereikbaar is via localhost
EXPOSE 8080

# Start Ollama
CMD ["ollama", "run", "deepseek-r1:14b"]
